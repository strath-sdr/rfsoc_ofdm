__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import allocate
import numpy as np
import math
from .quick_widgets import DropDown
from .sdr_plots import TimePlot, ConstellationPlot, SpectrumAnalyser
from .dma_timer import DmaTimer


class Inspector(DefaultHierarchy):
    
    def __init__(self, description, plotting_rate = 0.4, autoscale = False, init_data = False, sample_freq = 20e6):
        super().__init__(description)
        
        self.data_inspector_module.packetsize = 64
        self.data_inspector_module.enable = 0
        self.data_inspector_module.reset = 0
        
        self._autoscale = autoscale
        self._plotting_rate = plotting_rate
        self.buffer = allocate(shape=(int(self.data_inspector_module.packetsize*2),), dtype=np.int16)
        
        if init_data:
            self._data = self.get_frame()
        else:
            self._data = np.zeros(self.data_inspector_module.packetsize, dtype=np.complex)
            
        self._t_plot = TimePlot(self._data, animation_period=0)
        self._c_plot = ConstellationPlot(self._data, animation_period=0)
        self._f_plot = SpectrumAnalyser(self._data, fs=sample_freq, animation_period=0)
        self._plot_controller = DmaTimer(self._update_data, self.get_frame, self._plotting_rate)
        
    def set_frequency(self, fs):
        self._f_plot.set_frequency(fs)
        
    def set_plotting_rate(self, rate):
        self._plotting_rate = rate
        self._plot_controller.t = rate
        
    def set_shape(self, shape):
        """Set the buffer shape by first freeing the existing buffer
        and then allocating a new buffer with the given tuple. Obtain the
        tuple product to set the packetsize of the data_inspector_module.
        """
        self.buffer.freebuffer()
        lshape = list(shape)
        lshape[0] = lshape[0] * 2
        tshape = tuple(lshape)
        self.buffer = allocate(shape=tshape, dtype=np.int16)       
        product = 1 
        for i in shape:  
            product *= i
        self.data_inspector_module.packetsize = product
        
    def get_frame(self):
        """Get a single buffer of time data from the logic fabric
        """
        self.data_inspector_module.reset = 0
        self.axi_dma.recvchannel.transfer(self.buffer)
        self.data_inspector_module.enable = 1
        self.axi_dma.recvchannel.wait()
        self.data_inspector_module.enable = 0
        self.data_inspector_module.reset = 1
        t_data = np.array(self.buffer) * 2**-14
        c_data = t_data[::2] + 1j * t_data[1::2]
        if self._autoscale:
            return self._scale_data(c_data)
        else:
            return c_data
    
    def _update_data(self, data):
        """Update the timer and constellation plots with new data"""
        self._data = data
        self._t_plot.update_data(data)
        self._c_plot.update_data(data)
        self._f_plot.update_data(data)
    
    def spectrum_plot(self):
        return self._f_plot.get_widget()
    
    def time_plot(self):
        """Returns a time plot of inspected data
        """
        return self._t_plot.get_widget()
    
    def constellation_plot(self):
        """Returns a constellation plot of inspected data
        """
        return self._c_plot.get_widget()
    
    def plot_control(self):
        """Return the plot controller
        """
        return self._plot_controller.get_widget()
    
    @staticmethod
    def checkhierarchy(description):
        if 'axi_dma' in description['ip'] \
           and 'data_inspector_module' in description['ip']:
            return True
        return False
    

class DualChannelInspector(Inspector):
    
    def __init__(self, description, plotting_rate = 0.4, autoscale = False, init_data = False, sample_freq = [20e6, 240e6]):
        
        def _callback_control(channel):
            self.channel_switch = channel
            
        super().__init__(description, plotting_rate, autoscale, init_data, sample_freq[0])
        
        self._current_channel = 0
        self.enable_switch()
        self.data = self.get_frame()
        self.channel_widget = DropDown(_callback_control,
                                       options=[('Channel 0', 0),
                                                ('Channel 1', 1)],
                                       value=0,
                                       description='Channel Select: ')
        self._sample_freq = sample_freq
        
    def disable_switch(self):
        self.axis_switch.write(0x40, int(2**31))
        self.update_switch()
        
    def enable_switch(self):
        self.axis_switch.write(0x40, self._current_channel)
        self.update_switch()
        
    def update_switch(self):
        self.axis_switch.write(0x00, 2)
        
    @property
    def channel_switch(self):
        return self._current_channel
        
    @channel_switch.setter
    def channel_switch(self, channel):
        self.axis_switch.write(0x40, int(channel))
        self.update_switch()
        self.channel_widget.value = channel
        self._current_channel = channel
        self.set_frequency(self._sample_freq[channel])
        
    @staticmethod
    def checkhierarchy(description):
        if 'axi_dma' in description['ip'] \
            and 'axis_switch' in description['ip'] \
            and 'data_inspector_module' in description['ip']:
            return True
        return False

        
class DataInspectorCore(DefaultIP):
    """Driver for Data Inspector's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
        
    def __init__(self, description):
        super().__init__(description=description)
            
    bindto = ['strathsdr.org:PYNQ-SDR:axis_packet_controller:1.0']
        
# LUT of property addresses for our data-driven properties
_dataInspector_props = [("reset", 0),
                        ("enable", 4),
                        ("packetsize", 8)]
    
# Function to return a MMIO Getter and Setter based on a relative address
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
        
    def _set(self, value):
        self.write(addr, value)
            
    return property(_get, _set)
    
# Generate getters and setters based on _dataInspector_props
for (name, addr) in _dataInspector_props:
    setattr(DataInspectorCore, name, _create_mmio_property(addr))
        

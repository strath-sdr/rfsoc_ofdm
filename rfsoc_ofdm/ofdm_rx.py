__author1__ = 'Lewis McLaughlin'
__author2__ = 'Douglas Allan'
__organisation__ = 'The University of Strathclyde'
__date__ = '22nd February 2021'
__version_name__ = ''
__version_number__ = '0.2'
__channels__ = 'Single-Channel'
__board__ = 'ZCU111'
__release__ = 'development'
__info__ = 'PYNQ on RFSoC: OFDM Transmit and Receive'
__support__ = '<a href="https://github.com/strath-sdr/rfsoc_ofdm" target="_blank" rel="noopener noreferrer">https://github.com/strath-sdr/rfsoc_ofdm</a>'

from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import allocate

import numpy as np

class OFDMRx(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.probes.frame_inspector_rx_1M.config_inspector(4096, np.uint32)
        self.probes.frame_inspector_shift_ch_est.config_inspector(64, np.uint32)
    
    def get_demod(self):
        return self.probes.frame_inspector_rx_1M.get_data(self.probes.dma_rx_1M)
    
    def get_channel_estimate(self):
        channel_estimate = self.probes.frame_inspector_shift_ch_est.get_frame(self.probes.dma_rx_ch_est)
        channel_estimate_mag = abs(channel_estimate)
        return np.flip(channel_estimate_mag)
        
    @staticmethod
    def checkhierarchy(description):
        if 'ofdm_rx'   in description['ip']:
            return True
        return False

    
class OFDMRxCore(DefaultIP):
    """Driver for Receiver core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["xilinx.com:ip:ofdm_rx:0.4"]
    
# LUT of property addresses for our data-driven properties
_ofdmrx_props = [("reset", 0x0), ("enable", 0x4)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _window_props
for (name, addr) in _ofdmrx_props:
    setattr(OFDMRxCore, name, _create_mmio_property(addr))

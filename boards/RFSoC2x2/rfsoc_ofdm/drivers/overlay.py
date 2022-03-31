from pynq import Overlay
import ipywidgets as ipw
#import signal
import os
import xrfdc
import xrfclk
from rfsoc_ofdm import inspector
from rfsoc_ofdm import ofdm

class Overlay(Overlay):
    """
    """
    
    def __init__(self, bitfile_name=None, init_rf_clks=True, **kwargs):
        """
        """

        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_ofdm.bit')

        super().__init__(bitfile_name, **kwargs)
        
        self.dac_tile = self.rfdc.dac_tiles[1]
        self.adc_tile = self.rfdc.adc_tiles[2]
        self.dac_block = self.dac_tile.blocks[0]
        self.adc_block = self.adc_tile.blocks[0]

        self.init_i2c()
        
        self.configure_clocks()
        self.configure_adcs()
        self.configure_dacs()
        
        self.inspectors = {'transmitter' : self.InspectorTransmitter,
                           'receiver' : self.InspectorReceiver,
                           'constellation' : self.InspectorConstellation}
          
        self.initialise_receiver()
        self.initialise_transmitter()

        self.configure_inspectors()
        self.start_constellation()
        

    def start_constellation(self):
        """
        """

        self.inspectors['constellation'].get_frame()

        
    def configure_clocks(self, lmk_freq=122.88, lmx_freq=384.00):
        """
        """
        
        xrfclk.set_ref_clks(lmk_freq=lmk_freq, lmx_freq=lmx_freq)
        
        
    def configure_adcs(self, pll_freq=384.00, sample_freq=3840.00, nyquist_zone=1, centre_freq=-600):
        """
        """
        
        self.adc_tile.DynamicPLLConfig(1, pll_freq, sample_freq)
        self.adc_block.NyquistZone = nyquist_zone
        self.adc_block.MixerSettings = {
            'CoarseMixFreq'  : xrfdc.COARSE_MIX_BYPASS,
            'EventSource'    : xrfdc.EVNT_SRC_TILE,
            'FineMixerScale' : xrfdc.MIXER_SCALE_1P0,
            'Freq'           : centre_freq,
            'MixerMode'      : xrfdc.MIXER_MODE_R2C,
            'MixerType'      : xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset'    : 0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        

    def configure_dacs(self, pll_freq=384.00, sample_freq=3840.00, nyquist_zone=1, centre_freq=600):
        """
        """
        
        self.dac_tile.DynamicPLLConfig(1, pll_freq, sample_freq)
        self.dac_block.NyquistZone = nyquist_zone
        self.dac_block.MixerSettings = {
            'CoarseMixFreq'  : xrfdc.COARSE_MIX_BYPASS,
            'EventSource'    : xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale' : xrfdc.MIXER_SCALE_1P0,
            'Freq'           : centre_freq,
            'MixerMode'      : xrfdc.MIXER_MODE_C2R,
            'MixerType'      : xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset'    : 0.0
        }
        self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.dac_tile.SetupFIFO(True)
        
        
    def configure_inspectors(self, shape=(1024,)):
        """
        """
        
        for inspector in self.inspectors.values():
            inspector.set_shape(shape=shape)
        
        
    def initialise_transmitter(self, enable=1, gain=1):
        """
        """
        
        self.ofdm_transmitter.reset = 1
        self.ofdm_transmitter.gain = 1
        self.ofdm_transmitter.transmit_enable = enable
        
    
    def initialise_receiver(self, enable=1, modulation='QPSK'):
        """
        """
        
        self.ofdm_receiver.reset = 1
        self.ofdm_receiver.receive_enable = enable
        self.ofdm_transmitter.modulation = modulation
        
        
    def ofdm_loopback_application(self):
        """
        """
        
        # Prepare children widgets for tab containers
        transmit_chtime = ipw.VBox([self.inspectors['transmitter'].time_plot(),
                                    ipw.HBox([self.inspectors['transmitter'].channel_widget.get_widget(),
                                              self.inspectors['transmitter'].plot_control()])])
        transmit_chfreq = ipw.VBox([self.inspectors['transmitter'].spectrum_plot(),
                                    ipw.HBox([self.inspectors['transmitter'].channel_widget.get_widget(),
                                              self.inspectors['transmitter'].plot_control()])])
        receive_chtime = ipw.VBox([self.inspectors['receiver'].time_plot(),
                                   ipw.HBox([self.inspectors['receiver'].channel_widget.get_widget(),
                                             self.inspectors['receiver'].plot_control()])])
        receive_chfreq = ipw.VBox([self.inspectors['receiver'].spectrum_plot(),
                                   ipw.HBox([self.inspectors['receiver'].channel_widget.get_widget(),
                                             self.inspectors['receiver'].plot_control()])])
        constellation_ch = ipw.VBox([self.inspectors['constellation'].constellation_plot(),
                                     ipw.HBox([self.ofdm_transmitter.modulation_dropdown.get_widget(),
                                               self.inspectors['constellation'].plot_control()])])
        
        # Create tab for inspection plots
        insp_tab_ch = [transmit_chfreq, transmit_chtime, receive_chfreq, receive_chtime]
        insp_tab = ipw.Tab()
        insp_tab.children = insp_tab_ch
        titles = ['Transmit Spectrum', 'Transmit Time', 'Receive Spectrum', 'Receive Time']
        [insp_tab.set_title(i, title) for i, title in enumerate(titles)]
        insp_tab.selected_index = 2

        # Create tab for demodulation inspection (constellation plot)
        iq_tab_ch = [constellation_ch]
        iq_tab = ipw.Tab()
        iq_tab.children = iq_tab_ch
        titles = ['Constellation']
        [iq_tab.set_title(i, title) for i, title in enumerate(titles)]

        # Configure application to launch with the following defaults
        self.inspectors['transmitter'].channel_widget.description = 'Observation Point: '
        self.inspectors['transmitter'].channel_widget.options = [('Symbols', 0), ('Interpolated', 1)]
        self.inspectors['transmitter'].channel_widget.value = 1
        self.inspectors['receiver'].channel_widget.description = 'Observation Point: '
        self.inspectors['receiver'].channel_widget.options = [('Symbols', 0), ('Decimated', 1)]
        self.inspectors['receiver'].channel_widget.value = 1
        self.ofdm_transmitter.modulation_dropdown.value = '16-QAM'
        
        # Attempt to start the OFDM constellation receiver
        #def timeout_handler(signum, frame):
        #    raise Exception("Function timeout.")
            
        #signal.signal(signal.SIGALRM, timeout_handler)
        #signal.alarm(5)
        #try:
        self.inspectors['constellation'].get_frame()
        #except Exception: 
        #    print("Inspection failed as synchronisation could not be performed. Please ensure that a loopback cable is connected and then restart the notebook.")
        #signal.alarm(0)
        
        # Start the application and return to notebook
        #self.inspectors['receiver']._plot_controller.start()
        #self.inspectors['transmitter']._plot_controller.start()
        #self.inspectors['constellation']._plot_controller.start()
        return ipw.HBox([insp_tab, iq_tab])
    

    def init_i2c(self):
        """Initialize the I2C control drivers on RFSoC2x2.
        This should happen after a bitstream is loaded since I2C reset
        is connected to PL pins. The I2C-related drivers are made loadable
        modules so they can be removed or inserted.
        """
        module_list = ['i2c_dev', 'i2c_mux_pca954x', 'i2c_mux']
        for module in module_list:
            cmd = "if lsmod | grep {0}; then rmmod {0}; fi".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Removing kernel module {} failed.'.format(module))

        module_list.reverse()
        for module in module_list:
            cmd = "modprobe {}".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Inserting kernel module {} failed.'.format(module))

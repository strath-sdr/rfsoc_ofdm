from pynq import DefaultIP
import numpy as np
from .quick_widgets import DropDown

switcher = {'BPSK'     : 0,
            'QPSK'     : 1,
            '8-PSK'    : 2,
            '16-QAM'   : 3,
            '32-QAM'   : 4,
            '64-QAM'   : 5,
            '128-QAM'  : 6,
            '256-QAM'  : 7,
            '512-QAM'  : 8,
            '1024-QAM' : 9}

class OFDMTxCore(DefaultIP):
    """Driver for Transmitter core logic IP
    """
    
    def __init__(self,description):
        
        def _callback_modulation(value):
            self.modulation = value
        
        super().__init__(description=description)
        
        self.modulation_dropdown = DropDown(callback=_callback_modulation,
                                            options=list(switcher.keys()),
                                            value='BPSK',
                                            description='Modulation Scheme: ')
        
    bindto = ["xilinx.com:ip:ofdm_tx:0.4"]
    
    @property
    def reset(self):
        return self.read(0x0)
        
    @reset.setter
    def reset(self, reset):
        self.write(0x0, reset)
        
    @property
    def modulation(self):
        global switcher
        scheme = self.read(0x100)
        return list(switcher.keys())[scheme]
        
    @modulation.setter
    def modulation(self, modulation):
        global switcher
        scheme = switcher.get(modulation)
        self.write(0x100, scheme)
        
    @property
    def transmit_enable(self):
        return self.read(0x104)
        
    @transmit_enable.setter
    def transmit_enable(self, transmit_enable):
        self.write(0x104, transmit_enable)
        
    @property
    def gain(self):
        scaled_gain = self.read(0x108)
        gain = scaled_gain/(2**30)
        return gain
        
    @gain.setter
    def gain(self, gain):
        scaled_gain = int(gain*2**30)
        self.write(0x108, scaled_gain)

class OFDMRxCore(DefaultIP):
    """Driver for Receiver core logic IP
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["xilinx.com:ip:ofdm_rx:0.4"]
    
    @property
    def reset(self):
        return self.read(0x0)
        
    @reset.setter
    def reset(self, reset):
        self.write(0x0, reset)
        
    @property
    def receive_enable(self):
        return self.read(0x0)
        
    @reset.setter
    def receive_enable(self, enable):
        self.write(0x0, enable)

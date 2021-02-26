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

from .data_inspector import *

class OFDMTx(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.mod = 5
        self.ofdm_tx.mod = self.mod
        self.ofdm_tx.enable = 1
        
        self.probes.data_inspector_tx_sym.config_inspector(16, np.uint32)
        self.probes.data_inspector_tx_1M.config_inspector(16, np.uint32)
        self.probes.data_inspector_tx_2M.config_inspector(32, np.uint32)
        self.probes.data_inspector_tx_4M.config_inspector(32, np.uint32)
    
    def get_tx_sym(self):
        return self.probes.data_inspector_tx_sym.get_data(self.probes.dma_tx_sym)
    
    def get_tx_1M(self):
        return self.probes.data_inspector_tx_1M.get_data(self.probes.dma_tx_1M)
    
    def get_tx_2M(self):
        return self.probes.data_inspector_tx_2M.get_data(self.probes.dma_tx_2M)
    
    def get_tx_4M(self):
        return self.probes.data_inspector_tx_4M.get_data(self.probes.dma_tx_4M)
    
    def set_modulation(self, mod):
        switcher = {
            'BPSK' : 0,
            'QPSK' : 1,
            '8-PSK' : 2,
            '16-QAM' : 3,
            '32-QAM' : 4,
            '64-QAM' : 5,
            '128-QAM' : 6,
            '256-QAM' : 7,
            '512-QAM' : 8,
            '1024-QAM' : 9
        }
        self.mod = switcher.get(mod, 0)
        self.ofdm_tx.mod = self.mod 

    
    @staticmethod
    def checkhierarchy(description):
        if 'ofdm_tx'   in description['ip']:
            return True
        return False
    
    
class OFDMTxCore(DefaultIP):
    """Driver for Transmitter core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["UoS:RFSoC_OFDM:ofdm_tx:0.6"]
    
# LUT of property addresses for our data-driven properties
_ofdmtx_props = [("reset", 0x00), ("mod", 0x100), ("enable", 0x104)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _window_props
for (name, addr) in _ofdmtx_props:
    setattr(OFDMTxCore, name, _create_mmio_property(addr))
    
    

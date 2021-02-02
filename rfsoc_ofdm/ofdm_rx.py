from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import allocate

import numpy as np

class OFDMRx(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.data_inspector_rx_1M.config_inspector(4096, np.uint32)
    
    def get_demod(self):
        return self.data_inspector_rx_1M.get_frame(self.dma_rx_1M)
        
    @staticmethod
    def checkhierarchy(description):
        if     'dma_rx_1M'    in description['ip'] \
           and 'ofdm_rx'   in description['ip'] \
           and 'data_inspector_rx_1M' in description['ip']:
            return True
        return False

    
class OFDMRxCore(DefaultIP):
    """Driver for Receiver core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["xilinx.com:ip:ofdm_rx:0.3"]
    
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

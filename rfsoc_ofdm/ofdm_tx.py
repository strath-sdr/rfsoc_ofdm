from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import allocate


class OFDMTx(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.ofdm_tx.mod = 0
        self.ofdm_tx.enable = 1
    
    def set_modulation(self, mod):
        switcher = {
            'BPSK' : 0,
            'QPSK' : 1,
            '8-PSK' : 2,
            '16-QAM' : 3,
            '32-QAM' : 4,
            '64-QAM' : 5,
            '128-QAM' : 6,
            '256-QAM' :7
        }
        num = switcher.get(mod, 0)
        self.ofdm_tx.mod = num 

    
    @staticmethod
    def checkhierarchy(description):
        if     'dma_tx'    in description['ip'] \
           and 'ofdm_tx'   in description['ip'] \
           and 'data_inspector_0' in description['ip']:
            return True
        return False
    
class OFDMTxCore(DefaultIP):
    """Driver for Transmitter core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["xilinx.com:ip:ofdm_tx:0.5"]
    
# LUT of property addresses for our data-driven properties
_window_props = [("mod", 0x100), ("enable", 0x104)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _window_props
for (name, addr) in _window_props:
    setattr(OFDMTxCore, name, _create_mmio_property(addr))
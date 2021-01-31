from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import allocate

import numpy as np

class OFDMRx(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
    
    def get_demod(self):
        return self.data_inspector_rx_1M.get_frame(self.dma_rx_1M)
        
    @staticmethod
    def checkhierarchy(description):
        if     'dma_rx_1M'    in description['ip'] \
           and 'ofdm_rx'   in description['ip'] \
           and 'data_inspector_rx_1M' in description['ip']:
            return True
        return False

    
class DataInspector(DefaultIP):

    def __init__(self, description, pkt_size, buf_dtype=np.uint32):
        super().__init__(description)
        
        # Init config register
        self.pkt_size = pkt_size 
        
        # Init buffer
        self.buf = allocate(shape=(pkt_size, ), dtype=buf_dtype)
    
    def _process_frame(self, frame):
        Q_int16 = np.asanyarray(frame >> 16, dtype=np.int16)
        Q_float = np.asanyarray(Q_int16, dtype=np.float64) / pow(2,14)

        I_int16 = np.asanyarray(frame & 0xFFFF, dtype=np.int16)
        I_float = np.asanyarray(I_int16, dtype=np.float64) / pow(2,14)

        IQ = I_float[0:-1] + 1j * Q_float[0:-1]
        return IQ
    
    def get_frame(self, dma):
        dma.recvchannel.transfer(self.buf)
        dma.recvchannel.wait()
        frame = self._process_frame(np.array(self.buf))
        return frame

    


# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)

    
# LUT of property addresses for our data-driven properties
_data_inspector_props = [
    ("pkt_size",     0x100 ),
]


# Generate getters and setters based on _data_inspector_props
for (name, addr) in _data_inspector_props:
    setattr(DataInspector, name, _create_mmio_property(addr))

    
class RxDemod(DataInspector):
    def __init__(self, description):
        super().__init__(description, 128)
    
    bindto = ['xilinx.com:ip:data_inspector:0.2']

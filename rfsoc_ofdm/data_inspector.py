from pynq import DefaultIP
import numpy as np
from pynq import allocate
 
class DataInspectorCore(DefaultIP):
    """Driver for Data InspectorCore's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """

    def __init__(self, description):
        super().__init__(description)
        
        # Init config register
        self.pkt_size = 16 
        
        # Init buffer
        self.buf_dtype = np.uint32
        self.buf = allocate(shape=(16, ), dtype=np.uint32)
        
    bindto = ['UoS:RFSoC_OFDM:data_inspector:0.3']
    
    def config_inspector(self, pkt_size, buf_dtype):
        self.pkt_size = pkt_size
        self.buf_dtype = buf_dtype
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


# LUT of property addresses for our data-driven properties
_data_inspector_props = [
    ("pkt_size",     0x100 ),
]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)

# Generate getters and setters based on _bandSelect_props
for (name, addr) in _data_inspector_props:
    setattr(DataInspectorCore, name, _create_mmio_property(addr))
    
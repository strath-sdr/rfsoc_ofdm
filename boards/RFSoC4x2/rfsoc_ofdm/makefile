all: block_design make_bitstream

block_design:
	vivado -mode batch -source make_block_design.tcl -notrace

make_bitstream:
	vivado -mode batch -source make_bitstream.tcl -notrace

clean:
	rm -rf block_design *.jou *.log NA .Xil

all: rfsoc2x2 rfsoc4x2 zcu111 zcu208 zcu216 tarball

rfsoc2x2:
	$(MAKE) -C boards/RFSoC2x2/rfsoc_ofdm/

zcu208:
	$(MAKE) -C boards/ZCU208/rfsoc_ofdm/

zcu216:
	$(MAKE) -C boards/ZCU216/rfsoc_ofdm/

rfsoc4x2:
	$(MAKE) -C boards/RFSoC4x2/rfsoc_ofdm/

zcu111:
	$(MAKE) -C boards/ZCU111/rfsoc_ofdm/

tarball:
	tar -czvf rfsoc_ofdm.tar.gz .

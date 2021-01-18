<img src="https://www.strath.ac.uk/media/1newwebsite/webteam/logos/xUoS_Logo_Horizontal.png.pagespeed.ic.M6gv_BmDx1.png" width="350">

# RFSoC OFDM Transceiver

## Introduction
Add a brief introduction that describes the repository and any associated work i.e. papers, other datasets.

<Add a .gif demonstrating a part of the work.>

## Quick Start
This repository is only compatible with [PYNQ images v2.6 and greater](https://github.com/Xilinx/PYNQ/releases) for the [ZCU111](https://www.xilinx.com/products/boards-and-kits/zcu111.html) and the [RFSoC2x2]().

Connect to the board with **Jupyter Lab** in a browser (not Jupyter Notebook) by using a web browser `https://<IP address>:9090/lab`.

Open a terminal in Jupyter Lab and run the following command:
```sh
pip3 install git+https://github.com/strath-sdr/rfsoc_ofdm
```

The notebook should now be available in the `rfstrath` folder in your Jupyter Workspace.
It is important that you use the Chrome web browser if possible as rendering performance is important.

## ZCU111 Setup
Describe the setup for the ZCU111.

## RFSoC2x2 Setup
Describe the setup for the RFSoC2x2.

## Using the Project Files
The following software is required to use the project files in this repository.
- Vivado Design Suite 2020.1
- System Generator for DSP
- MATLAB R2020a

### Vivado
This project can be built with Vivado from the command line. Open Vivado 2020.1 and execute the following into the tcl console:
```sh
cd /<repository-location>/StrathSDR-RFSoC-Template/boards/<board-name>/
make project
make block_design
make bitstream
```

Alternatively, you can run the entire project build by executing the following into the tcl console:
```sh
make all
```

## License
[BSD 3-Clause](/LICENSE)

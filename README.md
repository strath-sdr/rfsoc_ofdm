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

The notebook should now be available in the `strath-sdr/standalone/rfsoc-ofdm` folder in your Jupyter Workspace.
It is important that you use the Chrome web browser if possible as rendering performance is important.

Follow the remaining steps below for your development board to finish setting up the demonstration.

## ZCU111 Setup
We need to add a 384 MHz clock to the xrfclk package. We can simply overwrite __init__.py, with the changes.
```sh
mkdir /home/xilinx/GitHub
cd /home/xilinx/GitHub/
git clone https://github.com/dnorthcote/ZCU111-PYNQ
cd /home/xilinx/GitHub/ZCU111-PYNQ
cp /home/xilinx/GitHub/ZCU111-PYNQ/ZCU111/packages/xrfclk/pkg/xrfclk/__init__.py /usr/local/lib/python3.6/dist-packages/xrfclk/__init__.py
```

## RFSoC2x2 Setup
We need to add a 384 MHz clock to the xrfclk package. We can simply add a new text file with the required clock configuration.
```sh
mkdir /home/xilinx/GitHub
cd /home/xilinx/GitHub/
git clone https://github.com/dnorthcote/ZCU111-PYNQ
cd /home/xilinx/GitHub/ZCU111-PYNQ
cp /home/xilinx/GitHub/ZCU111-PYNQ/ZCU111/packages/xrfclk/pkg/xrfclk/LMX2594_384.txt /usr/local/lib/python3.6/dist-packages/xrfclk/LMX2594_384.txt
```

## Using the Project Files
The following software is required to use the project files in this repository.
- Vivado Design Suite 2020.1
- System Generator for DSP
- MATLAB R2020a

### Vivado
This project can be built with Vivado from the command line. Open Vivado 2020.1 and execute the following into the tcl console:
```sh
cd /<repository-location>/boards/<board-name>/rfsoc_ofdm/
make project
make block_design
make bitstream_file
```

Alternatively, you can run the entire project build by executing the following into the tcl console:
```sh
make all
```

## License
[BSD 3-Clause](/LICENSE)

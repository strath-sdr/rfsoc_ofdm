<img src="strathsdr_banner.png" width="100%">

# RFSoC OFDM Transceiver
This repository contains an RFSoC demonstration of an Orthogonal Frequency Division Multiplexing (OFDM) transceiver. The OFDM system is only compatible with [PYNQ images v2.7 and greater](https://github.com/Xilinx/PYNQ/releases) for the [ZCU111](https://www.xilinx.com/products/boards-and-kits/zcu111.html) and the [RFSoC2x2](http://rfsoc-pynq.io/).

<p align="center">
  <img src="demonstration.gif"/>
<p/>

## Quick Start
Follow the instructions below to install the OFDM demonstrator on your development board. **You will need to give your board access to the internet**.
* Power on your RFSoC development board with an SD Card containing a fresh PYNQ v2.7 image.
* Navigate to Jupyter Labs by opening a browser (preferably Chrome) and connecting to `http://<board_ip_address>:9090/lab`.
* We need to open a terminal in Jupyter Lab. Firstly, open a launcher window as shown in the figure below:

<p align="center">
  <img src="./open_jupyter_launcher.jpg" width="50%" height="50%" />
<p/>

* Now open a terminal in Jupyter as illustrated below:

<p align="center">
  <img src="./open_terminal_window.jpg" width="50%" height="50%" />
<p/>

* Now execute the following command in the terminal:

```sh
pip3 install git+https://github.com/strath-sdr/rfsoc_ofdm
```

The notebook should now be available in the `ofdm-demonstrator` folder in your Jupyter Workspace.
It is important that you use the Chrome web browser if possible as rendering performance is important.

## Using the Project Files
The following software is required to use the project files in this repository.
- Vivado Design Suite 2020.2
- MATLAB R2020a

### Vivado
This project can be built with Vivado from the command line. Open Vivado 2020.1 and execute the following into the tcl console:
```sh
cd /<repository-location>/boards/<board-name>/rfsoc_ofdm/
make block_design
make bitstream
```

Alternatively, you can run the entire project build by executing the following into the tcl console:
```sh
make all
```

## License
[BSD 3-Clause](/LICENSE)

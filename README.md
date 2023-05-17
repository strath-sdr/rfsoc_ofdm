<img src="strathsdr_banner.png" width="100%">

<table border="0" align="center">
    <tr border="0">
        <td align="center" width="50%" border="0">
            <img src="https://www.rfsocbook.com/wp-content/uploads/2022/12/RFSoC3D_v4-1433x1536.png" alt="oscthumb" style="width: 60%" border="0"/>
        </td>
        <td align="center" width="50%" border="0">
            <font size=7><b>Available Now!</b></font size> <br> <font size=5>Software Defined Radio with Zynq® UltraScale+ RFSoC</font size> <br> <font size=4><a href="https://rfsocbook.com/">Free Download</a> <br><a href="https://www.amazon.com/Software-Defined-Radio-Ultrascale-RFSoC/dp/1739588606?keywords=zynq+rfsoc&qid=1673452844&sprefix=%2Caps%2C137&sr=8-1&linkCode=ll1&tag=thzybo-20&linkId=0bf245a543fd4af4625086df4c190928&language=en_US&ref_=as_li_ss_tl">Printed Edition</a></font size>
        </td>
    </tr>
</table>

# RFSoC OFDM Transceiver
This repository contains an RFSoC demonstration of an Orthogonal Frequency Division Multiplexing (OFDM) transceiver. The OFDM system is only compatible with [PYNQ images v2.7 and greater](https://github.com/Xilinx/PYNQ/releases) for the following RFSoC development boards:
* [ZCU208](https://www.xilinx.com/products/boards-and-kits/zcu208.html),
* [ZCU216](https://www.xilinx.com/products/boards-and-kits/zcu216.html),
* [ZCU111](https://www.xilinx.com/products/boards-and-kits/zcu111.html),
* [RFSoC4x2](http://rfsoc-pynq.io/), 
* [RFSoC2x2](http://rfsoc-pynq.io/).

<p align="center">
  <img src="demonstration.gif"/>
<p/>

## Quick Start
Follow the instructions below to install the OFDM demonstrator on your development board. **You will need to give your board access to the internet**.
* Power on your RFSoC development board with an SD Card containing a fresh PYNQ v2.7 image or greater.
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
pip3 install https://github.com/strath-sdr/rfsoc_ofdm/releases/download/v0.3.4/rfsoc_ofdm.tar.gz
```

The notebook should now be available in the `rfsoc_ofdm` folder in your Jupyter Workspace.
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

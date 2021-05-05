# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {off}
	set DSPDevice {xczu28dr}
	set DSPFamily {zynquplus}
	set DSPPackage {ffvg1517}
	set DSPSpeed {-2-e}
	set FPGAClockPeriod 3.90625
	set GenerateTestBench 0
	set HDLLanguage {vhdl}
	set IPOOCCacheRootPath {C:/Users/david/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System_Generator_for_DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {2}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {}
	set IP_Revision {251130702}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User_Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {ofdm_rx_hw}
	set ProjectFiles {
		{{conv_pkg.vhd} -lib {xil_defaultlib}}
		{{synth_reg.vhd} -lib {xil_defaultlib}}
		{{synth_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{srl17e.vhd} -lib {xil_defaultlib}}
		{{srl33e.vhd} -lib {xil_defaultlib}}
		{{synth_reg_reg.vhd} -lib {xil_defaultlib}}
		{{single_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{xlclockdriver_rd.vhd} -lib {xil_defaultlib}}
		{{vivado_ip.tcl}}
		{{ofdm_rx_hw_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{ofdm_rx_hw.vhd} -lib {xil_defaultlib}}
		{{ofdm_rx_hw_clock.xdc}}
		{{ofdm_rx_hw.xdc}}
	}
	set SimPeriod 3.90625e-09
	set SimTime inf
	set SimulationTime {inf ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/GitHub/Forks/rfsoc_ofdm/boards/ip/models_1MHz/netlist}
	set TopLevelModule {ofdm_rx_hw}
	set TopLevelSimulinkHandle 0.000976563
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface s_axis_tvalid_re Name {s_axis_tvalid_re}
	dict set TopLevelPortInterface s_axis_tvalid_re Type Bool
	dict set TopLevelPortInterface s_axis_tvalid_re ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_tvalid_re BinaryPoint 0
	dict set TopLevelPortInterface s_axis_tvalid_re Width 1
	dict set TopLevelPortInterface s_axis_tvalid_re DatFile {ofdm_rx_hw_decimate_unique_decimation_unique_decimation_s_axis_tvalid_re.dat}
	dict set TopLevelPortInterface s_axis_tvalid_re IconText {s_axis_tvalid_re}
	dict set TopLevelPortInterface s_axis_tvalid_re Direction in
	dict set TopLevelPortInterface s_axis_tvalid_re Period 1
	dict set TopLevelPortInterface s_axis_tvalid_re Interface 0
	dict set TopLevelPortInterface s_axis_tvalid_re InterfaceName {}
	dict set TopLevelPortInterface s_axis_tvalid_re InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_tvalid_re ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface s_axis_tvalid_re Locs {}
	dict set TopLevelPortInterface s_axis_tvalid_re IOStandard {}
	dict set TopLevelPortInterface s_axis_tvalid_im Name {s_axis_tvalid_im}
	dict set TopLevelPortInterface s_axis_tvalid_im Type Bool
	dict set TopLevelPortInterface s_axis_tvalid_im ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_tvalid_im BinaryPoint 0
	dict set TopLevelPortInterface s_axis_tvalid_im Width 1
	dict set TopLevelPortInterface s_axis_tvalid_im DatFile {ofdm_rx_hw_decimate_unique_decimation_unique_decimation_s_axis_tvalid_im.dat}
	dict set TopLevelPortInterface s_axis_tvalid_im IconText {s_axis_tvalid_im}
	dict set TopLevelPortInterface s_axis_tvalid_im Direction in
	dict set TopLevelPortInterface s_axis_tvalid_im Period 1
	dict set TopLevelPortInterface s_axis_tvalid_im Interface 0
	dict set TopLevelPortInterface s_axis_tvalid_im InterfaceName {}
	dict set TopLevelPortInterface s_axis_tvalid_im InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_tvalid_im ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface s_axis_tvalid_im Locs {}
	dict set TopLevelPortInterface s_axis_tvalid_im IOStandard {}
	dict set TopLevelPortInterface s_axis_tdata_re Name {s_axis_tdata_re}
	dict set TopLevelPortInterface s_axis_tdata_re Type UFix_128_0
	dict set TopLevelPortInterface s_axis_tdata_re ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_tdata_re BinaryPoint 0
	dict set TopLevelPortInterface s_axis_tdata_re Width 128
	dict set TopLevelPortInterface s_axis_tdata_re DatFile {ofdm_rx_hw_decimate_unique_decimation_unique_decimation_s_axis_tdata_re.dat}
	dict set TopLevelPortInterface s_axis_tdata_re IconText {s_axis_tdata_re}
	dict set TopLevelPortInterface s_axis_tdata_re Direction in
	dict set TopLevelPortInterface s_axis_tdata_re Period 1
	dict set TopLevelPortInterface s_axis_tdata_re Interface 0
	dict set TopLevelPortInterface s_axis_tdata_re InterfaceName {}
	dict set TopLevelPortInterface s_axis_tdata_re InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_tdata_re ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface s_axis_tdata_re Locs {}
	dict set TopLevelPortInterface s_axis_tdata_re IOStandard {}
	dict set TopLevelPortInterface s_axis_tdata_im Name {s_axis_tdata_im}
	dict set TopLevelPortInterface s_axis_tdata_im Type UFix_128_0
	dict set TopLevelPortInterface s_axis_tdata_im ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_tdata_im BinaryPoint 0
	dict set TopLevelPortInterface s_axis_tdata_im Width 128
	dict set TopLevelPortInterface s_axis_tdata_im DatFile {ofdm_rx_hw_decimate_unique_decimation_unique_decimation_s_axis_tdata_im.dat}
	dict set TopLevelPortInterface s_axis_tdata_im IconText {s_axis_tdata_im}
	dict set TopLevelPortInterface s_axis_tdata_im Direction in
	dict set TopLevelPortInterface s_axis_tdata_im Period 1
	dict set TopLevelPortInterface s_axis_tdata_im Interface 0
	dict set TopLevelPortInterface s_axis_tdata_im InterfaceName {}
	dict set TopLevelPortInterface s_axis_tdata_im InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_tdata_im ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface s_axis_tdata_im Locs {}
	dict set TopLevelPortInterface s_axis_tdata_im IOStandard {}
	dict set TopLevelPortInterface data Name {data}
	dict set TopLevelPortInterface data Type UFix_32_0
	dict set TopLevelPortInterface data ArithmeticType xlUnsigned
	dict set TopLevelPortInterface data BinaryPoint 0
	dict set TopLevelPortInterface data Width 32
	dict set TopLevelPortInterface data DatFile {ofdm_rx_hw_decimate_unique_decimation_unique_decimation_data.dat}
	dict set TopLevelPortInterface data IconText {data}
	dict set TopLevelPortInterface data Direction out
	dict set TopLevelPortInterface data Period 256
	dict set TopLevelPortInterface data Interface 0
	dict set TopLevelPortInterface data InterfaceName {}
	dict set TopLevelPortInterface data InterfaceString {DATA}
	dict set TopLevelPortInterface data ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface data Locs {}
	dict set TopLevelPortInterface data IOStandard {}
	dict set TopLevelPortInterface valid Name {valid}
	dict set TopLevelPortInterface valid Type Bool
	dict set TopLevelPortInterface valid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface valid BinaryPoint 0
	dict set TopLevelPortInterface valid Width 1
	dict set TopLevelPortInterface valid DatFile {ofdm_rx_hw_decimate_unique_decimation_unique_decimation_valid.dat}
	dict set TopLevelPortInterface valid IconText {valid}
	dict set TopLevelPortInterface valid Direction out
	dict set TopLevelPortInterface valid Period 256
	dict set TopLevelPortInterface valid Interface 0
	dict set TopLevelPortInterface valid InterfaceName {}
	dict set TopLevelPortInterface valid InterfaceString {DATA}
	dict set TopLevelPortInterface valid ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface valid Locs {}
	dict set TopLevelPortInterface valid IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {ofdm_rx_hw}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project
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
	set IP_Revision {251203471}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User_Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {ofdm_tx_hw}
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
		{{ofdm_tx_hw_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{ofdm_tx_hw.vhd} -lib {xil_defaultlib}}
		{{ofdm_tx_hw_clock.xdc}}
		{{ofdm_tx_hw.xdc}}
	}
	set SimPeriod 3.90625e-09
	set SimTime inf
	set SimulationTime {inf ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/GitHub/Forks/rfsoc_ofdm/boards/ip/models_1MHz/netlist}
	set TopLevelModule {ofdm_tx_hw}
	set TopLevelSimulinkHandle 0.00109863
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface valid Name {valid}
	dict set TopLevelPortInterface valid Type Bool
	dict set TopLevelPortInterface valid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface valid BinaryPoint 0
	dict set TopLevelPortInterface valid Width 1
	dict set TopLevelPortInterface valid DatFile {ofdm_tx_hw_interpolate_valid.dat}
	dict set TopLevelPortInterface valid IconText {valid}
	dict set TopLevelPortInterface valid Direction in
	dict set TopLevelPortInterface valid Period 256
	dict set TopLevelPortInterface valid Interface 0
	dict set TopLevelPortInterface valid InterfaceName {}
	dict set TopLevelPortInterface valid InterfaceString {DATA}
	dict set TopLevelPortInterface valid ClockDomain {ofdm_tx_hw}
	dict set TopLevelPortInterface valid Locs {}
	dict set TopLevelPortInterface valid IOStandard {}
	dict set TopLevelPortInterface data Name {data}
	dict set TopLevelPortInterface data Type UFix_32_0
	dict set TopLevelPortInterface data ArithmeticType xlUnsigned
	dict set TopLevelPortInterface data BinaryPoint 0
	dict set TopLevelPortInterface data Width 32
	dict set TopLevelPortInterface data DatFile {ofdm_tx_hw_interpolate_data.dat}
	dict set TopLevelPortInterface data IconText {data}
	dict set TopLevelPortInterface data Direction in
	dict set TopLevelPortInterface data Period 256
	dict set TopLevelPortInterface data Interface 0
	dict set TopLevelPortInterface data InterfaceName {}
	dict set TopLevelPortInterface data InterfaceString {DATA}
	dict set TopLevelPortInterface data ClockDomain {ofdm_tx_hw}
	dict set TopLevelPortInterface data Locs {}
	dict set TopLevelPortInterface data IOStandard {}
	dict set TopLevelPortInterface m_axis_tdata Name {m_axis_tdata}
	dict set TopLevelPortInterface m_axis_tdata Type UFix_64_0
	dict set TopLevelPortInterface m_axis_tdata ArithmeticType xlUnsigned
	dict set TopLevelPortInterface m_axis_tdata BinaryPoint 0
	dict set TopLevelPortInterface m_axis_tdata Width 64
	dict set TopLevelPortInterface m_axis_tdata DatFile {ofdm_tx_hw_interpolate_m_axis_tdata.dat}
	dict set TopLevelPortInterface m_axis_tdata IconText {m_axis_tdata}
	dict set TopLevelPortInterface m_axis_tdata Direction out
	dict set TopLevelPortInterface m_axis_tdata Period 1
	dict set TopLevelPortInterface m_axis_tdata Interface 0
	dict set TopLevelPortInterface m_axis_tdata InterfaceName {}
	dict set TopLevelPortInterface m_axis_tdata InterfaceString {DATA}
	dict set TopLevelPortInterface m_axis_tdata ClockDomain {ofdm_tx_hw}
	dict set TopLevelPortInterface m_axis_tdata Locs {}
	dict set TopLevelPortInterface m_axis_tdata IOStandard {}
	dict set TopLevelPortInterface m_axis_tvalid Name {m_axis_tvalid}
	dict set TopLevelPortInterface m_axis_tvalid Type Bool
	dict set TopLevelPortInterface m_axis_tvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface m_axis_tvalid BinaryPoint 0
	dict set TopLevelPortInterface m_axis_tvalid Width 1
	dict set TopLevelPortInterface m_axis_tvalid DatFile {ofdm_tx_hw_interpolate_m_axis_tvalid.dat}
	dict set TopLevelPortInterface m_axis_tvalid IconText {m_axis_tvalid}
	dict set TopLevelPortInterface m_axis_tvalid Direction out
	dict set TopLevelPortInterface m_axis_tvalid Period 1
	dict set TopLevelPortInterface m_axis_tvalid Interface 0
	dict set TopLevelPortInterface m_axis_tvalid InterfaceName {}
	dict set TopLevelPortInterface m_axis_tvalid InterfaceString {DATA}
	dict set TopLevelPortInterface m_axis_tvalid ClockDomain {ofdm_tx_hw}
	dict set TopLevelPortInterface m_axis_tvalid Locs {}
	dict set TopLevelPortInterface m_axis_tvalid IOStandard {}
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
	dict set TopLevelPortInterface clk ClockDomain {ofdm_tx_hw}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project
--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Thu May  6 10:44:55 2021
--Host        : DESKTOP-2K5Q0I9 running 64-bit major release  (build 9200)
--Command     : generate_target ofdm_tx_hw_bd.bd
--Design      : ofdm_tx_hw_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ofdm_tx_hw_bd is
  port (
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    valid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ofdm_tx_hw_bd : entity is "ofdm_tx_hw_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ofdm_tx_hw_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of ofdm_tx_hw_bd : entity is "ofdm_tx_hw_bd.hwdef";
end ofdm_tx_hw_bd;

architecture STRUCTURE of ofdm_tx_hw_bd is
  component ofdm_tx_hw_bd_ofdm_tx_hw_1_0 is
  port (
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    valid : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component ofdm_tx_hw_bd_ofdm_tx_hw_1_0;
  signal clk_1 : STD_LOGIC;
  signal data_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ofdm_tx_hw_1_m_axis_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ofdm_tx_hw_1_m_axis_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal valid_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF m_axis, CLK_DOMAIN ofdm_tx_hw_bd_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of data : signal is "xilinx.com:signal:data:1.0 DATA.DATA DATA";
  attribute X_INTERFACE_PARAMETER of data : signal is "XIL_INTERFACENAME DATA.DATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME m_axis, CLK_DOMAIN ofdm_tx_hw_bd_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of valid : signal is "xilinx.com:signal:data:1.0 DATA.VALID DATA";
  attribute X_INTERFACE_PARAMETER of valid : signal is "XIL_INTERFACENAME DATA.VALID, LAYERED_METADATA undef";
begin
  clk_1 <= clk;
  data_1(31 downto 0) <= data(31 downto 0);
  m_axis_tdata(63 downto 0) <= ofdm_tx_hw_1_m_axis_TDATA(63 downto 0);
  m_axis_tvalid(0) <= ofdm_tx_hw_1_m_axis_TVALID(0);
  valid_1(0) <= valid(0);
ofdm_tx_hw_1: component ofdm_tx_hw_bd_ofdm_tx_hw_1_0
     port map (
      clk => clk_1,
      data(31 downto 0) => data_1(31 downto 0),
      m_axis_tdata(63 downto 0) => ofdm_tx_hw_1_m_axis_TDATA(63 downto 0),
      m_axis_tvalid(0) => ofdm_tx_hw_1_m_axis_TVALID(0),
      valid(0) => valid_1(0)
    );
end STRUCTURE;

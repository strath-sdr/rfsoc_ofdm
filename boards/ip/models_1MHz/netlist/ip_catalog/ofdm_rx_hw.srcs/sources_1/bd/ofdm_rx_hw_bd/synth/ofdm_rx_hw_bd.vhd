--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Wed May  5 14:31:53 2021
--Host        : DESKTOP-2K5Q0I9 running 64-bit major release  (build 9200)
--Command     : generate_target ofdm_rx_hw_bd.bd
--Design      : ofdm_rx_hw_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ofdm_rx_hw_bd is
  port (
    clk : in STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_im_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_im_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_re_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    valid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ofdm_rx_hw_bd : entity is "ofdm_rx_hw_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ofdm_rx_hw_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of ofdm_rx_hw_bd : entity is "ofdm_rx_hw_bd.hwdef";
end ofdm_rx_hw_bd;

architecture STRUCTURE of ofdm_rx_hw_bd is
  component ofdm_rx_hw_bd_ofdm_rx_hw_1_0 is
  port (
    s_axis_tdata_im : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tdata_re : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tvalid_im : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tvalid_re : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component ofdm_rx_hw_bd_ofdm_rx_hw_1_0;
  signal clk_1 : STD_LOGIC;
  signal ofdm_rx_hw_1_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ofdm_rx_hw_1_valid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axis_im_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal s_axis_im_1_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axis_re_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal s_axis_re_1_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF s_axis_im:s_axis_re, CLK_DOMAIN ofdm_rx_hw_bd_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of data : signal is "xilinx.com:signal:data:1.0 DATA.DATA DATA";
  attribute X_INTERFACE_PARAMETER of data : signal is "XIL_INTERFACENAME DATA.DATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s_axis_im_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_im TDATA";
  attribute X_INTERFACE_PARAMETER of s_axis_im_tdata : signal is "XIL_INTERFACENAME s_axis_im, CLK_DOMAIN ofdm_rx_hw_bd_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axis_im_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_im TVALID";
  attribute X_INTERFACE_INFO of s_axis_re_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_re TDATA";
  attribute X_INTERFACE_PARAMETER of s_axis_re_tdata : signal is "XIL_INTERFACENAME s_axis_re, CLK_DOMAIN ofdm_rx_hw_bd_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axis_re_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_re TVALID";
  attribute X_INTERFACE_INFO of valid : signal is "xilinx.com:signal:data:1.0 DATA.VALID DATA";
  attribute X_INTERFACE_PARAMETER of valid : signal is "XIL_INTERFACENAME DATA.VALID, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
begin
  clk_1 <= clk;
  data(31 downto 0) <= ofdm_rx_hw_1_data(31 downto 0);
  s_axis_im_1_TDATA(127 downto 0) <= s_axis_im_tdata(127 downto 0);
  s_axis_im_1_TVALID(0) <= s_axis_im_tvalid(0);
  s_axis_re_1_TDATA(127 downto 0) <= s_axis_re_tdata(127 downto 0);
  s_axis_re_1_TVALID(0) <= s_axis_re_tvalid(0);
  valid(0) <= ofdm_rx_hw_1_valid(0);
ofdm_rx_hw_1: component ofdm_rx_hw_bd_ofdm_rx_hw_1_0
     port map (
      clk => clk_1,
      data(31 downto 0) => ofdm_rx_hw_1_data(31 downto 0),
      s_axis_tdata_im(127 downto 0) => s_axis_im_1_TDATA(127 downto 0),
      s_axis_tdata_re(127 downto 0) => s_axis_re_1_TDATA(127 downto 0),
      s_axis_tvalid_im(0) => s_axis_im_1_TVALID(0),
      s_axis_tvalid_re(0) => s_axis_re_1_TVALID(0),
      valid(0) => ofdm_rx_hw_1_valid(0)
    );
end STRUCTURE;

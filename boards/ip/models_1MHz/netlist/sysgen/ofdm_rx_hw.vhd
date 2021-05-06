-- Generated from Simulink block OFDM_Rx_HW/decimate/Unique Decimation/Unique Decimation/FIR Decimator Unique
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_fir_decimator_unique is
  port (
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_128 : in std_logic;
    ce_128 : in std_logic;
    clk_256 : in std_logic;
    ce_256 : in std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_fir_decimator_unique;
architecture structural of ofdm_rx_hw_fir_decimator_unique is 
  signal fir_stage_unique_m_axis_data_tdata_path0_net : std_logic_vector( 33-1 downto 0 );
  signal fir_stage_unique_m_axis_data_tdata_path1_net : std_logic_vector( 33-1 downto 0 );
  signal fir_stage_unique_s_axis_data_tready_net : std_logic;
  signal fir_stage_unique_m_axis_data_tvalid_net : std_logic;
  signal down_sample_q_net : std_logic_vector( 16-1 downto 0 );
  signal convert7_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert8_dout_net : std_logic_vector( 16-1 downto 0 );
  signal down_sample1_q_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal ce_net_x0 : std_logic;
  signal clk_net : std_logic;
  signal clk_net_x0 : std_logic;
begin
  re_data_out <= convert7_dout_net;
  im_data_out <= convert8_dout_net;
  down_sample_q_net <= re_data_in;
  down_sample1_q_net <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_128;
  src_ce_net <= ce_128;
  clk_net_x0 <= clk_256;
  ce_net_x0 <= ce_256;
  convert7 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_unique_m_axis_data_tdata_path1_net,
    clk => clk_net_x0,
    ce => ce_net_x0,
    dout => convert7_dout_net
  );
  convert8 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_unique_m_axis_data_tdata_path0_net,
    clk => clk_net_x0,
    ce => ce_net_x0,
    dout => convert8_dout_net
  );
  fir_stage_unique : entity xil_defaultlib.xlfir_compiler_eb3091b802170fba68a5d5df50db1f28 
  port map (
    s_axis_data_tdata_path1 => down_sample_q_net,
    s_axis_data_tdata_path0 => down_sample1_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => clk_net,
    ce => ce_net,
    clk_128 => src_clk_net,
    ce_128 => src_ce_net,
    clk_256 => clk_net_x0,
    ce_256 => ce_net_x0,
    clk_logic_128 => src_clk_net,
    ce_logic_128 => src_ce_net,
    s_axis_data_tready => fir_stage_unique_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_stage_unique_m_axis_data_tvalid_net,
    m_axis_data_tdata_path1 => fir_stage_unique_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_stage_unique_m_axis_data_tdata_path0_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/decimate/Unique Decimation/Unique Decimation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_unique_decimation_x0 is
  port (
    s_axis_tdata_im : in std_logic_vector( 128-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 128-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_128 : in std_logic;
    ce_128 : in std_logic;
    clk_256 : in std_logic;
    ce_256 : in std_logic;
    data : out std_logic_vector( 32-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_rx_hw_unique_decimation_x0;
architecture structural of ofdm_rx_hw_unique_decimation_x0 is 
  signal s_axis_tdata_re_net : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal down_sample_q_net : std_logic_vector( 16-1 downto 0 );
  signal down_sample1_q_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal convert8_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal ce_net : std_logic;
  signal s_axis_tdata_im_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert7_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net_x0 : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tvalid_im_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
begin
  data <= concat_y_net;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tvalid_im_net <= s_axis_tvalid_im;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  valid <= constant_op_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_128;
  src_ce_net <= ce_128;
  clk_net_x0 <= clk_256;
  ce_net_x0 <= ce_256;
  fir_decimator_unique : entity xil_defaultlib.ofdm_rx_hw_fir_decimator_unique 
  port map (
    re_data_in => down_sample_q_net,
    im_data_in => down_sample1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_128 => src_clk_net,
    ce_128 => src_ce_net,
    clk_256 => clk_net_x0,
    ce_256 => ce_net_x0,
    re_data_out => convert7_dout_net,
    im_data_out => convert8_dout_net
  );
  concat : entity xil_defaultlib.sysgen_concat_3d7bdf0cdd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret3_output_port_net,
    in1 => reinterpret2_output_port_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_5b4788cbba 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  down_sample : entity xil_defaultlib.ofdm_rx_hw_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    ds_ratio => 128,
    latency => 1,
    phase => 127,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => src_clk_net,
    dest_ce => src_ce_net,
    q => down_sample_q_net
  );
  down_sample1 : entity xil_defaultlib.ofdm_rx_hw_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    ds_ratio => 128,
    latency => 1,
    phase => 127,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register1_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => src_clk_net,
    dest_ce => src_ce_net,
    q => down_sample1_q_net
  );
  register_x0 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    rst => "0",
    d => reinterpret_output_port_net,
    en => s_axis_tvalid_re_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    rst => "0",
    d => reinterpret1_output_port_net,
    en => s_axis_tvalid_im_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_d2f2e7328b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_d2f2e7328b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_e02df9f1cb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert7_dout_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_e02df9f1cb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert8_dout_net,
    output_port => reinterpret3_output_port_net
  );
  slice : entity xil_defaultlib.ofdm_rx_hw_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => s_axis_tdata_re_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.ofdm_rx_hw_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => s_axis_tdata_im_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/decimate/Unique Decimation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_unique_decimation is
  port (
    s_axis_tdata_im : in std_logic_vector( 128-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 128-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_128 : in std_logic;
    ce_128 : in std_logic;
    clk_256 : in std_logic;
    ce_256 : in std_logic;
    data : out std_logic_vector( 32-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_rx_hw_unique_decimation;
architecture structural of ofdm_rx_hw_unique_decimation is 
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tdata_im_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_tvalid_im_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal s_axis_tdata_re_net : std_logic_vector( 128-1 downto 0 );
  signal src_ce_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal ce_net_x0 : std_logic;
  signal src_clk_net : std_logic;
begin
  data <= concat_y_net;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tvalid_im_net <= s_axis_tvalid_im;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  valid <= constant_op_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_128;
  src_ce_net <= ce_128;
  clk_net_x0 <= clk_256;
  ce_net_x0 <= ce_256;
  unique_decimation : entity xil_defaultlib.ofdm_rx_hw_unique_decimation_x0 
  port map (
    s_axis_tdata_im => s_axis_tdata_im_net,
    s_axis_tdata_re => s_axis_tdata_re_net,
    s_axis_tvalid_im => s_axis_tvalid_im_net,
    s_axis_tvalid_re => s_axis_tvalid_re_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_128 => src_clk_net,
    ce_128 => src_ce_net,
    clk_256 => clk_net_x0,
    ce_256 => ce_net_x0,
    data => concat_y_net,
    valid => constant_op_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/decimate
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_decimate is
  port (
    s_axis_tdata_im : in std_logic_vector( 128-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 128-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_128 : in std_logic;
    ce_128 : in std_logic;
    clk_256 : in std_logic;
    ce_256 : in std_logic;
    data : out std_logic_vector( 32-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_rx_hw_decimate;
architecture structural of ofdm_rx_hw_decimate is 
  signal s_axis_tdata_re_net : std_logic_vector( 128-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal s_axis_tdata_im_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_tvalid_im_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal ce_net_x0 : std_logic;
begin
  data <= concat_y_net;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tvalid_im_net <= s_axis_tvalid_im;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  valid <= constant_op_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_128;
  src_ce_net <= ce_128;
  clk_net_x0 <= clk_256;
  ce_net_x0 <= ce_256;
  unique_decimation : entity xil_defaultlib.ofdm_rx_hw_unique_decimation 
  port map (
    s_axis_tdata_im => s_axis_tdata_im_net,
    s_axis_tdata_re => s_axis_tdata_re_net,
    s_axis_tvalid_im => s_axis_tvalid_im_net,
    s_axis_tvalid_re => s_axis_tvalid_re_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_128 => src_clk_net,
    ce_128 => src_ce_net,
    clk_256 => clk_net_x0,
    ce_256 => ce_net_x0,
    data => concat_y_net,
    valid => constant_op_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_struct is
  port (
    s_axis_tdata_im : in std_logic_vector( 128-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 128-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_128 : in std_logic;
    ce_128 : in std_logic;
    clk_256 : in std_logic;
    ce_256 : in std_logic;
    data : out std_logic_vector( 32-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_rx_hw_struct;
architecture structural of ofdm_rx_hw_struct is 
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal s_axis_tvalid_im_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_im_net : std_logic_vector( 128-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal ce_net_x0 : std_logic;
  signal src_clk_net : std_logic;
begin
  data <= concat_y_net;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tvalid_im_net <= s_axis_tvalid_im;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  valid <= constant_op_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_128;
  src_ce_net <= ce_128;
  clk_net_x0 <= clk_256;
  ce_net_x0 <= ce_256;
  decimate : entity xil_defaultlib.ofdm_rx_hw_decimate 
  port map (
    s_axis_tdata_im => s_axis_tdata_im_net,
    s_axis_tdata_re => s_axis_tdata_re_net,
    s_axis_tvalid_im => s_axis_tvalid_im_net,
    s_axis_tvalid_re => s_axis_tvalid_re_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_128 => src_clk_net,
    ce_128 => src_ce_net,
    clk_256 => clk_net_x0,
    ce_256 => ce_net_x0,
    data => concat_y_net,
    valid => constant_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_default_clock_driver is
  port (
    ofdm_rx_hw_sysclk : in std_logic;
    ofdm_rx_hw_sysce : in std_logic;
    ofdm_rx_hw_sysclr : in std_logic;
    ofdm_rx_hw_clk1 : out std_logic;
    ofdm_rx_hw_ce1 : out std_logic;
    ofdm_rx_hw_clk128 : out std_logic;
    ofdm_rx_hw_ce128 : out std_logic;
    ofdm_rx_hw_clk256 : out std_logic;
    ofdm_rx_hw_ce256 : out std_logic
  );
end ofdm_rx_hw_default_clock_driver;
architecture structural of ofdm_rx_hw_default_clock_driver is 
begin
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk1,
    ce => ofdm_rx_hw_ce1
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 128,
    log_2_period => 8
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk128,
    ce => ofdm_rx_hw_ce128
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 256,
    log_2_period => 9
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk256,
    ce => ofdm_rx_hw_ce256
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw is
  port (
    s_axis_tdata_im : in std_logic_vector( 128-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 128-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    data : out std_logic_vector( 32-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_rx_hw;
architecture structural of ofdm_rx_hw is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "ofdm_rx_hw,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=3.90625,system_simulink_period=3.90625e-09,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=inf,concat=1,constant=1,convert=2,dsamp=2,fir_compiler_v7_2=1,register=2,reinterpret=4,slice=2,}";
  signal ce_1_net : std_logic;
  signal ce_256_net : std_logic;
  signal clk_1_net : std_logic;
  signal clk_128_net : std_logic;
  signal clk_256_net : std_logic;
  signal ce_128_net : std_logic;
begin
  ofdm_rx_hw_default_clock_driver : entity xil_defaultlib.ofdm_rx_hw_default_clock_driver 
  port map (
    ofdm_rx_hw_sysclk => clk,
    ofdm_rx_hw_sysce => '1',
    ofdm_rx_hw_sysclr => '0',
    ofdm_rx_hw_clk1 => clk_1_net,
    ofdm_rx_hw_ce1 => ce_1_net,
    ofdm_rx_hw_clk128 => clk_128_net,
    ofdm_rx_hw_ce128 => ce_128_net,
    ofdm_rx_hw_clk256 => clk_256_net,
    ofdm_rx_hw_ce256 => ce_256_net
  );
  ofdm_rx_hw_struct : entity xil_defaultlib.ofdm_rx_hw_struct 
  port map (
    s_axis_tdata_im => s_axis_tdata_im,
    s_axis_tdata_re => s_axis_tdata_re,
    s_axis_tvalid_im => s_axis_tvalid_im,
    s_axis_tvalid_re => s_axis_tvalid_re,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_128 => clk_128_net,
    ce_128 => ce_128_net,
    clk_256 => clk_256_net,
    ce_256 => ce_256_net,
    data => data,
    valid => valid
  );
end structural;

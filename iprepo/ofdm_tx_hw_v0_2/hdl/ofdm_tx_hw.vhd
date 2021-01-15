-- Generated from Simulink block OFDM_Tx_HW/interpolate/HB_SSR_im
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_hb_ssr_im is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo_1 : out std_logic_vector( 31-1 downto 0 );
    tdo_2 : out std_logic_vector( 31-1 downto 0 )
  );
end ofdm_tx_hw_hb_ssr_im;
architecture structural of ofdm_tx_hw_hb_ssr_im is 
  signal register7_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal register9_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  register9_q_net <= tvi;
  register7_q_net <= tdi;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_5fb68143c4a03ebc48b9a50b086a9361 
  port map (
    s_axis_data_tvalid => register9_q_net(0),
    s_axis_data_tdata_real => register7_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/HB_SSR_re
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_hb_ssr_re is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo_1 : out std_logic_vector( 31-1 downto 0 );
    tdo_2 : out std_logic_vector( 31-1 downto 0 )
  );
end ofdm_tx_hw_hb_ssr_re;
architecture structural of ofdm_tx_hw_hb_ssr_re is 
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal register6_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal register8_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  register8_q_net <= tvi;
  register6_q_net <= tdi;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_5fb68143c4a03ebc48b9a50b086a9361 
  port map (
    s_axis_data_tvalid => register8_q_net(0),
    s_axis_data_tdata_real => register6_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_interpolate is
  port (
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_16 : in std_logic;
    ce_16 : in std_logic;
    clk_48 : in std_logic;
    ce_48 : in std_logic;
    clk_96 : in std_logic;
    ce_96 : in std_logic;
    clk_192 : in std_logic;
    ce_192 : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_interpolate;
architecture structural of ofdm_tx_hw_interpolate is 
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal cic_interpolation_re_m_axis_data_tvalid_net : std_logic;
  signal register4_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_interpolation_re_m_axis_data_tdata_real_net : std_logic_vector( 39-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal cic_interpolation_re_s_axis_data_tready_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal concat2_y_net : std_logic_vector( 64-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 16-1 downto 0 );
  signal dest_ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal register9_q_net : std_logic_vector( 1-1 downto 0 );
  signal register7_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0 : std_logic_vector( 31-1 downto 0 );
  signal register8_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0 : std_logic_vector( 31-1 downto 0 );
  signal register10_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_48_net : std_logic;
  signal ce_48_net : std_logic;
  signal register11_q_net : std_logic_vector( 64-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net_x1 : std_logic;
  signal src_ce_net_x1 : std_logic;
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal src_clk_net_x0 : std_logic;
  signal src_ce_net_x0 : std_logic;
  signal dest_clk_net : std_logic;
  signal hb_shift_im_op_net : std_logic_vector( 16-1 downto 0 );
  signal down_sample1_q_net : std_logic_vector( 32-1 downto 0 );
  signal register12_q_net : std_logic_vector( 32-1 downto 0 );
  signal hb_im_s_axis_data_tready_net : std_logic;
  signal hb_im_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal hb_im_m_axis_data_tvalid_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal hb_re_m_axis_data_tvalid_net : std_logic;
  signal hb_shift3_op_net : std_logic_vector( 16-1 downto 0 );
  signal hb_re_s_axis_data_tready_net : std_logic;
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal hb_shift2_op_net : std_logic_vector( 16-1 downto 0 );
  signal hb_re_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal hb_shift4_op_net : std_logic_vector( 16-1 downto 0 );
  signal hb_shift5_op_net : std_logic_vector( 16-1 downto 0 );
  signal register6_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_comp_im_s_axis_data_tready_net : std_logic;
  signal cic_comp_re_m_axis_data_tvalid_net : std_logic;
  signal cic_comp_re_m_axis_data_tdata_real_net : std_logic_vector( 33-1 downto 0 );
  signal register2_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_comp_im_m_axis_data_tdata_real_net : std_logic_vector( 33-1 downto 0 );
  signal cic_comp_re_s_axis_data_tready_net : std_logic;
  signal cic_comp_im_m_axis_data_tvalid_net : std_logic;
  signal register3_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_shift_im_op_net : std_logic_vector( 39-1 downto 0 );
  signal cic_fine_im_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_fine_re_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_shift_re_op_net : std_logic_vector( 39-1 downto 0 );
  signal cic_interpolation_im_s_axis_data_tready_net : std_logic;
  signal register5_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_interpolation_im_m_axis_data_tvalid_net : std_logic;
  signal cic_interpolation_im_m_axis_data_tdata_real_net : std_logic_vector( 39-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal hb_shift_re_op_net : std_logic_vector( 16-1 downto 0 );
begin
  m_axis_tdata <= register11_q_net;
  m_axis_tvalid <= register10_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tready <= constant_op_net;
  src_clk_net_x1 <= clk_1;
  src_ce_net_x1 <= ce_1;
  src_clk_net <= clk_16;
  src_ce_net <= ce_16;
  clk_48_net <= clk_48;
  ce_48_net <= ce_48;
  src_clk_net_x0 <= clk_96;
  src_ce_net_x0 <= ce_96;
  dest_clk_net <= clk_192;
  dest_ce_net <= ce_192;
  hb_ssr_im : entity xil_defaultlib.ofdm_tx_hw_hb_ssr_im 
  port map (
    tvi => register9_q_net,
    tdi => register7_q_net,
    clk_1 => src_clk_net_x1,
    ce_1 => src_ce_net_x1,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net
  );
  hb_ssr_re : entity xil_defaultlib.ofdm_tx_hw_hb_ssr_re 
  port map (
    tvi => register8_q_net,
    tdi => register6_q_net,
    clk_1 => src_clk_net_x1,
    ce_1 => src_ce_net_x1,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0
  );
  cic_comp_im : entity xil_defaultlib.xlfir_compiler_340a9ab2d34e370e39c87cfbd05a405e 
  port map (
    s_axis_data_tdata_real => register3_q_net,
    src_clk => src_clk_net_x0,
    src_ce => src_ce_net_x0,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_96 => src_clk_net_x0,
    ce_96 => src_ce_net_x0,
    clk_logic_96 => src_clk_net_x0,
    ce_logic_96 => src_ce_net_x0,
    s_axis_data_tready => cic_comp_im_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_comp_im_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_comp_im_m_axis_data_tdata_real_net
  );
  cic_comp_re : entity xil_defaultlib.xlfir_compiler_340a9ab2d34e370e39c87cfbd05a405e 
  port map (
    s_axis_data_tdata_real => register2_q_net,
    src_clk => src_clk_net_x0,
    src_ce => src_ce_net_x0,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_96 => src_clk_net_x0,
    ce_96 => src_ce_net_x0,
    clk_logic_96 => src_clk_net_x0,
    ce_logic_96 => src_ce_net_x0,
    s_axis_data_tready => cic_comp_re_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_comp_re_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_comp_re_m_axis_data_tdata_real_net
  );
  cic_fine_im : entity xil_defaultlib.ofdm_tx_hw_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 14,
    a_width => 39,
    b_bin_pt => 14,
    c_a_type => 0,
    c_a_width => 39,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 55,
    core_name0 => "ofdm_tx_hw_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 14,
    p_width => 16,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => cic_shift_im_op_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    core_clk => src_clk_net_x1,
    core_ce => src_ce_net_x1,
    p => cic_fine_im_p_net
  );
  cic_fine_re : entity xil_defaultlib.ofdm_tx_hw_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 14,
    a_width => 39,
    b_bin_pt => 14,
    c_a_type => 0,
    c_a_width => 39,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 55,
    core_name0 => "ofdm_tx_hw_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 14,
    p_width => 16,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => cic_shift_re_op_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    core_clk => src_clk_net_x1,
    core_ce => src_ce_net_x1,
    p => cic_fine_re_p_net
  );
  cic_interpolation_im : entity xil_defaultlib.xlcic_compiler_67f650709c42f8d2211dadea6444f60d 
  port map (
    s_axis_data_tdata_real => register5_q_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_logic_48 => clk_48_net,
    ce_logic_48 => ce_48_net,
    s_axis_data_tready => cic_interpolation_im_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_interpolation_im_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_interpolation_im_m_axis_data_tdata_real_net
  );
  cic_interpolation_re : entity xil_defaultlib.xlcic_compiler_67f650709c42f8d2211dadea6444f60d 
  port map (
    s_axis_data_tdata_real => register4_q_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_logic_48 => clk_48_net,
    ce_logic_48 => ce_48_net,
    s_axis_data_tready => cic_interpolation_re_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_interpolation_re_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_interpolation_re_m_axis_data_tdata_real_net
  );
  cic_shift_im : entity xil_defaultlib.sysgen_shift_b86f47c4d7 
  port map (
    clr => '0',
    ip => cic_interpolation_im_m_axis_data_tdata_real_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    op => cic_shift_im_op_net
  );
  cic_shift_re : entity xil_defaultlib.sysgen_shift_b86f47c4d7 
  port map (
    clr => '0',
    ip => cic_interpolation_re_m_axis_data_tdata_real_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    op => cic_shift_re_op_net
  );
  concat : entity xil_defaultlib.sysgen_concat_060b189299 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret2_output_port_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  concat1 : entity xil_defaultlib.sysgen_concat_060b189299 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret3_output_port_net,
    in1 => reinterpret1_output_port_net,
    y => concat1_y_net
  );
  concat2 : entity xil_defaultlib.sysgen_concat_d8e82a17fd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => concat_y_net,
    in1 => concat1_y_net,
    y => concat2_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_e1a1db9b3d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  convert : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
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
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => cic_comp_re_m_axis_data_tdata_real_net,
    clk => clk_48_net,
    ce => ce_48_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
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
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => cic_comp_im_m_axis_data_tdata_real_net,
    clk => clk_48_net,
    ce => ce_48_net,
    dout => convert1_dout_net
  );
  down_sample1 : entity xil_defaultlib.ofdm_tx_hw_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 32,
    ds_ratio => 12,
    latency => 1,
    phase => 11,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 32
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register12_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => dest_clk_net,
    dest_ce => dest_ce_net,
    q => down_sample1_q_net
  );
  hb_im : entity xil_defaultlib.xlfir_compiler_62e9ab374b304da9a70cd36a38bf1b38 
  port map (
    s_axis_data_tdata_real => register1_q_net,
    src_clk => dest_clk_net,
    src_ce => dest_ce_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    clk_96 => src_clk_net_x0,
    ce_96 => src_ce_net_x0,
    clk_192 => dest_clk_net,
    ce_192 => dest_ce_net,
    clk_logic_192 => dest_clk_net,
    ce_logic_192 => dest_ce_net,
    s_axis_data_tready => hb_im_s_axis_data_tready_net,
    m_axis_data_tvalid => hb_im_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => hb_im_m_axis_data_tdata_real_net
  );
  hb_re : entity xil_defaultlib.xlfir_compiler_62e9ab374b304da9a70cd36a38bf1b38 
  port map (
    s_axis_data_tdata_real => register_q_net,
    src_clk => dest_clk_net,
    src_ce => dest_ce_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    clk_96 => src_clk_net_x0,
    ce_96 => src_ce_net_x0,
    clk_192 => dest_clk_net,
    ce_192 => dest_ce_net,
    clk_logic_192 => dest_clk_net,
    ce_logic_192 => dest_ce_net,
    s_axis_data_tready => hb_re_s_axis_data_tready_net,
    m_axis_data_tvalid => hb_re_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => hb_re_m_axis_data_tdata_real_net
  );
  hb_shift2 : entity xil_defaultlib.sysgen_shift_c7701e0205 
  port map (
    clr => '0',
    ip => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    op => hb_shift2_op_net
  );
  hb_shift3 : entity xil_defaultlib.sysgen_shift_c7701e0205 
  port map (
    clr => '0',
    ip => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    op => hb_shift3_op_net
  );
  hb_shift4 : entity xil_defaultlib.sysgen_shift_c7701e0205 
  port map (
    clr => '0',
    ip => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    op => hb_shift4_op_net
  );
  hb_shift5 : entity xil_defaultlib.sysgen_shift_c7701e0205 
  port map (
    clr => '0',
    ip => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    op => hb_shift5_op_net
  );
  hb_shift_im : entity xil_defaultlib.sysgen_shift_98799c42d9 
  port map (
    clr => '0',
    ip => hb_im_m_axis_data_tdata_real_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    op => hb_shift_im_op_net
  );
  hb_shift_re : entity xil_defaultlib.sysgen_shift_98799c42d9 
  port map (
    clr => '0',
    ip => hb_re_m_axis_data_tdata_real_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    op => hb_shift_re_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_6b217b35b1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    y => logical_y_net
  );
  register_x0 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => reinterpret5_output_port_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => reinterpret4_output_port_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    q => register1_q_net
  );
  register10 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical_y_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    q => register10_q_net
  );
  register11 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 64,
    init_value => b"0000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat2_y_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    q => register11_q_net
  );
  register12 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_tdata_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register12_q_net
  );
  register2 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => hb_shift_re_op_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => hb_shift_im_op_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert_dout_net,
    clk => clk_48_net,
    ce => ce_48_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert1_dout_net,
    clk => clk_48_net,
    ce => ce_48_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => cic_fine_re_p_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => cic_fine_im_p_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    q => register7_q_net
  );
  register8 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => cic_interpolation_re_m_axis_data_tvalid_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    q => register8_q_net
  );
  register9 : entity xil_defaultlib.ofdm_tx_hw_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => cic_interpolation_im_m_axis_data_tvalid_net,
    clk => src_clk_net_x1,
    ce => src_ce_net_x1,
    q => register9_q_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => hb_shift2_op_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => hb_shift4_op_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => hb_shift3_op_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => hb_shift5_op_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_e01da0986a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret4_output_port_net
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_e01da0986a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret5_output_port_net
  );
  slice : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => down_sample1_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => down_sample1_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_struct is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_16 : in std_logic;
    ce_16 : in std_logic;
    clk_48 : in std_logic;
    ce_48 : in std_logic;
    clk_96 : in std_logic;
    ce_96 : in std_logic;
    clk_192 : in std_logic;
    ce_192 : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_struct;
architecture structural of ofdm_tx_hw_struct is 
  signal register10_q_net : std_logic_vector( 1-1 downto 0 );
  signal register11_q_net : std_logic_vector( 64-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net_x1 : std_logic;
  signal src_ce_net_x0 : std_logic;
  signal ce_48_net : std_logic;
  signal src_clk_net_x0 : std_logic;
  signal clk_48_net : std_logic;
  signal src_ce_net : std_logic;
  signal src_ce_net_x1 : std_logic;
  signal src_clk_net : std_logic;
  signal dest_clk_net : std_logic;
  signal dest_ce_net : std_logic;
begin
  m_axis_tdata <= register11_q_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register10_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= constant_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net_x1 <= clk_1;
  src_ce_net_x1 <= ce_1;
  src_clk_net <= clk_16;
  src_ce_net <= ce_16;
  clk_48_net <= clk_48;
  ce_48_net <= ce_48;
  src_clk_net_x0 <= clk_96;
  src_ce_net_x0 <= ce_96;
  dest_clk_net <= clk_192;
  dest_ce_net <= ce_192;
  interpolate : entity xil_defaultlib.ofdm_tx_hw_interpolate 
  port map (
    s_axis_tdata => s_axis_tdata_net,
    clk_1 => src_clk_net_x1,
    ce_1 => src_ce_net_x1,
    clk_16 => src_clk_net,
    ce_16 => src_ce_net,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_96 => src_clk_net_x0,
    ce_96 => src_ce_net_x0,
    clk_192 => dest_clk_net,
    ce_192 => dest_ce_net,
    m_axis_tdata => register11_q_net,
    m_axis_tvalid => register10_q_net,
    s_axis_tready => constant_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_default_clock_driver is
  port (
    ofdm_tx_hw_sysclk : in std_logic;
    ofdm_tx_hw_sysce : in std_logic;
    ofdm_tx_hw_sysclr : in std_logic;
    ofdm_tx_hw_clk1 : out std_logic;
    ofdm_tx_hw_ce1 : out std_logic;
    ofdm_tx_hw_clk16 : out std_logic;
    ofdm_tx_hw_ce16 : out std_logic;
    ofdm_tx_hw_clk48 : out std_logic;
    ofdm_tx_hw_ce48 : out std_logic;
    ofdm_tx_hw_clk96 : out std_logic;
    ofdm_tx_hw_ce96 : out std_logic;
    ofdm_tx_hw_clk192 : out std_logic;
    ofdm_tx_hw_ce192 : out std_logic
  );
end ofdm_tx_hw_default_clock_driver;
architecture structural of ofdm_tx_hw_default_clock_driver is 
begin
  clockdriver_x3 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk1,
    ce => ofdm_tx_hw_ce1
  );
  clockdriver_x2 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 16,
    log_2_period => 5
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk16,
    ce => ofdm_tx_hw_ce16
  );
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 48,
    log_2_period => 6
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk48,
    ce => ofdm_tx_hw_ce48
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 96,
    log_2_period => 7
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk96,
    ce => ofdm_tx_hw_ce96
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 192,
    log_2_period => 8
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk192,
    ce => ofdm_tx_hw_ce192
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw;
architecture structural of ofdm_tx_hw is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "ofdm_tx_hw,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=5.20833,system_simulink_period=5.20833e-09,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=inf,cic_compiler_v4_0=2,cmult=2,concat=3,constant=1,convert=2,dsamp=4,fir_compiler_v7_2=6,logical=1,register=16,reinterpret=6,shift=8,slice=2,}";
  signal ce_192_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_48_net : std_logic;
  signal ce_48_net : std_logic;
  signal ce_96_net : std_logic;
  signal clk_192_net : std_logic;
  signal ce_16_net : std_logic;
  signal clk_96_net : std_logic;
  signal clk_16_net : std_logic;
  signal clk_1_net : std_logic;
begin
  ofdm_tx_hw_default_clock_driver : entity xil_defaultlib.ofdm_tx_hw_default_clock_driver 
  port map (
    ofdm_tx_hw_sysclk => clk,
    ofdm_tx_hw_sysce => '1',
    ofdm_tx_hw_sysclr => '0',
    ofdm_tx_hw_clk1 => clk_1_net,
    ofdm_tx_hw_ce1 => ce_1_net,
    ofdm_tx_hw_clk16 => clk_16_net,
    ofdm_tx_hw_ce16 => ce_16_net,
    ofdm_tx_hw_clk48 => clk_48_net,
    ofdm_tx_hw_ce48 => ce_48_net,
    ofdm_tx_hw_clk96 => clk_96_net,
    ofdm_tx_hw_ce96 => ce_96_net,
    ofdm_tx_hw_clk192 => clk_192_net,
    ofdm_tx_hw_ce192 => ce_192_net
  );
  ofdm_tx_hw_struct : entity xil_defaultlib.ofdm_tx_hw_struct 
  port map (
    m_axis_tready => m_axis_tready,
    s_axis_tdata => s_axis_tdata,
    s_axis_tlast => s_axis_tlast,
    s_axis_tvalid => s_axis_tvalid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_16 => clk_16_net,
    ce_16 => ce_16_net,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_192 => clk_192_net,
    ce_192 => ce_192_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tvalid => m_axis_tvalid,
    s_axis_tready => s_axis_tready
  );
end structural;

-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity ofdm_rx_hw_stub is
  port (
    s_axis_tdata_im : in std_logic_vector( 128-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 128-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    data : out std_logic_vector( 32-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_rx_hw_stub;
architecture structural of ofdm_rx_hw_stub is 
begin
  sysgen_dut : entity xil_defaultlib.ofdm_rx_hw 
  port map (
    s_axis_tdata_im => s_axis_tdata_im,
    s_axis_tdata_re => s_axis_tdata_re,
    s_axis_tvalid_im => s_axis_tvalid_im,
    s_axis_tvalid_re => s_axis_tvalid_re,
    clk => clk,
    data => data,
    valid => valid
  );
end structural;

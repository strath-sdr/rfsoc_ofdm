-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity ofdm_tx_hw_stub is
  port (
    data : in std_logic_vector( 32-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_stub;
architecture structural of ofdm_tx_hw_stub is 
begin
  sysgen_dut : entity xil_defaultlib.ofdm_tx_hw_0 
  port map (
    data => data,
    valid => valid,
    clk => clk,
    m_axis_tdata => m_axis_tdata,
    m_axis_tvalid => m_axis_tvalid
  );
end structural;

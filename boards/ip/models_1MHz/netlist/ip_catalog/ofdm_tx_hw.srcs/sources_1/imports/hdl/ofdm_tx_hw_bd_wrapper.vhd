--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Thu May  6 10:44:55 2021
--Host        : DESKTOP-2K5Q0I9 running 64-bit major release  (build 9200)
--Command     : generate_target ofdm_tx_hw_bd_wrapper.bd
--Design      : ofdm_tx_hw_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ofdm_tx_hw_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    valid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end ofdm_tx_hw_bd_wrapper;

architecture STRUCTURE of ofdm_tx_hw_bd_wrapper is
  component ofdm_tx_hw_bd is
  port (
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    valid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component ofdm_tx_hw_bd;
begin
ofdm_tx_hw_bd_i: component ofdm_tx_hw_bd
     port map (
      clk => clk,
      data(31 downto 0) => data(31 downto 0),
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tvalid(0) => m_axis_tvalid(0),
      valid(0) => valid(0)
    );
end STRUCTURE;

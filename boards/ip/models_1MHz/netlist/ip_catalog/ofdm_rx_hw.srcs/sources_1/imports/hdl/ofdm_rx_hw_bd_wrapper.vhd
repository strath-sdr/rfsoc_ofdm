--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Wed May  5 14:31:53 2021
--Host        : DESKTOP-2K5Q0I9 running 64-bit major release  (build 9200)
--Command     : generate_target ofdm_rx_hw_bd_wrapper.bd
--Design      : ofdm_rx_hw_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ofdm_rx_hw_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_im_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_im_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_re_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    valid : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end ofdm_rx_hw_bd_wrapper;

architecture STRUCTURE of ofdm_rx_hw_bd_wrapper is
  component ofdm_rx_hw_bd is
  port (
    clk : in STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_im_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_im_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_re_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component ofdm_rx_hw_bd;
begin
ofdm_rx_hw_bd_i: component ofdm_rx_hw_bd
     port map (
      clk => clk,
      data(31 downto 0) => data(31 downto 0),
      s_axis_im_tdata(127 downto 0) => s_axis_im_tdata(127 downto 0),
      s_axis_im_tvalid(0) => s_axis_im_tvalid(0),
      s_axis_re_tdata(127 downto 0) => s_axis_re_tdata(127 downto 0),
      s_axis_re_tvalid(0) => s_axis_re_tvalid(0),
      valid(0) => valid(0)
    );
end STRUCTURE;

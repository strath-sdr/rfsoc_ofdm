-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_CIC_ma1.vhd
-- Created: 2022-03-24 22:06:16
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_CIC_ma1
-- Source Path: OFDM_Rx_HW/OFDMRx/Synchronisation/SchmidlCoxMetric /CIC_ma1
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_CIC_ma1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        In1                               :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En23
        Out1                              :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En15
        );
END ofdm_rx_src_CIC_ma1;


ARCHITECTURE rtl OF ofdm_rx_src_CIC_ma1 IS

  -- Signals
  SIGNAL In1_unsigned                     : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Delay3_out1                      : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Delay1_reg                       : vector_of_unsigned25(0 TO 47);  -- ufix25 [48]
  SIGNAL Delay1_out1                      : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Add_sub_cast                     : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Add_sub_cast_1                   : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Add_out1                         : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Delay2_out1                      : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Add1_out1                        : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Delay4_out1                      : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Data_Type_Conversion_out1        : signed(17 DOWNTO 0);  -- sfix18_En15

BEGIN
  In1_unsigned <= unsigned(In1);

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= to_unsigned(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay3_out1 <= In1_unsigned;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_reg <= (OTHERS => to_unsigned(16#0000000#, 25));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay1_reg(0) <= Delay3_out1;
        Delay1_reg(1 TO 47) <= Delay1_reg(0 TO 46);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(47);

  Add_sub_cast <= signed(resize(Delay3_out1, 33));
  Add_sub_cast_1 <= signed(resize(Delay1_out1, 33));
  Add_out1 <= Add_sub_cast - Add_sub_cast_1;

  Add1_out1 <= Delay2_out1 + Add_out1;

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_signed(0, 33);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay2_out1 <= Add1_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_out1 <= to_signed(0, 33);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay4_out1 <= Delay2_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Data_Type_Conversion_out1 <= Delay4_out1(25 DOWNTO 8);

  Out1 <= std_logic_vector(Data_Type_Conversion_out1);

END rtl;


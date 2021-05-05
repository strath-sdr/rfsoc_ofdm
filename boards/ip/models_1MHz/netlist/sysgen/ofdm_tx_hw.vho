  sysgen_dut : entity xil_defaultlib.ofdm_tx_hw 
  port map (
    data => data,
    valid => valid,
    clk => clk,
    m_axis_tdata => m_axis_tdata,
    m_axis_tvalid => m_axis_tvalid
  );

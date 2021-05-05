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

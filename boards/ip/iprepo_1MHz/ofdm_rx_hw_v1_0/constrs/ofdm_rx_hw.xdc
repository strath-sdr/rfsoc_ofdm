set rateCeofdm_rx_hw128 ofdm_rx_hw_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_rx_hw128 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_rx_hw128/Q]] IS_ENABLE]]
set rateCeofdm_rx_hw256 ofdm_rx_hw_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_rx_hw256 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_rx_hw256/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsofdm_rx_hw128 -to $rateCellsofdm_rx_hw128 -setup 128
set_multicycle_path -from $rateCellsofdm_rx_hw128 -to $rateCellsofdm_rx_hw128 -hold 127
set_multicycle_path -from $rateCellsofdm_rx_hw128 -to $rateCellsofdm_rx_hw256 -setup 128
set_multicycle_path -from $rateCellsofdm_rx_hw128 -to $rateCellsofdm_rx_hw256 -hold 127
set_multicycle_path -from $rateCellsofdm_rx_hw256 -to $rateCellsofdm_rx_hw128 -setup 128
set_multicycle_path -from $rateCellsofdm_rx_hw256 -to $rateCellsofdm_rx_hw128 -hold 127
set_multicycle_path -from $rateCellsofdm_rx_hw256 -to $rateCellsofdm_rx_hw256 -setup 256
set_multicycle_path -from $rateCellsofdm_rx_hw256 -to $rateCellsofdm_rx_hw256 -hold 255

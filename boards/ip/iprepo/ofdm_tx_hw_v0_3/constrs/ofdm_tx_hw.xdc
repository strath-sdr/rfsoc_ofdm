set rateCeofdm_tx_hw16 ofdm_tx_hw_default_clock_driver/clockdriver_x2/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw16 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw16/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw48 ofdm_tx_hw_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw48 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw48/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw96 ofdm_tx_hw_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw96 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw96/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw192 ofdm_tx_hw_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw192 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw192/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw48 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw48 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw96 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw96 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw192 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw192 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw48 -setup 48
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw48 -hold 47
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw96 -setup 48
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw96 -hold 47
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw192 -setup 48
set_multicycle_path -from $rateCellsofdm_tx_hw48 -to $rateCellsofdm_tx_hw192 -hold 47
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw48 -setup 48
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw48 -hold 47
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw96 -setup 96
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw96 -hold 95
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw192 -setup 96
set_multicycle_path -from $rateCellsofdm_tx_hw96 -to $rateCellsofdm_tx_hw192 -hold 95
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw48 -setup 48
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw48 -hold 47
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw96 -setup 96
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw96 -hold 95
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw192 -setup 192
set_multicycle_path -from $rateCellsofdm_tx_hw192 -to $rateCellsofdm_tx_hw192 -hold 191

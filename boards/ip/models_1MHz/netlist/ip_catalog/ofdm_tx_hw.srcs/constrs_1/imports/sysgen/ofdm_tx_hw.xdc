set rateCeofdm_tx_hw16 ofdm_tx_hw_default_clock_driver/clockdriver_x3/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw16 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw16/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw32 ofdm_tx_hw_default_clock_driver/clockdriver_x2/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw32 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw32/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw64 ofdm_tx_hw_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw64 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw64/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw128 ofdm_tx_hw_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw128 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw128/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw256 ofdm_tx_hw_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw256 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw256/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw32 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw32 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw64 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw64 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw128 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw128 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw256 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw16 -to $rateCellsofdm_tx_hw256 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw32 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw32 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw64 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw64 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw128 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw128 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw256 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw32 -to $rateCellsofdm_tx_hw256 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw32 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw32 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw64 -setup 64
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw64 -hold 63
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw128 -setup 64
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw128 -hold 63
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw256 -setup 64
set_multicycle_path -from $rateCellsofdm_tx_hw64 -to $rateCellsofdm_tx_hw256 -hold 63
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw32 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw32 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw64 -setup 64
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw64 -hold 63
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw128 -setup 128
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw128 -hold 127
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw256 -setup 128
set_multicycle_path -from $rateCellsofdm_tx_hw128 -to $rateCellsofdm_tx_hw256 -hold 127
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw16 -setup 16
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw16 -hold 15
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw32 -setup 32
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw32 -hold 31
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw64 -setup 64
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw64 -hold 63
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw128 -setup 128
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw128 -hold 127
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw256 -setup 256
set_multicycle_path -from $rateCellsofdm_tx_hw256 -to $rateCellsofdm_tx_hw256 -hold 255

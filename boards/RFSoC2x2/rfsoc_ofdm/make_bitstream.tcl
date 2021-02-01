set overlay_name "rfsoc_ofdm"
set design_name "block_design"

# Open project
open_project ./${overlay_name}/${overlay_name}.xpr
open_bd_design ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd

# Call implement
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# Move and rename bitstream to final location
file copy -force ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper.bit ./bitstream/${overlay_name}.bit

# copy hwh files
file copy -force ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hw_handoff/${design_name}.hwh ./bitstream/${overlay_name}.hwh
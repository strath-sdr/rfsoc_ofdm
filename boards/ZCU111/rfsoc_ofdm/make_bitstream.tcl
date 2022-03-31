set overlay_name "block_design"
set design_name "rfsoc_ofdm"

# Open project
open_project ./${overlay_name}/${overlay_name}.xpr
open_bd_design ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd

# Add top wrapper and xdc files
make_wrapper -files [get_files ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.vhd
set_property top ${design_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

# Call implement
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1

# Make bitstream folder
file mkdir ./bitstream

# Move and rename bitstream to final location
file copy -force ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper.bit ./bitstream/${design_name}.bit

# copy hwh files
file copy -force ./${overlay_name}/${overlay_name}.gen/sources_1/bd/${design_name}/hw_handoff/${design_name}.hwh ./bitstream/${design_name}.hwh


start_gui
create_project project_1 D:/BPSK_VIVADO_21/project_1 -part xczu9eg-ffvb1156-2-e

set_property board_part xilinx.com:zcu102:part0:3.4 [current_project]
set_property target_language VHDL [current_project]
create_bd_design "design_1"

update_compile_order -fileset sources_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0
endgroup

apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]

set_property -dict [list CONFIG.PSU__USE__M_AXI_GP0 {0} CONFIG.PSU__USE__M_AXI_GP1 {0} CONFIG.PSU__USE__IRQ0 {0}] [get_bd_cells zynq_ultra_ps_e_0]

save_bd_design

set_property  ip_repo_paths  D:/BPSK_VIVADO_21/BPSK_Selector_21 [current_project]
update_ip_catalog

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:dds_compiler:6.0 dds_compiler_0
endgroup

set_property -dict [list CONFIG.Spurious_Free_Dynamic_Range {96} CONFIG.Frequency_Resolution {0.00001} CONFIG.Has_Phase_Out {false} CONFIG.Has_ARESETn {true} CONFIG.Output_Frequency1 {0.78125} CONFIG.Noise_Shaping {Auto} CONFIG.Phase_Width {44} CONFIG.Output_Width {16} CONFIG.M_DATA_Has_TUSER {Not_Required} CONFIG.Latency {8} CONFIG.PINC1 {10000000000000000000000000000000000000}] [get_bd_cells dds_compiler_0]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_0
endgroup
set_property -dict [list CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER CONFIG.HAS_TREADY.VALUE_SRC PROPAGATED] [get_bd_cells axis_broadcaster_0]
set_property -dict [list CONFIG.M_TDATA_NUM_BYTES {2} CONFIG.S_TDATA_NUM_BYTES {4} CONFIG.M00_TDATA_REMAP {tdata[15:0]} CONFIG.M01_TDATA_REMAP {tdata[31:16]}] [get_bd_cells axis_broadcaster_0]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary_0
endgroup
set_property -dict [list CONFIG.Restrict_Count {true} CONFIG.Final_Count_Value {FFFE}] [get_bd_cells c_counter_binary_0]

update_ip_catalog -rebuild

startgroup
create_bd_cell -type ip -vlnv xilinx.com:user:BPSK_Selector_21:1.0 BPSK_Selector_21_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0
endgroup

set_property -dict [list CONFIG.C_SLOT {2} CONFIG.C_BRAM_CNT {52} CONFIG.C_DATA_DEPTH {8192} CONFIG.C_NUM_MONITOR_SLOTS {3} CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} CONFIG.C_SLOT_2_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0}] [get_bd_cells system_ila_0]

startgroup
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config { Clk {/zynq_ultra_ps_e_0/pl_clk0 (99 MHz)} Freq {100} Ref_Clk0 {} Ref_Clk1 {} Ref_Clk2 {}}  [get_bd_pins c_counter_binary_0/CLK]
apply_bd_automation -rule xilinx.com:bd_rule:board -config { Board_Interface {Custom} Manual_Source {Auto}}  [get_bd_pins proc_sys_reset_0/ext_reset_in]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config { Clk {/zynq_ultra_ps_e_0/pl_clk0 (99 MHz)} Freq {100} Ref_Clk0 {} Ref_Clk1 {} Ref_Clk2 {}}  [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
endgroup

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins dds_compiler_0/aresetn]
connect_bd_net [get_bd_pins axis_broadcaster_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins BPSK_Selector_21_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins system_ila_0/resetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]

connect_bd_net [get_bd_pins dds_compiler_0/aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
connect_bd_net [get_bd_pins axis_broadcaster_0/aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
connect_bd_net [get_bd_pins BPSK_Selector_21_0/aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
connect_bd_net [get_bd_pins system_ila_0/clk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]

connect_bd_intf_net [get_bd_intf_pins dds_compiler_0/M_AXIS_DATA] [get_bd_intf_pins axis_broadcaster_0/S_AXIS]

connect_bd_intf_net [get_bd_intf_pins system_ila_0/SLOT_0_AXIS] [get_bd_intf_pins BPSK_Selector_21_0/S_AXIS_0]
connect_bd_intf_net [get_bd_intf_pins system_ila_0/SLOT_1_AXIS] [get_bd_intf_pins BPSK_Selector_21_0/S_AXIS_1]
connect_bd_intf_net [get_bd_intf_pins system_ila_0/SLOT_2_AXIS] [get_bd_intf_pins BPSK_Selector_21_0/M_AXIS_0]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M00_AXIS] [get_bd_intf_pins BPSK_Selector_21_0/S_AXIS_0]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M01_AXIS] [get_bd_intf_pins BPSK_Selector_21_0/S_AXIS_1]

connect_bd_net [get_bd_pins c_counter_binary_0/Q] [get_bd_pins BPSK_Selector_21_0/BPSK_SELECT]

regenerate_bd_layout
validate_bd_design

reset_target all [get_files  D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
export_ip_user_files -of_objects  [get_files  D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -sync -no_script -force -quiet

save_bd_design

generate_target all [get_files  D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

catch { config_ip_cache -export [get_ips -all design_1_zynq_ultra_ps_e_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_proc_sys_reset_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_dds_compiler_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axis_broadcaster_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_c_counter_binary_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_BPSK_Selector_21_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_system_ila_0_0] }
export_ip_user_files -of_objects [get_files D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
launch_runs design_1_zynq_ultra_ps_e_0_0_synth_1 design_1_proc_sys_reset_0_0_synth_1 design_1_dds_compiler_0_0_synth_1 design_1_axis_broadcaster_0_0_synth_1 design_1_c_counter_binary_0_0_synth_1 design_1_BPSK_Selector_21_0_0_synth_1 design_1_system_ila_0_0_synth_1 -jobs 12

export_simulation -of_objects [get_files D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -directory D:/BPSK_VIVADO_21/project_1/project_1.ip_user_files/sim_scripts -ip_user_files_dir D:/BPSK_VIVADO_21/project_1/project_1.ip_user_files -ipstatic_source_dir D:/BPSK_VIVADO_21/project_1/project_1.ip_user_files/ipstatic -lib_map_path [list {modelsim=D:/BPSK_VIVADO_21/project_1/project_1.cache/compile_simlib/modelsim} {questa=D:/BPSK_VIVADO_21/project_1/project_1.cache/compile_simlib/questa} {riviera=D:/BPSK_VIVADO_21/project_1/project_1.cache/compile_simlib/riviera} {activehdl=D:/BPSK_VIVADO_21/project_1/project_1.cache/compile_simlib/activehdl}] -use_ip_compiled_libs -force -quiet

make_wrapper -files [get_files D:/BPSK_VIVADO_21/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse d:/BPSK_VIVADO_21/project_1/project_1.gen/sources_1/bd/design_1/hdl/design_1_wrapper.vhd

launch_runs synth_1 -jobs 12

launch_simulation

add_wave {{/design_1_wrapper/design_1_i/system_ila_0/SLOT_0_AXIS_tdata}} {{/design_1_wrapper/design_1_i/system_ila_0/SLOT_1_AXIS_tdata}} {{/design_1_wrapper/design_1_i/system_ila_0/SLOT_2_AXIS_tdata}} 
run 10 us
save_wave_config {D:/BPSK_VIVADO_21/project_1/design_1_wrapper_behav.wcfg}
add_files -fileset sim_1 -norecurse D:/BPSK_VIVADO_21/project_1/design_1_wrapper_behav.wcfg
set_property xsim.view D:/BPSK_VIVADO_21/project_1/design_1_wrapper_behav.wcfg [get_filesets sim_1]
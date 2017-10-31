elaborate TOP_LEVEL -architecture ARCH -library DEFAULT
current_design top_level
characterize  -constraints -connections {UEXECUTE_BLOCK}
current_design execute_block
compile
report_timing > reports/execute_block_noopt_timing.txt
report_power > reports/execute_block_noopt_power.txt
create_clock -name "CLK" -period 1.3 Clock
set_max_delay -from [all_inputs] -to [all_outputs] 1.3
compile_ultra -no_autoungroup
report_timing > reports/execute_block_ultra_1300_timing.txt
report_power > reports/execute_block_ultra_1300_power.txt
write -hierarchy -format vhdl -output postsynth/execute_block_1300.vhdl
write -hierarchy -format ddc -output postsynth/execute_block_1300.ddc
current_design top_level
set_dont_touch top_level/execute_block true
characterize UEXECUTE_BLOCK
compile
report_timing > reports/dlx_noopt_timing.txt
report_power > reports/dlx_noopt_power.txt
create_clock -name "CLK" -period 1.7 clock
compile_ultra -no_autoungroup
report_timing > reports/dlx_ultra_1700_timing.txt
report_power > reports/dlx_ultra_1700_power.txt
write -hierarchy -format vhdl -output postsynth/dlx_1700.vhdl
write -hierarchy -format ddc -output postsynth/dlx_1700.ddc
write_sdc postsynth/dlx_1700.sdc

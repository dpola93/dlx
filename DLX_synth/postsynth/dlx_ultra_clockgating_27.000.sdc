###################################################################

# Created by write_sdc on Tue Oct 31 19:57:48 2017

###################################################################
set sdc_version 1.7

create_clock [get_ports clock]  -name clk  -period 2.7  -waveform {0 1.35}
set_clock_gating_check -rise -setup 0 [get_cells                               \
UEXECUTE_BLOCK/ALU/MULT/clk_gate_count_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UEXECUTE_BLOCK/ALU/MULT/clk_gate_count_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UEXECUTE_BLOCK/ALU/MULT/clk_gate_count_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UEXECUTE_BLOCK/ALU/MULT/clk_gate_count_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UEXECUTE_BLOCK/ALU/MULT/ACCUMULATOR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UEXECUTE_BLOCK/ALU/MULT/ACCUMULATOR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UEXECUTE_BLOCK/ALU/MULT/ACCUMULATOR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UEXECUTE_BLOCK/ALU/MULT/ACCUMULATOR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/ALUW/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/ALUW/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/ALUW/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/ALUW/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/IMM/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/IMM/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/IMM/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/IMM/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/rC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/rC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/rC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/rC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/rB/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/rB/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/rB/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/rB/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/rA/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/rA/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/rA/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/rA/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/B/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/B/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/B/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/B/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UDECODE_REGS/A/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UDECODE_REGS/A/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UDECODE_REGS/A/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UDECODE_REGS/A/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells RF/clk_gate_OUT1_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells RF/clk_gate_OUT1_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells RF/clk_gate_OUT1_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells RF/clk_gate_OUT1_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[31]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[31]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[31]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[31]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[30]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[30]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[30]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[30]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[29]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[29]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[29]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[29]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[28]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[28]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[28]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[28]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[27]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[27]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[27]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[27]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[26]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[26]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[26]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[26]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[25]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[25]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[25]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[25]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[24]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[24]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[24]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[24]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[23]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[23]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[23]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[23]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[22]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[22]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[22]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[22]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[21]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[21]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[21]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[21]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[20]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[20]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[20]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[20]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[19]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[19]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[19]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[19]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[18]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[18]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[18]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[18]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[17]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[17]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[17]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[17]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[16]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[16]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[16]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[16]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[15]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[15]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[15]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[15]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[14]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[14]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[14]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[14]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[13]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[13]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[13]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[13]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[12]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[12]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[12]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[12]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[11]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[11]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[11]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[11]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[10]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[10]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[10]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[10]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[9]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[9]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[9]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[9]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[8]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[8]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[8]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[8]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[7]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[7]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[7]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[7]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[6]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[6]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[6]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[6]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[5]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[5]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[5]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[5]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[4]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[4]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[4]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[4]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[3]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[3]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[3]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[3]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[2]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[2]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[2]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[2]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[1]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[1]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[1]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[1]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[0]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{RF/clk_gate_REGISTERS_reg[0]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[0]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{RF/clk_gate_REGISTERS_reg[0]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells RF/clk_gate_OUT2_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells RF/clk_gate_OUT2_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells RF/clk_gate_OUT2_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells RF/clk_gate_OUT2_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UCU/clk_gate_cw_e_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UCU/clk_gate_cw_e_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells UCU/clk_gate_cw_e_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells UCU/clk_gate_cw_e_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UFEETCH_REGS/IR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UFEETCH_REGS/IR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UFEETCH_REGS/IR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UFEETCH_REGS/IR/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UFEETCH_REGS/NPCF/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UFEETCH_REGS/NPCF/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UFEETCH_REGS/NPCF/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UFEETCH_REGS/NPCF/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[15]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[15]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[15]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[15]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[14]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[14]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[14]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[14]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[13]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[13]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[13]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[13]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[12]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[12]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[12]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[12]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[11]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[11]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[11]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[11]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[10]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[10]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[10]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[10]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[9]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[9]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[9]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[9]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[8]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[8]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[8]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[8]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[7]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[7]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[7]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[7]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[6]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[6]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[6]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[6]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[5]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[5]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[5]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[5]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[4]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[4]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[4]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[4]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[3]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[3]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[3]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[3]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[2]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[2]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[2]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[2]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[1]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[1]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[1]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[1]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[0]/main_gate}]
set_clock_gating_check -fall -setup 0 [get_cells                               \
{UBTB/clk_gate_predict_PC_reg[0]/main_gate}]
set_clock_gating_check -rise -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[0]/main_gate}]
set_clock_gating_check -fall -hold 0 [get_cells                                \
{UBTB/clk_gate_predict_PC_reg[0]/main_gate}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UBTB/clk_gate_last_TAG_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UBTB/clk_gate_last_TAG_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UBTB/clk_gate_last_TAG_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UBTB/clk_gate_last_TAG_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
UFETCH_BLOCK/PC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
UFETCH_BLOCK/PC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
UFETCH_BLOCK/PC/clk_gate_Q_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
UFETCH_BLOCK/PC/clk_gate_Q_reg/main_gate]

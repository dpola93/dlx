onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_fetch_block/UFETCH_BLOCK/PC_o
add wave -noupdate -radix hexadecimal /tb_fetch_block/UFEETCH_REGS/IR_o
add wave -noupdate -radix unsigned /tb_fetch_block/UCU/ALU_OPCODE
add wave -noupdate -radix unsigned /tb_fetch_block/UDECODE_REGS/A_o
add wave -noupdate -radix unsigned /tb_fetch_block/UDECODE_REGS/B_o
add wave -noupdate -radix unsigned /tb_fetch_block/UDECODE_REGS/rA_o
add wave -noupdate -radix unsigned /tb_fetch_block/UDECODE_REGS/rB_o
add wave -noupdate -radix unsigned /tb_fetch_block/UDECODE_REGS/rC_o
add wave -noupdate -radix unsigned /tb_fetch_block/UEXECUTE_REGS/X_o
add wave -noupdate -radix unsigned /tb_fetch_block/UEXECUTE_REGS/S_o
add wave -noupdate -radix unsigned /tb_fetch_block/UEXECUTE_BLOCK/DOUT
add wave -noupdate -radix unsigned /tb_fetch_block/UEXECUTE_BLOCK/ALU/DOUT
add wave -noupdate -radix unsigned /tb_fetch_block/UEXECUTE_BLOCK/ALU/MULT/DOUT
add wave -noupdate -radix unsigned /tb_fetch_block/UEXECUTE_BLOCK/ALU/MULT/stall_o
add wave -noupdate -radix unsigned -childformat {{/tb_fetch_block/RF/REGISTERS(0) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(1) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(2) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(3) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(4) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(5) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(6) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(7) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(8) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(9) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(10) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(11) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(12) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(13) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(14) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(15) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(16) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(17) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(18) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(19) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(20) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(21) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(22) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(23) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(24) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(25) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(26) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(27) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(28) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(29) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(30) -radix unsigned} {/tb_fetch_block/RF/REGISTERS(31) -radix unsigned}} -subitemconfig {/tb_fetch_block/RF/REGISTERS(0) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(1) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(2) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(3) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(4) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(5) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(6) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(7) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(8) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(9) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(10) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(11) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(12) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(13) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(14) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(15) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(16) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(17) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(18) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(19) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(20) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(21) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(22) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(23) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(24) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(25) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(26) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(27) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(28) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(29) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(30) {-height 16 -radix unsigned} /tb_fetch_block/RF/REGISTERS(31) {-height 16 -radix unsigned}} /tb_fetch_block/RF/REGISTERS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {21005 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 459
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {18623 ps} {32441 ps}

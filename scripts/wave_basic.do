onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_top_level/Clock
add wave -noupdate -label rst /tb_top_level/Reset
add wave -noupdate -label PC -radix unsigned /tb_top_level/DUT/UFETCH_BLOCK/PC/Q
add wave -noupdate -label IR -radix hexadecimal /tb_top_level/DUT/UFEETCH_REGS/IR/Q
add wave -noupdate -label A -radix unsigned /tb_top_level/DUT/UDECODE_REGS/A/Q
add wave -noupdate -label B -radix unsigned /tb_top_level/DUT/UDECODE_REGS/B/Q
add wave -noupdate -label IMM -radix unsigned /tb_top_level/DUT/UDECODE_REGS/IMM/Q
add wave -noupdate -label DEST -radix unsigned /tb_top_level/DUT/UEXECUTE_BLOCK/MUXDEST/OUT1
add wave -noupdate -label X -radix unsigned /tb_top_level/DUT/UEXECUTE_REGS/X/Q
add wave -noupdate -label S -radix unsigned /tb_top_level/DUT/UEXECUTE_REGS/S/Q
add wave -noupdate -label D2 -radix unsigned /tb_top_level/DUT/UEXECUTE_REGS/D2/Q
add wave -noupdate -label W -radix unsigned /tb_top_level/DUT/UMEM_REGS/W/Q
add wave -noupdate -label D3 -radix unsigned /tb_top_level/DUT/UMEM_REGS/D3/Q
add wave -noupdate -divider -height 20 <NULL>
add wave -noupdate -label REGS -radix unsigned -childformat {{/tb_top_level/DUT/RF/REGISTERS(0) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(1) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(2) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(3) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(4) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(5) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(6) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(7) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(8) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(9) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(10) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(11) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(12) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(13) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(14) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(15) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(16) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(17) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(18) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(19) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(20) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(21) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(22) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(23) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(24) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(25) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(26) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(27) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(28) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(29) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(30) -radix unsigned} {/tb_top_level/DUT/RF/REGISTERS(31) -radix unsigned}} -subitemconfig {/tb_top_level/DUT/RF/REGISTERS(0) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(1) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(2) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(3) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(4) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(5) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(6) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(7) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(8) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(9) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(10) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(11) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(12) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(13) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(14) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(15) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(16) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(17) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(18) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(19) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(20) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(21) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(22) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(23) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(24) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(25) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(26) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(27) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(28) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(29) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(30) {-radix unsigned} /tb_top_level/DUT/RF/REGISTERS(31) {-radix unsigned}} /tb_top_level/DUT/RF/REGISTERS
add wave -noupdate -divider -height 20 <NULL>
add wave -noupdate -label DRAM -radix unsigned /tb_top_level/DMEM/DRAM_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {1729 ps} {16225 ps}

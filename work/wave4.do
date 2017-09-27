onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_booth/UT/input_mux_sel
add wave -noupdate -radix unsigned /tb_booth/UT/A_to_mux
add wave -noupdate -radix unsigned /tb_booth/UT/A2_to_mux
add wave -noupdate -radix decimal /tb_booth/UT/notA_to_mux
add wave -noupdate -radix decimal /tb_booth/UT/notA2_to_mux
add wave -noupdate /tb_booth/UT/Clock
add wave -noupdate /tb_booth/UT/load
add wave -noupdate /tb_booth/Reset
add wave -noupdate /tb_booth/fakeS
add wave -noupdate -radix decimal /tb_booth/UT/accumulate
add wave -noupdate -radix unsigned /tb_booth/UT/mux_out_to_add
add wave -noupdate /tb_booth/UT/input_mux_sel
add wave -noupdate -radix unsigned /tb_booth/fakeA
add wave -noupdate -radix unsigned /tb_booth/fakeB
add wave -noupdate /tb_booth/UT/piso_2_in
add wave -noupdate /tb_booth/UT/piso_1_in
add wave -noupdate /tb_booth/UT/piso_0_in
add wave -noupdate /tb_booth/UT/piso_2_out
add wave -noupdate /tb_booth/UT/piso_1_out
add wave -noupdate /tb_booth/UT/piso_0_out
add wave -noupdate /tb_booth/UT/mux_i/A
add wave -noupdate -radix unsigned /tb_booth/UT/mux_i/B
add wave -noupdate -radix decimal /tb_booth/UT/mux_i/C
add wave -noupdate -radix unsigned /tb_booth/UT/mux_i/D
add wave -noupdate -radix decimal /tb_booth/UT/mux_i/E
add wave -noupdate -radix unsigned /tb_booth/UT/count
add wave -noupdate /tb_booth/UT/enable
add wave -noupdate /tb_booth/UT/busy
add wave -noupdate -radix unsigned /tb_booth/fakeP
add wave -noupdate -radix unsigned /tb_booth/UT/P
add wave -noupdate /tb_booth/UT/encod_loop(0)/en_level0/encod_0/B_in
add wave -noupdate /tb_booth/UT/encod_loop(0)/en_level0/encod_0/A_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10489920 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 200
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
WaveRestoreZoom {10486305 ps} {10500721 ps}

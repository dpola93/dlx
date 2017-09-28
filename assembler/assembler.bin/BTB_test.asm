addi r0,r0,24
beg_loop:
subu r0,r0,r4
lw r10,0(r0)
j beg_loop


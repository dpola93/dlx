nop
add r10,r1,r10
add r11,r1,r10
add r12,r11,r1
nop
lw r13, 0(r0)
add r14,r13,r2
nop
lw r15, 0(r0)
add r16,r1,r1
nop
add r17,r1,r1
j gg
nop
add r0,r0,r0
gg:
lw r20, 16(r0)
jr r20
sw 0(r0),r20
nop

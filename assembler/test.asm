nop
add r1,r6,r10
addi r1,r1,-4
subi r1,r1,-16
begin:
subui r1,r1,4
nop
add r0,r0,r0
nop
add r0,r0,r0
bnez r1,begin

nop
add r1,r6,r6
begin:
sub r1,r1,r4
bnez r1,begin
multu r2,r3,r4
nop
sw 0(r0),r2
nop

nop
add r1,r10,r0	;r1 <- 10
sll r1,r1,r4	;r1 <- 160
sub r2,r0,r10	;r2 <- -10
sll r2,r2,r4	;r1 <- -160
srl r31,r1,r3	;r31 <- 160/8
srl r31,r1,r4	;r31 <- 160/16
srl r31,r1,r5	;r31 <- 160/32
sra r31,r1,r3	;r31 <- 160/8
sra r31,r1,r4	;r31 <- 160/16
sra r31,r1,r5	;r31 <- 160/32
sra r31,r2,r3	;r31 <- -160/8
sra r31,r2,r4	;r31 <- -160/16
sra r31,r2,r5	;r31 <- -160/32
srl r31,r2,r3	;r31 <- ???
srl r31,r2,r4	;r31 <- ???
srl r31,r2,r5	;r31 <- ???
nop
add r1,r10,r0	;r1 <- 10
sub r2,r0,r10	;r2 <- -10
sll r31,r1,r3	;r31 <- 10*8
sll r31,r1,r4	;r31 <- 10*16
sll r31,r1,r5	;r31 <- 10*32
sll r31,r2,r3	;r31 <- -10*8
sll r31,r2,r4	;r31 <- -10*16
sll r31,r2,r5	;r31 <- -10*32

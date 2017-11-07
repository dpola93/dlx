

addi r10,r0,5 # size = 5
addi r11,r0,5 # i = 5
addi r12,r0,5 # j = 5
multu r15,r10,r10
slli r14,r10,2

loop1:
subui r11,r11,1 # i = i-1
addi r12,r0,5 # j = 5

loop2:

subui r12,r12,1 # j = j-1
addi r13,r0,5 #k = 5
addi r20,r0,0 #acc = 0

# r21 = size*i+size = 25
# the first will be 24 OK!
multu r21,r11,r10
addu r21,r21,r10
slli r21,r21,2  # shift for memory

# r22= size*k
multu r22,r10,r10 # size*size = 5*5 = 25
addu r22,r22,r12 # +j = 25+4 = 29 OK

addu r22,r22,r15 #shift offset +25 = 54
slli r22,r22,2 #= 220 #correction



#indexA = i*size+size
#indexB = size*size+j

loop3:
subui r13,r13,1
subui r21,r21,4
subu r22,r22,r14

#k=k-1
#indexA = indexA-1
#indexB = indexB-5

#sum+=A(indexA)xB(indexB)

lw r2,0(r21)
lw r3,0(r22)
#nop
mult r4,r2,r3
add r20,r20,r4

bnez r13 loop3

multu r4,r11,r10
addu r4,r4,r15
addu r4,r4,r12
addu r4,r4,r15
slli r4,r4,2
sw 0(r4),r20

bnez r12 loop2

bnez r11 loop1






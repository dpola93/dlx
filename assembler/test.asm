;; STALL AND FORWARD CHECK ;;
nop		; NOP
addi r1,r1,1	; R1 <- 1
addi r1,r1,1	; R1 <- 2
nop
add r0,r0,r0
nop		; WB R1 <- 1
add r0,r0,r0	; WB R1 <- 2
nop
addi r1,r1,1	; R1 <- 3
nop
addi r1,r1,1	; R1 <- 4
add r0,r0,r0
nop		; WB R1 <- 1
add r0,r0,r0
nop		; WB R1 <- 4
add r0,r0,r0
addi r1,r1,1	; R1 <- 5
nop
add r0,r0,r0
addi r1,r1,1	; R1 <- 6
nop		; WB R1 <- 5
add r0,r0,r0
nop
add r0,r0,r0	; WB R1 <- 6
nop
addi r1,r1,1	; R1 <- 7
nop
add r0,r0,r0
nop
addi r1,r1,1	; R1 <- 8 | WB R1 <- 7
nop
add r0,r0,r0
nop
add r0,r0,r0	; WB R1 <- 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
sw 0(r0),r1	; MEM(0) <- 8
nop		; NOP
add r0,r0,r0
nop	
add r0,r0,r0	;
lw r2,0(r0)	; R2 <- 8
addi r2,r2,1	; R2 <- 9
nop	
add r0,r0,r0	;
nop		; WB R2 <- 8
add r0,r0,r0	; WB R2 <- 9
nop
lw r3,0(r0)	; R3 <- 8
nop
addi r3,r3,1	; R3 <- 9
add r0,r0,r0
nop		; WB R3 <- 8
add r0,r0,r0
nop		; WB R3 <- 9
add r0,r0,r0
lw r4,0(r0)	; R4 <- 8
nop
add r0,r0,r0
addi r4,r4,1	; R4 <- 9
nop		; WB R4 <- 8
add r0,r0,r0
nop
add r0,r0,r0	; WB R4 <- 9
nop
lw r5,0(r0)	; R5 <- 8
nop
add r0,r0,r0
nop
addi r5,r5,1	; R5 <- 9 | WB R5 <- 8
nop
add r0,r0,r0
nop
add r0,r0,r0	; WB R5 <- 9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
addi r1,r0,LB1	; R1 <- LB1
jr r1		; STALL 1 cycle
nop
addi r31,r31,100; SHOULD NOT HAVE r31
nop
LB1:
add r0,r0,r0	; WB R1 <- LB1
nop
add r0,r0,r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
addi r1,r0,LB2	; R1 <- LB1
nop
jr r1		; BUBBLE NEXT 
nop
addi r31,r31,100; SHOULD NOT HAVE r31
LB2:
add r0,r0,r0	; WB R1 <- LB1
nop
add r0,r0,r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
addi r1,r0,LB3	; R1 <- LB3
nop
add r0,r0,r0
jr r1		; BUBBLE NEXT 
nop		; WB R1 <- LB1
addi r31,r31,100; SHOULD NOT HAVE r31
LB3:
add r0,r0,r0	
nop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
addi r1,r0,LB4	; R1 <- LB4
nop
add r0,r0,r0
nop
jr r1		; BUBBLE NEXT | WB R1 <- LB4
nop		;
addi r31,r31,100; SHOULD NOT HAVE r31
LB4:
add r0,r0,r0	
nop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
addi r1,r0,LB5
sw 4(r0),r1
addi r1,r0,LB6
sw 8(r0),r1
addi r1,r0,LB7
sw 12(r0),r1
addi r1,r0,LB8
sw 16(r0),r1
nop
add r0,r0,r0	
nop
add r0,r0,r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
nop		; NOP
lw r1,4(r0)	; R1 <- LB5
jr r1		; STALL 2 cycles
nop		; WB R1 <- LB5 on last stall
addi r31,r31,100; SHOULD NOT HAVE r31
nop
LB5:
add r0,r0,r0	
nop
add r0,r0,r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
lw r1,8(r0)	; R1 <- LB6
nop
jr r1		; BUBBLE NEXT 
nop
addi r31,r31,100; SHOULD NOT HAVE r31
LB6:
add r0,r0,r0	; WB R1 <- LB1
nop
add r0,r0,r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
lw r1,12(r0)	; R1 <- LB7
nop
add r0,r0,r0
jr r1		; BUBBLE NEXT 
nop		; WB R1 <- LB1
addi r31,r31,100; SHOULD NOT HAVE r31
LB7:
add r0,r0,r0	
nop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop		; NOP
lw r1,16(r0)	; R1 <- LB8
nop
add r0,r0,r0
nop
jr r1		; BUBBLE NEXT | WB R1 <- LB4
nop		;
addi r31,r31,100; SHOULD NOT HAVE r31
LB8:
add r0,r0,r0	
nop

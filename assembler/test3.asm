;nop
sub r1,r0,r1	; r10 <- -1
;seq r10,r1,r1 	; r10 <-  1
;seq r10,r1,r2	; r10 <-  0
;seq r10,r2,r2	; r10 <-  1
;seq r10,r2,r1	; r10 <-  0
;sne r10,r1,r1	; r10 <-  0
;sne r10,r1,r2	; r10 <-  1
;sne r10,r2,r2	; r10 <-  0
;sne r10,r2,r1	; r10 <-  1
;nop
;sgt r10,r0,r0	; r10 <-  0
;sge r10,r0,r0	; r10 <-  1
;slt r10,r0,r0	; r10 <-  0
;sle r10,r0,r0	; r10 <-  1
;sgt r10,r1,r1	; r10 <-  0
;sge r10,r1,r1	; r10 <-  1
;slt r10,r1,r1	; r10 <-  0
;sle r10,r1,r1	; r10 <-  1
;sgt r10,r2,r2	; r10 <-  0
;sge r10,r2,r2	; r10 <-  1
;slt r10,r2,r2	; r10 <-  0
;sle r10,r2,r2	; r10 <-  1
nop
sgt r10,r0,r1	; r10 <-  0
sge r10,r0,r1	; r10 <-  0
slt r10,r0,r1	; r10 <-  1
sle r10,r0,r1	; r10 <-  1
sgt r10,r1,r0	; r10 <-  1
sge r10,r1,r0	; r10 <-  1
slt r10,r1,r0	; r10 <-  0
sle r10,r1,r0	; r10 <-  0
sgt r10,r1,r2	; r10 <-  1
sge r10,r1,r2	; r10 <-  1
slt r10,r1,r2	; r10 <-  0
sle r10,r1,r2	; r10 <-  0

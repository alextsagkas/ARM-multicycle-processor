@---------- Globals ----------@
.global _start

_start:
	mov r0, r14    @ Check BL   
	@------- MOV/NOP -------@
	mov r0, #2          @ imm
	mov r0, r0          @ reg 
	
	cmp r0, #2          @ ZC
	
	moveq r1, #1        @ cond
	
	@--------- MVN ----------@
	mvn r2, #252        @ imm
	mvn r3, r1          @ reg 
	
	cmp r3, #1          @ NC
	
	mvneq r1, #1        @ cond
	
	@--------- ADD ----------@
	add r4, r3, #4      @ imm
	adds r5, r1, r0     @ reg 
	
	cmp r3, #1          @ NC
	
	addeq r1, r1, #1    @ cond
	
	@--------- SUB ----------@
	subs r6, r2, r3     @ reg
	sub r7, r5, #3      @ imm 
	
	mvn r8, #0xffffffff
	cmp r8, #1 @ NC
	
	subne r8, r1, #-1   @ cond
	
	@--------- AND ----------@
	mov r0, #5

	ands r9, r4, r0      @ reg
	and r10, r5, #2      @ imm 
	
	andeq r11, r5, #7    @ cond
	
	@--------- XOR ----------@
	lsl r11, r3, #30
	mvn r12, #0
	
	eor r11, r11, r12    @ reg
	eor r12, r8, #5      @ imm 
	
	cmp r11, r3          @ VN
	
	eorvs r9, r5, #7     @ cond
	
	@--------- LSL ----------@
	lsl r1, r1, #2       @ imm
	lsleq r1, r1, #2     @ cond
	
	@--------- ASR ----------@
	asr r3, r3, #2       @ imm
	asreq r0, r0, #2     @ cond
	
	@--------- STR ----------@
	mov r1, #0
	str r12, [r1, #0]    @ imm
	strmi r12, [r1, #4]  @ imm
	
	@--------- LDR ----------@
	ldr r0, [r1, #0]      @ imm
	ldreq r1, [r1, #4]    @ imm
	
	@--------- B/BL ----------@
	bl _start
/*********
 * 
 *
 * Project
 *		by Lisa Yoneyama and Yufei Wang
 *     
 * 
 * 
 *********/

.equ FRONTBUFFER, 0x08000000 # front buffer address
.equ SCREENSIZE, 76800
.equ SCREENWIDTH, 319
.equ SCREENHEIGHT, 239
.equ TIMER, 0xFF202000 # TIMER address
.equ TIMER2, 0xFF202020 # Second TIMER ADDRESS
.equ LEDR, 0xFF200000 # LEDR address
.equ PUSHBUTTON, 0xFF200050 # PUSHBUTTON address
.equ ADDR_JP2PORT, 0xFF200070 # HEXPAD address
.equ ADDR_JP2PORT_DIR, 0xFF200074 # HEXPAD address
.equ ONESECOND, 0x5F5E100 # 1 second
.equ HALFSECOND, 0x2FAF080 # 0.5 second / 120bpm
.equ HALFSECONDDELAY, 0x4C4B400 # 0.5 second / 120bpm DELAY
.equ ONESECONDDELAY, 0x8F0D180 # 1 second DELAY (1.5 seconds)

.section .text
.global _start
_start:
	/*set up stack pointer*/
	movia sp, 0x03FFFFFC /* put stack at top of SDRAM */

	call DRAWSTARTPAGE
	
	call SETUP
	
	# /* set LEDs to off */
	# movia r8, LEDR
	# stw r0, (r8)
	# /* set LEDS end */
	
	# /* timer interrupt set up start */
	# #initialize counter value
	# movia r8, TIMER
	
	# movui r9, %lo(HALFSECOND)
	# stwio r9, 8(r8)
	
	# movui r9, %hi(HALFSECOND)
	# stwio r9, 12(r8)
	
	# movia et, TIMER
	# # reset timer
	# stwio r0,(et)
	# /* timer set up end end */
	
	# /* timer2 set up start */
	# #initialize counter value
	# movia r8, TIMER2
	
	# movui r9, %lo(HALFSECONDDELAY)
	# stwio r9, 8(r8)
	
	# movui r9, %hi(HALFSECONDDELAY)
	# stwio r9, 12(r8)
	
	# # reset timer
	# #stwio r0,(r8)
	# /* TIMER set up end */
	
	# /* PUSHBUTTON interrupt set up start */
	# # enable interrupts for push buttons
	# movia r8, PUSHBUTTON
	# movi r9, 0xF
	# stw r9, 8(r8)
	
	# movi r9, 0xF
	# stw r9, 12(r8)
	# /* PUSHBUTTON interrupt set up end */
	
	# /* HEXKEYPAD set up start */
	# #set rows to input and columns to output
	# movia r8,ADDR_JP2PORT_DIR
	# movia r3,0xF0
	# stw   r3,0(r8)
	
	# movia r8,ADDR_JP2PORT
	# stw r0,(r8) #make all output pins low
	
	# #enabling interrupts for inputs
	# movi r9, 0x0F
	# stw r9, 8(r8)

    # #edge capture register
	# movi r9, 0x0F
	# stw r9, 12(r8)
	# /* HEXKEYPAD set up end */

	# /* interrupt set up start */
	# #enable external interrupts (1st bit for TIMER, 2nd bit for PUSHBUTTON, 3rd bit for 2nd TIMER, 12th bit for HEXKEYPAD)
	# movi r9, 0b1000000000011
	# wrctl ienable, r9
	
	# # enable global external interrupts
	# movi r9, 0b1
	# wrctl status, r9
	# /* interrupt set up end */

	# movi r15, 0 # count how many tiles have already been displayed
	# movi r14, 0 # count how many notes have been played
	

LOOP:
	br LOOP


# Set up ISR for the TIMER
.section .exceptions, "ax" # Ensures ISR is placed at 0x20
.global ISR
ISR:
	addi sp, sp, -16
	stw r3, (sp)
	stw r4, 4(sp)
	stw r16, 8(sp)
	stw r17, 12(sp)

CHECKTIMERINTERRUPT:
	rdctl et, ipending # check ipending (ctl14)
	andi et, et, 0x1 # if (irq0 ! = 1); irq0 is for TIMER
	beq et, r0, CHECKPUSHBUTTONINTERRUPT # then check for other interrupt

	/* TIMER interrupt start */
	#TimeOut (ITO == 1)
	movi r16, 0
	beq r16, r15, CALLTTLS
	movi r16, 1
	beq r16, r15, CALLTTLS
	movi r16, 2
	beq r16, r15, CALLCANON
	movi r16, 3
	beq r16, r15, CALLCANON
CALLTTLS:
	call TTLS
	br CHECKTIMERINTERRUPTNEXT
CALLCANON:
	call TTLS
	br CHECKTIMERINTERRUPTNEXT
	
CHECKTIMERINTERRUPTNEXT:	
	# Acknowledge interrupt
	movia et, TIMER
	stwio r0, (et) # reset timer (T0 == 0)

	# start; !CONT; interrupt
	movui r16, 0b101
	stwio r16, 4(et)
	br exit
	br CHECKPUSHBUTTONINTERRUPT
	/* TIMER interrupt end */

CHECKPUSHBUTTONINTERRUPT:
	rdctl et, ipending # check ipending (ctl14)
	andi et, et, 0b10 # if (irq0 ! = 1); irq1 is for PUSHBUTTON
	beq et, r0, CHECKHEXKEYPADINTERRUPT # then exit (not a hardware interrupt asserted)

	/* PUSHBUTTON interrupt code start */
	movi r16, 0
	beq r16, r15, CALLTTLSAUDIOEASY
	movi r16, 1
	beq r16, r15, CALLTTLSAUDIOHARD
	movi r16, 2
	beq r16, r15, CALLCANONAUDIOEASY
	movi r16, 3
	beq r16, r15, CALLCANONAUDIOHARD
CALLTTLSAUDIOEASY:
	call TTLSAUDIOEASY
	br exit
CALLTTLSAUDIOHARD:
	call TTLSAUDIOHARD
	br exit
CALLCANONAUDIOEASY:
	call TTLSAUDIOHARD
	br exit
CALLCANONAUDIOHARD:
	call TTLSAUDIOHARD
	br exit
	/* PUSHBUTTON interrupt code end */
	
CHECKHEXKEYPADINTERRUPT:
	rdctl et, ipending # check ipending (ctl4)
	andi et, et, 0b1000000000000 # if (irq1 ! = 12); irq1 is for PUSHBUTTON
	beq et, r0, exit # then exit (not a hardware interrupt asserted)
	
	/* HEXKEYPAD interrupt code start */
	movia et, ADDR_JP2PORT
	ldw r16, 12(et)
	
	andi r16, r16, 0b1
	movi r17, 0b1
	beq r16, r17, SONGISTTLSEASY
	andi r16, r16, 0b10
	movi r17, 0b10
	beq r16, r17, SONGISTTLSHARD
	andi r16, r16, 0b1
	movi r17, 0b1
	beq r16, r17, SONGISCANONEASY
	andi r16, r16, 0b1
	movi r17, 0b1
	beq r16, r17, SONGISCANONHARD
	br SONGISTTLSHARD

SONGISTTLSEASY:
	call SETUP
	movi r13, 0
	
	/* timer interrupt set up start */
	#initialize counter value
	movia et, TIMER
	
	movui r16, %lo(ONESECOND)
	stwio r16, 8(et)
	
	movui r16, %hi(ONESECOND)
	stwio r16, 12(et)
	
	# reset timer
	stwio r0,(et)
	/* timer set up end end */
	
	/* timer2 set up start */
	#initialize counter value
	movia et, TIMER2
	
	movui r16, %lo(ONESECONDDELAY)
	stwio r16, 8(et)
	
	movui r16, %hi(ONESECONDDELAY)
	stwio r16, 12(et)
	/* start timer start */
	movia et, TIMER
	# reset timer
	stwio r0,(et)
	
	# start timer; !CONT; interrupt
	movui r16, 0b101
	stwio r16, 4(et)
	/* start timer end */
	br HEXPADINTERRUPTNEXT

SONGISTTLSHARD:
	call SETUP
	movi r13, 1
	
	#reset timer
	movia et, TIMER
	stwio r0,(et)
	
	# start timer; !CONT; interrupt
	movui r16, 0b101
	stwio r16, 4(et)
	/* timer set up end end */
	br HEXPADINTERRUPTNEXT
SONGISCANONEASY:
	movi r13, 2
	movi r14, 0
	movi r15, 0
	br HEXPADINTERRUPTNEXT
SONGISCANONHARD:
	movi r13, 3
	movi r14, 0
	movi r15, 0
	br HEXPADINTERRUPTNEXT
HEXPADINTERRUPTNEXT:
	# reset edge bits
	movia et, ADDR_JP2PORT
	movi r16, 0xFF
	stw r16, 12(et)
	
/* HEXKEYPAD interrupt code start */

# On exit adjust the return value such that last instruction executes.
exit:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw r17, 12(sp)
	addi sp, sp, 16
	subi ea, ea, 4
	eret # exception return
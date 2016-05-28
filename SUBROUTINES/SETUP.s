/*********
 * 
 *
 * Project
 *		by Lisa Yoneyama and Yufei Wang
 *     
 * 
 * 
 *********/

.equ TIMER, 0xFF202000 # TIMER address
.equ TIMER2, 0xFF202020 # Second TIMER ADDRESS
.equ LEDR, 0xFF200000 # LEDR address
.equ PUSHBUTTON, 0xFF200050 # PUSHBUTTON address
.equ ADDR_JP2PORT, 0xFF200070 # HEXPAD address
.equ ADDR_JP2PORT_DIR, 0xFF200074 # HEXPAD address
.equ ONESECOND, 0x5F5E100 # 1 second
.equ HALFSECOND, 0x2FAF080 # 0.5 second / 120bpm
.equ HALFSECONDDELAY, 0x4C4B400 # 0.5 second / 120bpm DELAY

.section .text
.global SETUP
SETUP:
	addi sp, sp, -12
	stw r16, (sp)
	stw r17, 4(sp)
	stw ra, 8(sp)
	/* set LEDs to off */
	movia r16, LEDR
	stw r0, (r16)
	/* set LEDS end */
	
	/* timer interrupt set up start */
	#initialize counter value
	movia r16, TIMER
	
	movui r17, %lo(HALFSECOND)
	stwio r17, 8(r16)
	
	movui r17, %hi(HALFSECOND)
	stwio r17, 12(r16)
	
	# reset timer
	stwio r0,(r16)
	/* timer set up end end */
	
	/* timer2 set up start */
	#initialize counter value
	movia r16, TIMER2
	
	movui r17, %lo(HALFSECONDDELAY)
	stwio r17, 8(r16)
	
	movui r17, %hi(HALFSECONDDELAY)
	stwio r17, 12(r16)
	
	#reset timer
	stwio r0,(r16)
	/* TIMER set up end */
	
	/* PUSHBUTTON interrupt set up start */
	# enable interrupts for push buttons
	movia r16, PUSHBUTTON
	movi r17, 0xF
	stw r17, 8(r16)
	
	movi r17, 0xF
	stw r17, 12(r16)
	/* PUSHBUTTON interrupt set up end */
	
	/* HEXKEYPAD set up start */
	#set rows to input and columns to output
	movia r16,ADDR_JP2PORT_DIR
	movia r17,0xF0
	stw   r17,0(r16)
	
	movia r16,ADDR_JP2PORT
	stw r0,(r16) #make all output pins low
	
	#enabling interrupts for inputs
	movi r17, 0x0F
	stw r17, 8(r16)

    #edge capture register
	movi r17, 0x0F
	stw r17, 12(r16)
	/* HEXKEYPAD set up end */

	/* interrupt set up start */
	#enable external interrupts (1st bit for TIMER, 2nd bit for PUSHBUTTON, 3rd bit for 2nd TIMER, 12th bit for HEXKEYPAD)
	movi r16, 0b1000000000011
	wrctl ienable, r16
	
	# enable global external interrupts
	movi r16, 0b1
	wrctl status, r16
	/* interrupt set up end */

	movi r15, 0 # count how many tiles have already been displayed
	movi r14, 0 # count how many notes have been played
	movi r13, 1
	
	ldw r16, (sp)
	ldw r17, 4(sp)
	ldw ra, 8(sp)
	addi sp, sp, 12
	ret
/*********
 * 
 *
 * Project
 *		by Lisa Yoneyama and Yufei Wang
 *     
 * 
 * 
 *********/
 
.equ PUSHBUTTON, 0xFF200050 # PUSHBUTTON address
.equ TIMER2, 0xFF202020 # Second TIMER ADDRESS
.equ LEDR, 0xFF200000 # LEDR address
.equ ONESECONDDELAY, 0x8F0D180 # 1 second DELAY (1.5 seconds)

.section .text
.global CANONAUDIO
CANONAUDIO:
	addi sp, sp, -20
	stw r3, (sp)
	stw r4, 4(sp)
	stw r16, 8(sp)
	stw r17, 12(sp)
	stw ra, 16(sp)
	

#################################
# check if TIMER2 if timedout
	movia r16, TIMER2
	ldw r17, 0(r16)
	andi r17, r17, 0b01
	beq r17, r0, TTLSHARDCONT
	br TEMPELSE
	
TEMPELSE:
	movia r17, LEDR
	movia r16, 0xFF
	stw r16, (r17)
	call RETRY

TEMPLOOP:
	movia r17, LEDR
	movia r16, 0xFFF
	stw r16, (r17)
	call RETRY

CANONCONT:
	#initialize counter value
	movia r16, TIMER2
	
	movui r17, %lo(ONESECONDDELAY)
	stwio r17, 8(r16)
	
	movui r17, %hi(ONESECONDDELAY)
	stwio r17, 12(r16)

	beq r14, r0, CANONAUDIOCHECK0
	movi r16, 1
	beq r14, r16, CANONAUDIOCHECK1
	movi r16, 2
	beq r14, r16, CANONAUDIOCHECK2
    movi r16,3
    beq r14, r16, CANONAUDIOCHECK3
    movi r16,4
    beq r14, r16, CANONAUDIOCHECK4
    movi r16,5
    beq r14, r16, CANONAUDIOCHECK5
    movi r16,6
    beq r14, r16, CANONAUDIOCHECK6
    movi r16,7
    beq r14, r16, CANONAUDIOCHECK7
    movi r16,8
    beq r14, r16, CANONAUDIOCHECK8
    movi r16,9
    beq r14, r16, CANONAUDIOCHECK9
    movi r16,10
    beq r14, r16, CANONAUDIOCHECK10
    movi r16,11
    beq r14, r16, CANONAUDIOCHECK11
    movi r16,12
    beq r14, r16, CANONAUDIOCHECK12
    movi r16,13
    beq r14, r16, CANONAUDIOCHECK13
    movi r16,14
    beq r14, r16, CANONAUDIOCHECK14
    movi r16,15
    beq r14, r16, CANONAUDIOCHECK15
    movi r16,16
    beq r14, r16, CANONAUDIOCHECK16
    movi r16,17
    beq r14, r16, CANONAUDIOCHECK17
    movi r16,18
    beq r14, r16, CANONAUDIOCHECK18
    movi r16,19
    beq r14, r16, CANONAUDIOCHECK19
    movi r16,20
    beq r14, r16, CANONAUDIOCHECK20
    movi r16,21
    beq r14, r16, CANONAUDIOCHECK21
    movi r16,22
    beq r14, r16, CANONAUDIOCHECK22
    movi r16,23
    beq r14, r16, CANONAUDIOCHECK23
    movi r16,24
    beq r14, r16, CANONAUDIOCHECK24
	br CANONNOTE
	
	CANONAUDIOCHECK0:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPLOOP
		br CANONNOTE
		
	CANONAUDIOCHECK1:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE
		
	CANONAUDIOCHECK2:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONNOTE
		
	CANONAUDIOCHECK3:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

    CANONAUDIOCHECK4:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK5:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK6:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b001
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK7:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK8:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK9:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK10:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK11:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK12:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK13:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK14:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK15:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK16:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

    CANONAUDIOCHECK17:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK18:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK19:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK20:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK21:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK22:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK23:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOCHECK24:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONNOTE

####################################
CANONNOTE:
	movia r17, LEDR
	stwio r16, (r17)

	movia r17, PUSHBUTTON
	movi r16, 0xF
	stw r16, 12(r17)
		
	
	beq r14, r0, PLAYE
	movi r16, 1
	beq r14, r16, PLAYD
	movi r16, 2
	beq r14, r16, PLAYC
	movi r16, 3
	beq r14, r16, PLAYD
	movi r16, 4
	beq r14, r16, PLAYE
	movi r16, 5
	beq r14, r16, PLAYE
	movi r16, 6
	beq r14, r16, PLAYE
	movi r16, 7
	beq r14, r16, PLAYD
	movi r16, 8
	beq r14, r16, PLAYD
	movi r16, 9
	beq r14, r16, PLAYD
	movi r16, 10
	beq r14, r16, PLAYE
	movi r16, 11
	beq r14, r16, PLAYG
	movi r16, 12
	beq r14, r16, PLAYG
	movi r16, 13
	beq r14, r16, PLAYE
	movi r16, 14
    beq r14,r16, PLAY1D
    movi r16,15
    beq r14,r16, PLAYC
    movi r16,16
    beq r14,r16, PLAYD
    movi r16,17
	beq r14,r16, PLAYE
    movi r16,18
    beq r14,r16, PLAYE
    movi r16,19
    beq r14,r16, PLAYE
    movi r16,20
    beq r14,r16, PLAYD
    movi r16,21
    beq r14,r16, PLAYD
    movi r16,22
    beq r14,r16, PLAYE
    movi r16,23
    beq r14,r16, PLAYD
    movi r16,24
    beq r14,r16, PLAYC
	
PLAYC:
	call c_note
	br CANONAUDIONEXT

PLAYD:
	call d_note
	br CANONAUDIONEXT

PLAYE:
	call e_note
	br CANONAUDIONEXT

PLAYG:
	call g_note
	br CANONAUDIONEXT
	
	
CANONAUDIONEXT:
	addi r14, r14, 1
	
	/* turn LEDRs on according to PUSHBUTTON pressed */
	movia r17, PUSHBUTTON
	ldw r16, 12(r17)

	movia r17, LEDR
	stwio r16, (r17)

	movia r17, PUSHBUTTON
	movi r16, 0xF
	stw r16, 12(r17)
/* turn on LEDRs on according to PUSHBUTTON pressed end */
	
CANONAUDIODONE:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw r17, 12(sp)
	ldw ra, 16(sp)
	addi sp, sp, 20
	ret
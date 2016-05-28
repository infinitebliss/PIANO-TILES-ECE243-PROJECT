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
.equ HALFSECONDDELAY, 0x4C4B400 # 0.5 second / 120bpm DELAY

.section .text
.global CANONHARDAUDIO
CANONHARDAUDIO:
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
	beq r17, r0, CANONHARDCONT
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

CANONHARDCONT:
	#initialize counter value
	movia r16, TIMER2
	
	movui r17, %lo(ONESECONDDELAY)
	stwio r17, 8(r16)
	
	movui r17, %hi(ONESECONDDELAY)
	stwio r17, 12(r16)

	beq r14, r0, CANONAUDIOHARDCHECK0
	movi r16, 1
	beq r14, r16, CANONAUDIOHARDCHECK1
	movi r16, 2
	beq r14, r16, CANONAUDIOHARDCHECK2
    movi r16,3
    beq r14, r16, CANONAUDIOHARDCHECK3
    movi r16,4
    beq r14, r16, CANONAUDIOHARDCHECK4
    movi r16,5
    beq r14, r16, CANONAUDIOHARDCHECK5
    movi r16,6
    beq r14, r16, CANONAUDIOHARDCHECK6
    movi r16,7
    beq r14, r16, CANONAUDIOHARDCHECK7
    movi r16,8
    beq r14, r16, CANONAUDIOHARDCHECK8
    movi r16,9
    beq r14, r16, CANONAUDIOHARDCHECK9
    movi r16,10
    beq r14, r16, CANONAUDIOHARDCHECK10
    movi r16,11
    beq r14, r16, CANONAUDIOHARDCHECK11
    movi r16,12
    beq r14, r16, CANONAUDIOHARDCHECK12
    movi r16,13
    beq r14, r16, CANONAUDIOHARDCHECK13
    movi r16,14
    beq r14, r16, CANONAUDIOHARDCHECK14
    movi r16,15
    beq r14, r16, CANONAUDIOHARDCHECK15
    movi r16,16
    beq r14, r16, CANONAUDIOHARDCHECK16
    movi r16,17
    beq r14, r16, CANONAUDIOHARDCHECK17
    movi r16,18
    beq r14, r16, CANONAUDIOHARDCHECK18
    movi r16,19
    beq r14, r16, CANONAUDIOHARDCHECK19
    movi r16,20
    beq r14, r16, CANONAUDIOHARDCHECK20
    movi r16,21
    beq r14, r16, CANONAUDIOHARDCHECK21
    movi r16,22
    beq r14, r16, CANONAUDIOHARDCHECK22
    movi r16,23
    beq r14, r16, CANONAUDIOHARDCHECK23
    movi r16,24
    beq r14, r16, CANONAUDIOHARDCHECK24
	br CANONHARDNOTE
	
	CANONAUDIOHARDCHECK0:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPLOOP
		br CANONHARDNOTE
		
	CANONAUDIOHARDCHECK1:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE
		
	CANONAUDIOHARDCHECK2:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE
		
	CANONAUDIOHARDCHECK3:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

    CANONAUDIOHARDCHECK4:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK5:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK6:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b001
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK7:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK8:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK9:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK10:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK11:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK12:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK13:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK14:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK15:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK16:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

    CANONAUDIOHARDCHECK17:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK18:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONNOTE

	CANONAUDIOHARDCHECK19:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK20:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK21:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK22:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK23:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

	CANONAUDIOHARDCHECK24:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br CANONHARDNOTE

####################################
CANONHARDNOTE:
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
	br CANONAUDIOHARDNEXT

PLAYD:
	call d_note
	br CANONAUDIOHARDNEXT

PLAYE:
	call e_note
	br CANONAUDIOHARDNEXT

PLAYG:
	call g_note
	br CANONAUDIOHARDNEXT
	
	
CANONAUDIOHARDNEXT:
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
	
CANONAUDIOHARDDONE:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw r17, 12(sp)
	ldw ra, 16(sp)
	addi sp, sp, 20
	ret
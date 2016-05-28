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
.equ ONESECONDDELAY, 0x8F0D180 # 1 second DELAY (1.5seconds)

.section .text
.global TTLSAUDIOHARD
TTLSAUDIOHARD:
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

TTLSHARDCONT:
	#initialize counter value
	movia r16, TIMER2
	
	movui r17, %lo(HALFSECONDDELAY)
	stwio r17, 8(r16)
	
	movui r17, %hi(HALFSECONDDELAY)
	stwio r17, 12(r16)
		
	beq r14, r0, TTLSAUDIOHARDCHECK0
	movi r16, 1
	beq r14, r16, TTLSAUDIOHARDCHECK1
	movi r16, 2
	beq r14, r16, TTLSAUDIOHARDCHECK2
	movi r16, 3
	beq r14, r16, TTLSAUDIOHARDCHECK3
	movi r16, 4
	beq r14, r16, TTLSAUDIOHARDCHECK4
	movi r16, 5
	beq r14, r16, TTLSAUDIOHARDCHECK5
	movi r16, 6
	beq r14, r16, TTLSAUDIOHARDCHECK6
	movi r16, 7
	beq r14, r16, TTLSAUDIOHARDCHECK7
	movi r16, 8
	beq r14, r16, TTLSAUDIOHARDCHECK8
	movi r16, 9
	beq r14, r16, TTLSAUDIOHARDCHECK9
	movi r16, 10
	beq r14, r16, TTLSAUDIOHARDCHECK10
	movi r16, 11
	beq r14, r16, TTLSAUDIOHARDCHECK11
	movi r16, 12
	beq r14, r16, TTLSAUDIOHARDCHECK12
	movi r16, 13
	beq r14, r16, TTLSAUDIOHARDCHECK13
	movi r16, 14
	beq r14, r16, TTLSAUDIOHARDCHECK14
	movi r16, 15
	beq r14, r16, TTLSAUDIOHARDCHECK15
	movi r16, 16
	beq r14, r16, TTLSAUDIOHARDCHECK16
	movi r16, 17
	beq r14, r16, TTLSAUDIOHARDCHECK17
	movi r16, 18
	beq r14, r16, TTLSAUDIOHARDCHECK18
	movi r16, 19
	beq r14, r16, TTLSAUDIOHARDCHECK19
	movi r16, 20
	beq r14, r16, TTLSAUDIOHARDCHECK20
	movi r16, 21
	beq r14, r16, TTLSAUDIOHARDCHECK21
	movi r16, 22
	beq r14, r16, TTLSAUDIOHARDCHECK22
	movi r16, 23
	beq r14, r16, TTLSAUDIOHARDCHECK23
	movi r16, 24
	beq r14, r16, TTLSAUDIOHARDCHECK24
	movi r16, 25
	beq r14, r16, TTLSAUDIOHARDCHECK25
	movi r16, 26
	beq r14, r16, TTLSAUDIOHARDCHECK26
	movi r16, 27
	beq r14, r16, TTLSAUDIOHARDCHECK27
	movi r16, 28
	beq r14, r16, TTLSAUDIOHARDCHECK28
	movi r16, 29
	beq r14, r16, TTLSAUDIOHARDCHECK29
	movi r16, 30
	beq r14, r16, TTLSAUDIOHARDCHECK30
	movi r16, 31
	beq r14, r16, TTLSAUDIOHARDCHECK31
	movi r16, 32
	beq r14, r16, TTLSAUDIOHARDCHECK32
	movi r16, 33
	beq r14, r16, TTLSAUDIOHARDCHECK33
	movi r16, 34
	beq r14, r16, TTLSAUDIOHARDCHECK34
	movi r16, 35
	beq r14, r16, TTLSAUDIOHARDCHECK35
	movi r16, 36
	beq r14, r16, TTLSAUDIOHARDCHECK36
	movi r16, 37
	beq r14, r16, TTLSAUDIOHARDCHECK37
	movi r16, 38
	beq r14, r16, TTLSAUDIOHARDCHECK38
	movi r16, 39
	beq r14, r16, TTLSAUDIOHARDCHECK39
	movi r16, 40
	beq r14, r16, TTLSAUDIOHARDCHECK40
	movi r16, 41
	beq r14, r16, TTLSAUDIOHARDCHECK41
	br TTLSHARDNOTE
	
	TTLSAUDIOHARDCHECK0:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPLOOP
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK1:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK2:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK3:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK4:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
	
	TTLSAUDIOHARDCHECK5:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK6:
		/* timer interrupt set up start */
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(ONESECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(ONESECONDDELAY)
		stwio r17, 12(r16)
		
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK7:
		/* timer interrupt set up start */
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(HALFSECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(HALFSECONDDELAY)
		stwio r17, 12(r16)
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK8:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK9:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK10:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK11:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK12:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK13:
		/* timer interrupt set up start */
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(ONESECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(ONESECONDDELAY)
		stwio r17, 12(r16)
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK14:
		/* timer interrupt set up start */
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(HALFSECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(HALFSECONDDELAY)
		stwio r17, 12(r16)
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK15:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK16:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK17:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK18:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK19:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
	TTLSAUDIOHARDCHECK20:
		/* timer interrupt set up start */
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(ONESECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(ONESECONDDELAY)
		stwio r17, 12(r16)

		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE

	TTLSAUDIOHARDCHECK21:
		/* timer interrupt set up start */
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(HALFSECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(HALFSECONDDELAY)
		stwio r17, 12(r16)

		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE

	TTLSAUDIOHARDCHECK22:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE

	TTLSAUDIOHARDCHECK23:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE

	TTLSAUDIOHARDCHECK24:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE

	TTLSAUDIOHARDCHECK25:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE

	TTLSAUDIOHARDCHECK26:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK27:
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(ONESECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(ONESECONDDELAY)
		stwio r17, 12(r16)
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK28:
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(HALFSECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(HALFSECONDDELAY)
		stwio r17, 12(r16)
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK29:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK30:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK31:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK32:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
	
	TTLSAUDIOHARDCHECK33:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK34:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK35:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK36:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK37:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK38:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b1000
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK39:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0100
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK40:
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0010
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
		
	TTLSAUDIOHARDCHECK41:
		#initialize counter value
		movia r16, TIMER2
	
		movui r17, %lo(ONESECONDDELAY)
		stwio r17, 8(r16)
	
		movui r17, %hi(ONESECONDDELAY)
		stwio r17, 12(r16)
		
		movia r16, PUSHBUTTON
		ldw r17, 12(r16)
		
		andi r17, r17, 0b0001
		beq r17, r0, TEMPELSE
		br TTLSHARDNOTE
####################################
TTLSHARDNOTE:
	movia r17, LEDR
	stwio r16, (r17)

	movia r17, PUSHBUTTON
	movi r16, 0xF
	stw r16, 12(r17)
		
	
	beq r14, r0, PLAYC
	movi r16, 1
	beq r14, r16, PLAYC
	movi r16, 2
	beq r14, r16, PLAYG
	movi r16, 3
	beq r14, r16, PLAYG
	movi r16, 4
	beq r14, r16, PLAYA
	movi r16, 5
	beq r14, r16, PLAYA
	movi r16, 6
	beq r14, r16, PLAYG
	movi r16, 7
	beq r14, r16, PLAYF
	movi r16, 8
	beq r14, r16, PLAYF
	movi r16, 9
	beq r14, r16, PLAYE
	movi r16, 10
	beq r14, r16, PLAYE
	movi r16, 11
	beq r14, r16, PLAYD
	movi r16, 12
	beq r14, r16, PLAYD
	movi r16, 13
	beq r14, r16, PLAYC
	movi r16, 14
	beq r14, r16, PLAYG
	movi r16, 15
	beq r14, r16, PLAYG
	movi r16, 16
	beq r14, r16, PLAYF
	movi r16, 17
	beq r14, r16, PLAYF
	movi r16, 18
	beq r14, r16, PLAYE
	movi r16, 19
	beq r14, r16, PLAYE
	movi r16, 20
	beq r14, r16, PLAYD
	movi r16, 21
	beq r14, r16, PLAYG
	movi r16, 22
	beq r14, r16, PLAYG
	movi r16, 23
	beq r14, r16, PLAYF
	movi r16, 24
	beq r14, r16, PLAYF
	movi r16, 25
	beq r14, r16, PLAYE
	movi r16, 26
	beq r14, r16, PLAYE
	movi r16, 27
	beq r14, r16, PLAYD
	movi r16, 28
	beq r14, r16, PLAYC
	movi r16, 29
	beq r14, r16, PLAYC
	movi r16, 30
	beq r14, r16, PLAYG
	movi r16, 31
	beq r14, r16, PLAYG
	movi r16, 32
	beq r14, r16, PLAYA
	movi r16, 33
	beq r14, r16, PLAYA
	movi r16, 34
	beq r14, r16, PLAYG
	movi r16, 35
	beq r14, r16, PLAYF
	movi r16, 36
	beq r14, r16, PLAYF
	movi r16, 37
	beq r14, r16, PLAYE
	movi r16, 38
	beq r14, r16, PLAYE
	movi r16, 39
	beq r14, r16, PLAYD
	movi r16, 40
	beq r14, r16, PLAYD
	movi r16, 41
	beq r14, r16, PLAYC
	
PLAYC:
	call c_note
	br TTLSAUDIOHARDNEXT

PLAYG:
	call g_note
	br TTLSAUDIOHARDNEXT
	
PLAYA:
	call a_note
	br TTLSAUDIOHARDNEXT
	
PLAYLONGG:
	call longg_note
	br TTLSAUDIOHARDNEXT
	
PLAYF:
	call f_note
	br TTLSAUDIOHARDNEXT
	
PLAYE:
	call e_note
	br TTLSAUDIOHARDNEXT
	
PLAYD:
	call d_note
	br TTLSAUDIOHARDNEXT

PLAYLONGC:
	call c_note
	br TTLSAUDIOHARDNEXT
	
PLAYLONGD:
	call d_note
	br TTLSAUDIOHARDNEXT
	
	
TTLSAUDIOHARDNEXT:
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
	
TTLSAUDIOHARDDONE:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw r17, 12(sp)
	ldw ra, 16(sp)
	addi sp, sp, 20
	ret
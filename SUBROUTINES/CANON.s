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
.equ ONESECOND, 0x5F5E100 # 1 second
.equ HALFSECOND, 0x2FAF080 # 0.5 second / 120bpm

.section .text
.global CANON
CANON:
	addi sp, sp, -16
	stw r3, (sp)
	stw r4, 4(sp)
	stw r16, 8(sp)
	stw ra, 12(sp)
	
	mov r3, r15
	call SEVENSEGDISPLAY
	
	call DRAWBACKGROUND

	beq r15, r0, DRAWSCREEN1
	movi r16, 1
	beq r15, r16, DRAWSCREEN2
	movi r16, 2
	beq r15, r16, DRAWSCREEN3
	movi r16, 3
	beq r15, r16, DRAWSCREEN4
	movi r16, 4
	beq r15, r16, DRAWSCREEN5
	movi r16, 5
	beq r15, r16, DRAWSCREEN6
	movi r16, 6
	beq r15, r16, DRAWSCREEN7
	movi r16, 7
	beq r15, r16, DRAWSCREEN8
	movi r16, 8
	beq r15, r16, DRAWSCREEN9
	movi r16, 9
	beq r15, r16, DRAWSCREEN10
	movi r16, 10
	beq r15, r16, DRAWSCREEN11
	movi r16, 11
	beq r15, r16, DRAWSCREEN12
	movi r16, 12
	beq r15, r16, DRAWSCREEN13
    movi r16, 13
    beq r15,r16, DRAWSCREEN14
    movi r16,14
    beq r15,r16, DRAWSCREEN15
    movi r16,15
    beq r15,r16, DRAWSCREEN16
    movi r16,16
    beq r15,r16, DRAWSCREEN17
    movi r15,r17
    beq r15,r16, DRAWSCREEN18
    movi r15,18
    beq r15,r16, DRAWSCREEN19
    movi r16,19
    beq r15,r16, DRAWSCREEN20
    movi r16,20
    beq r15,r16, DRAWSCREEN21
    movi r16,21
    beq r15,r16, DRAWSCREEN22
    movi r16,22
    beq r15,r16, DRAWSCREEN23
    movi r16,23
    beq r15,r16, DRAWSCREEN24
    movi r16,24
    beq r15,r16, DRAWSCREEN25
    movi r16,25
    beq r15,r16, DRAWSCREEN26
    movi r16,26
    beq r15,r16, DRAWSCREEN27
    movi r16,27
    beq r15,r16, DRAWSCREEN28
    movi r16,28
    beq r15,r16, DRAWSCREEN29
    movi r16,29
    beq r15,r16, DRAWSCREEN30
    movi r16,30
    beq r15,r16, DRAWSCREEN31
	call RETRY

DRAWSCREEN1:
	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 1st tile (1)
	br DRAWSCREENNEXT

DRAWSCREEN2:
    movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 2nd tile (1)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 1st tile (2)
    br DRAWSCREENNEXT

DRAWSCREEN3:
	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 3rd tile (1)

    movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 2nd tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 1st tile (3)
	br DRAWSCREENNEXT

DRAWSCREEN4:
    #first note played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,0
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN5:
    #second note played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,0
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN6:
    #third note played
    movi r3,0
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    br DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN7:
    #fourth note played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,240
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN8:
    #fifth note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,240
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN9:
    #sixth note is played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,240
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    call DRAWTILE

    movi r3,0
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN10:
    #seventh note is played
    movi r3,240
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,0
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN11:
    #eighth note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,0
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN12:
    #ninth note is played
    movi r3,0
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    call DRAWTILE

    movi r3,240
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN13:
    #tenth note is played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,240
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN14:
    #eleventh note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,240
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN15:
    #twelvth note is played
    movi r3,240
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,0
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN16:
    #thirteenth note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,0
    movi r4,60
    call DRAWTILE

    movi r3,240
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN17:
    #fourteenth note is played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,0
    movi r4,120
    call DRAWTILE

    movi r3,240
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN18:
    #fifteenth note is played
    movi r3,0
    movi r4,180
    call DRAWTILE

    movi r3,240
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN19:
    #sixteenth note is played
    movi r3,240
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    call DRAWTILE

    movi r3,240
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN20:
    #seventeenth note is played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,240
    movi r4,60
    call DRAWTILE

    movi r3,0
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN21:
    #eighteenth note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,240
    movi r4,120
    call DRAWTILE

    movi r3,0
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN22:
    #nineteenth note is played
    movi r3,240
    movi r4,180
    call DRAWTILE

    movi r3,0
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN23:
    #twentieth note is played
    movi r3,0
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    call DRAWTILE

    movi r3,240
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN24:
    #21 note is played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,240
    movi r4,60
    call DRAWTILE

    movi r3,160
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN25:
    #22 note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,240
    movi r4,120
    call DRAWTILE

    movi r3,160
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN26:
    #23 note is played
    movi r3,240
    movi r4,180
    call DRAWTILE

    movi r3,160
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,0
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN27:
    #24 note is played
    movi r3,160
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,0
    movi r4,60
    call DRAWTILE

    movi r3,80
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN28:
    #25 note is played
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,0
    movi r4,120
    call DRAWTILE

    movi r3,80
    movi r4,60
    call DRAWTILE

    movi r3,240
    movi r4,0
    call DRAWTILE
    br DRAWSCREENNEXT
DRAWSCREEN29:
    #SONG IS OVER
    movi r3,0
    movi r4,180
    call DRAWTILE

    movi r3,80
    movi r4,120
    call DRAWTILE

    movi r3,240
    movi r4,60
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN30:
    movi r3,80
    movi r4,180
    call DRAWTILE

    movi r3,240
    movi r4,120
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREEN31:
    movi r3,240
    movi r4,180
    call DRAWTILE
    br DRAWSCREENNEXT

DRAWSCREENNEXT:
	addi r15, r15, 1
	
	mov r3, r15
	call SEVENSEGDISPLAY
	
	# reset timer2
	movia r17, TIMER2
	# reset timer
	stwio r0,(r17)
	
	# start timer; !CONT; interrupt
	movui r16, 0b100
	stwio r16, 4(r17)
	

CANONDONE:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw ra, 12(sp)
	addi sp, sp, 16
	ret
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
.equ ONESECOND, 0x5F5E100 # 1 second
.equ HALFSECOND, 0x2FAF080 # 0.5 second / 120bpm

.section .text
.global TTLS
TTLS:
	addi sp, sp, -20
	stw r3, (sp)
	stw r4, 4(sp)
	stw r16, 8(sp)
	stw r17, 12(sp)
	stw ra, 16(sp)
	
	call DRAWBACKGROUND

	beq r15, r0, TTLSHARDDRAWSCREEN1
	movi r16, 1
	beq r15, r16, TTLSHARDDRAWSCREEN2
	movi r16, 2
	beq r15, r16, TTLSHARDDRAWSCREEN3
	movi r16, 3
	beq r15, r16, TTLSHARDDRAWSCREEN4
	movi r16, 4
	beq r15, r16, TTLSHARDDRAWSCREEN5
	movi r16, 5
	beq r15, r16, TTLSHARDDRAWSCREEN6
	movi r16, 6
	beq r15, r16, TTLSHARDDRAWSCREEN7
	movi r16, 7
	beq r15, r16, TTLSHARDDRAWSCREEN8
	movi r16, 8
	beq r15, r16, TTLSHARDDRAWSCREEN9
	movi r16, 9
	beq r15, r16, TTLSHARDDRAWSCREEN10
	movi r16, 10
	beq r15, r16, TTLSHARDDRAWSCREEN11
	movi r16, 11
	beq r15, r16, TTLSHARDDRAWSCREEN12
	movi r16, 12
	beq r15, r16, TTLSHARDDRAWSCREEN13
	movi r16, 13
	beq r15, r16, TTLSHARDDRAWSCREEN14
	movi r16, 14
	beq r15, r16, TTLSHARDDRAWSCREEN15
	movi r16, 15
	beq r15, r16, TTLSDRAWSCREEN16
	movi r16, 16
	beq r15, r16, TTLSDRAWSCREEN17
	movi r16, 17
	beq r15, r16, TTLSDRAWSCREEN18
	movi r16, 18
	beq r15, r16, TTLSDRAWSCREEN19
	movi r16, 19
	beq r15, r16, TTLSDRAWSCREEN20
	movi r16, 20
	beq r15, r16, TTLSDRAWSCREEN21
	movi r16, 21
	beq r15, r16, TTLSDRAWSCREEN22
	movi r16, 22
	beq r15, r16, TTLSDRAWSCREEN23
	movi r16, 23
	beq r15, r16, TTLSDRAWSCREEN24
	movi r16, 24
	beq r15, r16, TTLSDRAWSCREEN25
	movi r16, 25
	beq r15, r16, TTLSDRAWSCREEN26
	movi r16, 26
	beq r15, r16, TTLSDRAWSCREEN27
	movi r16, 27
	beq r15, r16, TTLSDRAWSCREEN28
	movi r16, 28
	beq r15, r16, TTLSDRAWSCREEN29
	movi r16, 29
	beq r15, r16, TTLSDRAWSCREEN30
	movi r16, 30
	beq r15, r16, TTLSDRAWSCREEN31
	movi r16, 31
	beq r15, r16, TTLSDRAWSCREEN32
	movi r16, 32
	beq r15, r16, TTLSDRAWSCREEN33
	movi r16, 33
	beq r15, r16, TTLSDRAWSCREEN34
	movi r16, 34
	beq r15, r16, TTLSDRAWSCREEN35
	movi r16, 35
	beq r15, r16, TTLSDRAWSCREEN36
	movi r16, 36
	beq r15, r16, TTLSDRAWSCREEN37
	movi r16, 37
	beq r15, r16, TTLSDRAWSCREEN38
	movi r16, 38
	beq r15, r16, TTLSDRAWSCREEN39
	movi r16, 39
	beq r15, r16, TTLSDRAWSCREEN40
	movi r16, 40
	beq r15, r16, TTLSDRAWSCREEN41
	movi r16, 41
	beq r15, r16, TTLSDRAWSCREEN42
	movi r16, 42
	beq r15, r16, TTLSDRAWSCREEN43
	movi r16, 43
	beq r15, r16, TTLSDRAWSCREEN44
	movi r16, 44
	beq r15, r16, TTLSDRAWSCREEN45
	movi r16, 45
	beq r15, r16, TTLSDRAWSCREEN46
	movi r16, 46
	beq r15, r16, TTLSDRAWSCREEN47
	movi r16, 47
	beq r15, r16, TTLSDRAWSCREEN48
	movi r16, 48
	beq r15, r16, TTLSDRAWSCREEN49
	movi r16, 49
	beq r15, r16, TTLSDRAWSCREEN50
	movi r16, 50
	beq r15, r16, TTLSDRAWSCREEN51
	call RETRY

TTLSHARDDRAWSCREEN1:
	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 1st tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN2:
	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 1st tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 2nd tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN3:
	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 1st tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 2nd tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 3rd tile (1)
	br TTLSHARDDRAWSCREENNEXT


TTLSHARDDRAWSCREEN4:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 1st tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 2nd tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 3rd tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 4th tile (1)
	
	# reset timer
	movia r17, TIMER2
	stwio r0, (r17) # reset timer (T0 == 0)

	# start; !CONT; !interrupt
	movui r16, 0b100
	stwio r16, 4(r17)
	
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN5:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 2nd tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 3rd tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 4th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 5th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN6:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 3rd tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 4th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 5th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 6th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN7:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 4th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 5th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 6th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 7th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN8:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 5th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 6th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 7th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 8th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN9:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 6h tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 7th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 8th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 9th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN10:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 7th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 8th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 9th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 10th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN11:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 8th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 9th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 10th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 11th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN12:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 9th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 10th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 11th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 12th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSHARDDRAWSCREEN13:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 10th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 11th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 12th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 13th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSHARDDRAWSCREEN14:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 11th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 12th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 13th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 14th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSHARDDRAWSCREEN15:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 12th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 13th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 14th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 15th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN16:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 13th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 14th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 15th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 16th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN17:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 14th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 15th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 16th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 17th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN18:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 15th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 16th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 17th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 18th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN19:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 16th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 17th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 18th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 19th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN20:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 17th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 18th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 19th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 20th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN21:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 17th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 18th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 19th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 20th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN22:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 18th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 19th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 20th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 21th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN23:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 19th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 20th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 21th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 22th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN24:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 20th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 21th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 22th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 23th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN25:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 21th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 22th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 23th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 24th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN26:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 22th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 23th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 24th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 25th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN27:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 23th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 24th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 25th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 26th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN28:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 24th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 25th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 26th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 27th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN29:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 25th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 26th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 27th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 28th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN30:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 26th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 27th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 28th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 29th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN31:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 27th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 28th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 29th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 30th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN32:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 28th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 29th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 30th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 31th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN33:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 29th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 30th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 31th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 32th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN34:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 30th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 31th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 32th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 33th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSDRAWSCREEN35:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 31th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 32th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 33th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 34th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN36:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 32th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 33th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 34th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 35th tile (1)
	br TTLSHARDDRAWSCREENNEXT

TTLSDRAWSCREEN37:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 33th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 34th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 35th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 36th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN38:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 34th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 35th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 36th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 37th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN39:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 35th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 36th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 37th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 38th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN40:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 36th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 37th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 38th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 39th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN41:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 37th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 38th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 39th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 40th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN42:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 38th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 39th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 40th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 41th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN43:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 39th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 40th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 41th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 42th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN44:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 39th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 40th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 41th tile (2)

	movi r3, 0
	movi r4, 0
	call DRAWTILE # draw 42th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN45:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 40th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 41th tile (3)

	movi r3, 0
	movi r4, 60
	call DRAWTILE # draw 42th tile (2)

	movi r3, 80
	movi r4, 0
	call DRAWTILE # draw 43th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN46:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 41th tile (4)

	movi r3, 0
	movi r4, 120
	call DRAWTILE # draw 42th tile (3)

	movi r3, 80
	movi r4, 60
	call DRAWTILE # draw 43th tile (2)

	movi r3, 160
	movi r4, 0
	call DRAWTILE # draw 44th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN47:
	movi r3, 0
	movi r4, 180
	call DRAWTILE # draw 42th tile (4)

	movi r3, 80
	movi r4, 120
	call DRAWTILE # draw 43th tile (3)

	movi r3, 160
	movi r4, 60
	call DRAWTILE # draw 44th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 45th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN48:
	movi r3, 80
	movi r4, 180
	call DRAWTILE # draw 43th tile (4)

	movi r3, 160
	movi r4, 120
	call DRAWTILE # draw 44th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 45th tile (2)

	movi r3, 240
	movi r4, 0
	call DRAWTILE # draw 46th tile (1)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN49:
	movi r3, 160
	movi r4, 180
	call DRAWTILE # draw 43th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 44th tile (3)

	movi r3, 240
	movi r4, 60
	call DRAWTILE # draw 45th tile (2)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN50:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 44th tile (4)

	movi r3, 240
	movi r4, 120
	call DRAWTILE # draw 45th tile (3)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSDRAWSCREEN51:
	movi r3, 240
	movi r4, 180
	call DRAWTILE # draw 45th tile (4)
	br TTLSHARDDRAWSCREENNEXT
	
TTLSHARDDRAWSCREENNEXT:
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
	

TTLSDONE:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw r17, 12(sp)
	ldw ra, 16(sp)
	addi sp, sp, 20
	ret
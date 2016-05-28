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

.section .text

.global DRAWBACKGROUND
DRAWBACKGROUND:
	/* store registers used in stack */
	addi sp, sp, -28
	stw r3, (sp)
	stw r4, 4(sp)
	stw r5, 8(sp)
	stw r6, 12(sp)
	stw r16, 16(sp)
	stw r17, 20(sp)
	stw ra, 24(sp)

	movi r3, 0 # start at the left of the screen
	movi r4, 0 # start at the top of the screen
	movia r5, 0x0FFFF # white
	movia r6, FRONTBUFFER # address to draw the pixel
	movia r16, SCREENWIDTH
	movia r17, SCREENHEIGHT

DRAWBACKGROUNDLOOP:
	call DRAWPIXEL
	bgt r4, r17, DRAWBACKGROUNDYDONE
	bgt r3, r16, DRAWBACKGROUNDXDONE
	addi r3, r3, 1
	br DRAWBACKGROUNDLOOP
DRAWBACKGROUNDXDONE: # when x is done
	addi r4, r4, 1
	movi r3, 0
	br DRAWBACKGROUNDLOOP
DRAWBACKGROUNDYDONE: # when y is done
	/* load back all registers stored on stack */
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r5, 8(sp)
	ldw r6, 12(sp)
	ldw r16, 16(sp)
	ldw r17, 20(sp)
	ldw ra, 24(sp)
	addi sp, sp, 28
	ret
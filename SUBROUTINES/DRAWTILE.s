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
.global DRAWTILE
DRAWTILE:
	# r3 is the x start coordinate
	# r4 is the y start coordinate
	/* store registers used in stack */
	addi sp, sp, -32
	stw r3, (sp)
	stw r4, 4(sp)
	stw r5, 8(sp)
	stw r6, 12(sp)
	stw r16, 16(sp)
	stw r17, 20(sp)
	stw r18, 24(sp)
	stw ra, 28(sp)

	addi r16, r3, 79 # x end coordinate
	addi r17, r4, 60 # y end coordinate
	mov r18, r3 # mov x coordinate to r18
	movi r5, 0 # set color to black
	movia r6, FRONTBUFFER
DRAWTILELOOP:
	beq r4, r17, DRAWTILEYDONE # go to DRAWTILEYDONE when r4 == y end coordinate
	call DRAWPIXEL
	beq r3, r16, DRAWTILEXDONE # go to DRAWTILEXDONE when r3 == x end coordinate
	addi r3, r3, 1 # increment x coordinate
	br DRAWTILELOOP
DRAWTILEXDONE:
	addi r4, r4, 1 # incremetn y coordinate
	mov r3, r18 # restore value of x start coordinate
	br DRAWTILELOOP
DRAWTILEYDONE:
	/* load back all registers stored on stack */
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r5, 8(sp)
	ldw r6, 12(sp)
	ldw r16, 16(sp)
	ldw r17, 20(sp)
	ldw r18, 24(sp)
	ldw ra, 28(sp)
	addi sp, sp, 32
	ret
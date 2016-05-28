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

.global DRAWPIXEL
DRAWPIXEL:
	# r3 is the x location
	# r4 is the y location
	# r5 is the color
	# r6 is the address to draw pixel
	/* store registers used in stack */
	addi sp, sp, -24
	stw r3, (sp)
	stw r4, 4(sp)
	stw r5, 8(sp)
	stw r6, 12(sp)
	stw r16, 16(sp)
	stw ra, 20(sp)

	mov r16, r6 # mov address of frontbuffer to r16
	slli r3, r3, 1 # shift r3 one to the left
	or r16, r16, r3 # or frontbuffer address with r3
	slli r4, r4, 10 # shift r4 10 to the left
	or r16, r16, r4 # or frontbuffer address with r4
	sth r5, (r16) # white the color in the correct location

	/* load back all registers stored on stack */
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r5, 8(sp)
	ldw r6, 12(sp)
	ldw r16, 16(sp)
	ldw ra, 20(sp)
	addi sp, sp, 24
	ret
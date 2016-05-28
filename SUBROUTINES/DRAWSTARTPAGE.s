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

IMAGE:
 .incbin "start.bin"
 
.section .text

.global DRAWSTARTPAGE
DRAWSTARTPAGE:
	/* store everything in stack */
	addi sp, sp, -32
	stw r3, (sp)
	stw r4, 4(sp)
	stw r5, 8(sp)
	stw r6, 12(sp)
	stw r16, 16(sp)
	stw r17, 20(sp)
	stw r18, 24(sp)
	stw ra, 28(sp)
	
	movia r16,IMAGE
    addi r16,r16,16
	
	movi r3, 0
	movi r4, 0
	movi r5, 0
	movia r6, FRONTBUFFER

    movi r17,319 #limit for x
    movi r18,239 #limit for y
	  
imageLOOP:
	beq r4, r18, imageDONE
	ldhio r5, (r16)
	call DRAWPIXEL
	beq r3, r17, imageXDONE
	addi r3, r3, 1
	addi r16, r16, 2
	br imageLOOP
imageXDONE:
	addi r4, r4, 1
	addi r16, r16, 2
	movi r3, 0
	br imageLOOP:

imageDONE:
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
	




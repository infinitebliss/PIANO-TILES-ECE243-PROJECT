.equ AUDIO, 0xFF203040
.section .data
.global LONGC
.global LONGC_END

LONGC:
	.include "LONGC.s"
LONGC_END:
    
.section .text
	#r8 address of audio
    #r9 music file address

.global longc_note
longc_note:
	addi sp,sp,-28
	stw r2, (sp)
	stw r4, 4(sp)
	stw r5, 8(sp)
	stw r16,12(sp)
	stw r17,16(sp)
	stw r18, 20(sp)
	stw ra, 24(sp)
    movia	r16, AUDIO

    #move address to registers
LONGCLOOP:
    movia	r17, LONGC
    movia	r18, LONGC_END

LONGCNEXT:
    ldh	r4, 0(r17) #load memory from music file
    ldh	r5, 2(r17)
    call LONGCPLAY
    addi r17, r17, 4		#go to next sample
    bltu r17, r18, LONGCNEXT   #if music did not reach end continue storing
    br	LONGCEND


LONGCPLAY:
    ldwio	r2, 4(r16)
    srli	r2, r2, 24
    beq	r2, r0, LONGCPLAY
    sthio	r4, 8(r16)	#send 1sound to left audio
    sthio	r5, 12(r16) #send sound to right audio
    ret

LONGCEND:
	ldw r2, (sp)
	ldw r4, 4(sp)
	ldw r5, 8(sp)
	ldw r16,12(sp)
	ldw r17,16(sp)
	ldw r18, 20(sp)
	ldw ra, 24(sp)
	addi sp, sp, 28
    ret

	
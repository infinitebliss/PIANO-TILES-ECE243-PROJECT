.equ ADDR_7SEG1, 0xFF200020
.equ ADDR_7SEG2, 0xFF200030


.global SEVENSEGDISPLAY
SEVENSEGDISPLAY:
	addi sp, sp, -20
	stw r3, (sp)
	stw r4, 4(sp)
	stw r16, 8(sp)
	stw r17, 12(sp)
	stw ra, 16(sp)
	movia r16, 9
	movi r4, 0
	blt r16, r3, GREATERTHANNINE

LESSTHANNINE:
	beq r3, r0, ZERO
	movi r16, 1
	beq r3, r16, ONE
	movi r16, 2
	beq r3, r16, TWO
	movi r16, 3
	beq r3, r16, THREE
	movi r16, 4
	beq r3, r16, FOUR
	movi r16, 5
	beq r3, r16, FIVE
	movi r16, 6
	beq r3, r16, SIX
	movi r16, 7
	beq r3, r16, SEVEN
	movi r16, 8
	beq r3, r16, EIGHT
	movi r16, 9
	beq r3, r16, NINE
	br SEVENSEGEXIT

GREATERTHANNINE:
	movia r16, 20
	blt r3, r16, TENS
	movia r16, 30
	blt r3, r16, TWENTIES
	movia r16, 40
	blt r3, r16, THIRTIES
	movia r16, 50
	blt r3, r16, FOURTIES
	movia r16, 60
	blt r3, r16, FIFTIES
	movia r16, 70
	blt r3, r16, SIXTIES
	movia r16, 80
	blt r3, r16, SEVENTIES
	movia r16, 90
	blt r3, r16, EIGHTIES
	movia r16, 100
	blt r3, r16, NINTIES
	TENS:
		movia r4, 0x600
		subi r3, r3, 10
		br LESSTHANNINE
	TWENTIES:
		movia r4, 0x5B00
		subi r3, r3, 20
		br LESSTHANNINE
	THIRTIES:
		movia r4, 0x4F00
		subi r3, r3, 30
		br LESSTHANNINE
	FOURTIES:
		movia r4, 0x6600
		subi r3, r3, 40
		br LESSTHANNINE
	FIFTIES:
		movia r4, 0x6D00
		subi r3, r3, 50
		br LESSTHANNINE
	SIXTIES:
		movia r4, 0x7D00
		subi r3, r3, 60
		br LESSTHANNINE
	SEVENTIES:
		movia r4, 0x700
		subi r3, r3, 70
		br LESSTHANNINE
	EIGHTIES:
		movia r4, 0x7F00
		subi r3, r3, 80
		br LESSTHANNINE
	NINTIES:
		movia r4, 0x6F00
		subi r3, r3, 90
		br LESSTHANNINE

SEVENSEGEXIT:
	ldw r3, (sp)
	ldw r4, 4(sp)
	ldw r16, 8(sp)
	ldw r17, 12(sp)
	ldw ra, 16(sp)
	addi sp, sp, 20
	ret
	
ZERO:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000003F # bits 0000110 will activate segments 0, 1, 2, 3, 4, 5
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
ONE:
	movia r16, ADDR_7SEG1
	movia r17, 0x00000006 # bits 0000110 will activate segments 1 and 2
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
TWO:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000005B # bits 0000110 will activate segments 0, 1, 3, 4, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
THREE:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000004F # bits 0000110 will activate segments 0, 1, 2, 3, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
FOUR:
	movia r16, ADDR_7SEG1
	movia r17, 0x00000066 # bits 0000110 will activate segments 1, 2, 5, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
FIVE:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000006D # bits 0000110 will activate segments 1, 2, 5, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
SIX:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000007D # bits 0000110 will activate segments 1, 2, 5, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
	
SEVEN:
	movia r16, ADDR_7SEG1
	movia r17, 0x00000007 # bits 0000110 will activate segments 1, 2, 5, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret

EIGHT:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000007F # bits 0000110 will activate segments 1, 2, 5, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret

NINE:
	movia r16, ADDR_7SEG1
	movia r17, 0x0000006F # bits 0000110 will activate segments 1, 2, 5, 6
	or r17, r17, r4
	stwio r17, 0(r16)
	ret
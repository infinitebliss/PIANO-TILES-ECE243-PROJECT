/*********
 * 
 *
 * Project
 *		by Lisa Yoneyama and Yufei Wang
 *     
 * 
 * 
 *********/


.section .text
.global RETRY
RETRY:
	call SETUP
	call DRAWSTARTPAGE
RETRYLOOP:
	br RETRYLOOP
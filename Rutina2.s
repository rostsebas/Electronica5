GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
E		   		   EQU 200000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Rutina2, CODE, READONLY,ALIGN=2
		THUMB
		EXPORT P21
		IMPORT Delay ;Proyecto.s	
		IMPORT Loop
			
		
P21
	;led4
	LDR R5, =GPIO_PORTB3
	LDR R4, =0x08
	VLDR.F32 S8, =5
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB3
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #2
	BGT P22
	BNE Loop
P22
	;led3
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x04
	VLDR.F32 S7, =4
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #3
	BGT P23
	BNE Loop
P23
	;led1
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x01
	VLDR.F32 S5, =2
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #4
	BGT P24
	BNE Loop
P24
	;led3
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x04
	VLDR.F32 S7, =4
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #5
	BGT P25
	BNE Loop
P25
	;led1
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x01
	VLDR.F32 S5, =2
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #6
	BGT P26
	BNE Loop
P26
	;led3
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x04
	VLDR.F32 S7, =4
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #7
	BGT P27
	BNE Loop
P27
	;led2
	LDR R5, =GPIO_PORTB1
	LDR R4, =0x02
	VLDR.F32 S6, =3
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #8
	BGT P28
	BNE Loop
	
P28
	;led1
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x01
	VLDR.F32 S5, =2
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #9
	BGT P29
	BNE Loop
	
P29
	;led3
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x04
	VLDR.F32 S7, =4
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #10
	BGT P2A
	BNE Loop
P2A
	;led4
	LDR R5, =GPIO_PORTB3
	LDR R4, =0x08
	VLDR.F32 S8, =5
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	LDR R5, =GPIO_PORTB3
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	BL Delay
	CMP R12, #10
	BEQ Loop
	
	ALIGN                           
    END 
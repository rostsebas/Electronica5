GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
E		   		   EQU 200000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Rutinas, CODE, READONLY,ALIGN=2
		THUMB
		EXPORT P11
		IMPORT Delay ;Proyecto.s	
		IMPORT Loop
			
		
P11
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
	CMP R12, #2
	BGT P12
	BNE Loop
P12
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
	CMP R12, #3
	BGT P13
	BNE Loop
P13
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
	CMP R12, #4
	BGT P14
	BNE Loop

P14
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
	CMP R12, #5
	BGT P15
	BNE Loop
	
P15
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
	CMP R12, #6
	BGT P16
	BNE Loop
	
P16
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
	BGT P17
	BNE Loop
P17
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
	BGT P18
	BNE Loop
	
P18
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
	BGT P19
	BNE Loop
	
P19
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
	BGT P1A
	BNE Loop
P1A
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
	CMP R12, #10
	BEQ Loop
	


	ALIGN                           
    END 
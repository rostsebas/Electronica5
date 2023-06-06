GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
E		   		   EQU 200000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Rutina3, CODE, READONLY,ALIGN=2
		THUMB
		EXPORT P31
		IMPORT Delay ;Proyecto.s	
		IMPORT Loop
			
P31
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
	CMP R12, #2
	BGT P32
	BNE Loop
P32
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
	BGT P33
	BNE Loop
P33
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
	BGT P34
	BNE Loop
P34
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
	BGT P35
	BNE Loop
P35
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
	CMP R12, #6
	BGT P36
	BNE Loop
P36
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
	CMP R12, #7
	BGT P37
	BNE Loop
P37
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
	CMP R12, #8
	BGT P38
	BNE Loop	
P38
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
	BGT P39
	BNE Loop
	
P39
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
	BGT P3A
	BNE Loop
P3A
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
	BEQ Loop
	
	ALIGN                           
    END 


	ALIGN                           
    END 
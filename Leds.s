GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
C		   		   EQU 100000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Leds, CODE, READONLY,ALIGN=2
		THUMB
		EXPORT Led1
		EXPORT Led2
		EXPORT Led3
		EXPORT Led4	
        EXPORT Rojo
		EXPORT Verde	
		IMPORT CMG		;Comparacion.s				
		IMPORT Perder
		IMPORT Avance	
		IMPORT Delay 	;Proyecto.s	
		IMPORT Loop
		
Led1 
	ADD R9, R9, #1
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x01
	STR R4, [R5]
	VLDR.F32 S1, =2
	LDR R2, =0
	LDR R3, =A
	BL Delay
	LDR R5, =GPIO_PORTB0
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	BL CMG
	B Loop
	
Led2
	ADD R9, R9, #1
	LDR R5, =GPIO_PORTB1
	LDR R4, =0x02
	STR R4, [R5]
	VLDR.F32 S1, =3
	LDR R2, =0
	LDR R3, =A
	BL Delay
	LDR R5, =GPIO_PORTB1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	BL CMG
	B Loop
	
Led3
	ADD R9, R9, #1
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x04
	STR R4, [R5]
	VLDR.F32 S1, =4
	LDR R2, =0
	LDR R3, =A
	BL Delay
	LDR R5, =GPIO_PORTB2
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	BL CMG
	B Loop
	
Led4
	ADD R9, R9, #1
	LDR R5, =GPIO_PORTB3
	LDR R4, =0x08
	STR R4, [R5]
	VLDR.F32 S1, =5
	LDR R2, =0
	LDR R3, =A
	BL Delay
	LDR R5, =GPIO_PORTB3
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	BL CMG
	B Loop
	
Rojo
	LDR R5, =GPIO_PORTE0
	LDR R4, =0x01
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =A
	BL Delay
	LDR R5, =GPIO_PORTE0
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	BL Perder
	

Verde
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x02
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =A
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	BL Avance


	

	ALIGN                           
    END 
GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
E		   		   EQU 200000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Comparacion3, CODE, READONLY,ALIGN=2
		THUMB	
		EXPORT Rutina3
		EXPORT Referencia3
		EXPORT V31
		EXPORT V32
		EXPORT V33
		EXPORT Com3	
		EXPORT Conteo3		
		IMPORT Tiempo	;Comparacion.s
		IMPORT Verde	;Leds.s
		IMPORT Rojo	
		IMPORT P31		;Rutina2.s	
		IMPORT Delay	;Proyecto.s
		IMPORT Loop	
			
Rutina3
	LDR R8, =8
	B Referencia3	
Referencia3
	ADD R8, #1
	B Conteo3
Conteo3
	ADD R12, #1
	CMP R12, #0
	BGT Tiempo
V31
	LDR R3, =A
	B P31	
V32
	LDR R3, =D
	B P31	
V33
	LDR R3, =E
	B P31
Com3
	CMP R9, #1
	BEQ L31
	CMP R9, #2
	BEQ L32
	CMP R9, #3
	BEQ L33
	CMP R9, #4
	BEQ L34
	CMP R9, #5
	BEQ L35
	CMP R9, #6
	BEQ L36
	CMP R9, #7
	BEQ L37
	CMP R9, #8
	BEQ L38
	CMP R9, #9
	BEQ L39
	CMP R9, #10
	BEQ L3A
	
L31
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ L1b
	BNE Rojo	
L1b
	CMP R12, #1
	BEQ Verde
	BNE Reset2
	
L32
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L2b
	BNE Rojo	
L2b
	CMP R12, #2
	BEQ Verde
	BNE Reset2
	
L33
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L3b
	BNE Rojo	
L3b
	CMP R12, #3
	BEQ Verde
	BNE Reset2
	
L34
	VCMP.F32 S1, S8
	VMRS APSR_nzcv, FPSCR
	BEQ L4b
	BNE Rojo

L4b
	CMP R12, #4
	BEQ Verde
	BNE Reset2
	
L35
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L5b
	BNE Rojo	
L5b
	CMP R12, #5
	BEQ Verde
	BNE Reset2
	
L36
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ L6b
	BNE Rojo
L6b
	CMP R12, #6
	BEQ Verde
	BNE Reset2	
	
L37
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L7b
	BNE Rojo	
L7b
	CMP R12, #7
	BEQ Verde
	BNE Reset2
	
L38
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L8b
	BNE Rojo	
L8b
	CMP R12, #8
	BEQ Verde
	BNE Reset2
	
L39
	VCMP.F32 S1, S8
	VMRS APSR_nzcv, FPSCR
	BEQ L9b
	BNE Rojo	
L9b
	CMP R12, #9
	BEQ Verde
	BNE Reset2
	
L3A
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ LAb
	BNE Rojo
LAb
	CMP R12, #10
	BEQ Verde
	BNE Reset2
	
Reset2
	VLDR.F32 S1, =0
	B Loop
	
	ALIGN                           
    END 
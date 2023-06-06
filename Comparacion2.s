GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
E		   		   EQU 200000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Comparacion2, CODE, READONLY,ALIGN=2
		THUMB	
		EXPORT Rutina2
		EXPORT Referencia2
		EXPORT V21
		EXPORT V22
		EXPORT V23
		EXPORT Com2	
		EXPORT Conteo2		
		IMPORT Tiempo	;Comparacion.s
		IMPORT Verde	;Leds.s
		IMPORT Rojo	
		IMPORT P21		;Rutina2.s	
		IMPORT Delay	;Proyecto.s
		IMPORT Loop	
			
Rutina2
	LDR R8, =4
	B Referencia2	
Referencia2
	ADD R8, #1
	B Conteo2
Conteo2
	ADD R12, #1
	CMP R12, #0
	BGT Tiempo
V21
	LDR R3, =A
	B P21	
V22
	LDR R3, =D
	B P21	
V23
	LDR R3, =E
	B P21	
Com2
	CMP R9, #1
	BEQ L21
	CMP R9, #2
	BEQ L22
	CMP R9, #3
	BEQ L23
	CMP R9, #4
	BEQ L24
	CMP R9, #5
	BEQ L25
	CMP R9, #6
	BEQ L26
	CMP R9, #7
	BEQ L27
	CMP R9, #8
	BEQ L28
	CMP R9, #9
	BEQ L29
	CMP R9, #10
	BEQ L2A
	
L21
	VCMP.F32 S1, S8
	VMRS APSR_nzcv, FPSCR
	BEQ L1a
	BNE Rojo
	
L1a
	CMP R12, #1
	BEQ Verde
	BNE Reset1
	
L22
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L2a
	BNE Rojo
	
L2a
	CMP R12, #2
	BEQ Verde
	BNE Reset1
	
L23
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L3a
	BNE Rojo
	
L3a
	CMP R12, #3
	BEQ Verde
	BNE Reset1
	
L24
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L4a
	BNE Rojo
	
L4a
	CMP R12, #4
	BEQ Verde
	BNE Reset1
	
L25
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L5a
	BNE Rojo
	
L5a
	CMP R12, #5
	BEQ Verde
	BNE Reset1
	
L26
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L6a
	BNE Rojo
	
L6a
	CMP R12, #6
	BEQ Verde
	BNE Reset1	
	
L27
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ L7a
	BNE Rojo
	
L7a
	CMP R12, #7
	BEQ Verde
	BNE Reset1
	
L28
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L8a
	BNE Rojo
	
L8a
	CMP R12, #8
	BEQ Verde
	BNE Reset1
	
L29
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ L9a
	BNE Rojo
	
L9a
	CMP R12, #9
	BEQ Verde
	BNE Reset1
	
L2A
	VCMP.F32 S1, S8
	VMRS APSR_nzcv, FPSCR
	BEQ LAa
	BNE Rojo
	
LAa
	CMP R12, #10
	BEQ Verde
	BNE Reset1
	
Reset1
	VLDR.F32 S1, =0
	B Loop
	
	ALIGN                           
    END 
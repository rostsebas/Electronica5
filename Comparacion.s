GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
	
E		   		   EQU 200000
D		   		   EQU 700000
A		   		   EQU 1400000		
	
		AREA    Comparacion, CODE, READONLY,ALIGN=2
		THUMB	
		EXPORT Rutina1
		EXPORT Tiempo
		EXPORT CMG
		EXPORT Perder
		EXPORT Avance
		EXPORT Ganar
		EXPORT Cambios	
		IMPORT Verde	;Leds.s
		IMPORT Rojo	
		IMPORT P11		;Rutinas.s	
		IMPORT V21 		;Rutina2.s
		IMPORT V22
		IMPORT V23
		IMPORT Referencia2
		IMPORT Com2
		IMPORT Conteo2	
		IMPORT V31 		;Rutina3.s
		IMPORT V32
		IMPORT V33
		IMPORT Referencia3
		IMPORT Com3
		IMPORT Conteo3
		IMPORT Delay	;Proyecto.s
		IMPORT Loop
			
Rutina1
	LDR R8, =0
	B Referencia1	
Referencia1
	ADD R8, #1
	B Conteo1	
Conteo1
	ADD R12, #1
	CMP R12, #0
	BGT Tiempo
V11
	LDR R3, =A
	B P11	
V12
	LDR R3, =D
	B P11
V13
	LDR R3, =E
	B P11		
Com1
	CMP R9, #1
	BEQ L11
	CMP R9, #2
	BEQ L12
	CMP R9, #3
	BEQ L13
	CMP R9, #4
	BEQ L14
	CMP R9, #5
	BEQ L15
	CMP R9, #6
	BEQ L16
	CMP R9, #7
	BEQ L17
	CMP R9, #8
	BEQ L18
	CMP R9, #9
	BEQ L19
	CMP R9, #10
	BEQ L1A
	
L11
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L1
	BNE Rojo	
L1
	CMP R12, #1
	BEQ Verde
	BNE Reset	
L12
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ L2
	BNE Rojo	
L2
	CMP R12, #2
	BEQ Verde
	BNE Reset	
L13
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L3
	BNE Rojo	
L3
	CMP R12, #3
	BEQ Verde
	BNE Reset	
L14
	VCMP.F32 S1, S8
	VMRS APSR_nzcv, FPSCR
	BEQ L4
	BNE Rojo	
L4
	CMP R12, #4
	BEQ Verde
	BNE Reset	
L15
	VCMP.F32 S1, S8
	VMRS APSR_nzcv, FPSCR
	BEQ L5
	BNE Rojo	
L5
	CMP R12, #5
	BEQ Verde
	BNE Reset	
L16
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L6
	BNE Rojo	
L6
	CMP R12, #6
	BEQ Verde
	BNE Reset		
L17
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ L7
	BNE Rojo	
L7
	CMP R12, #7
	BEQ Verde
	BNE Reset	
L18
	VCMP.F32 S1, S5
	VMRS APSR_nzcv, FPSCR
	BEQ L8
	BNE Rojo	
L8
	CMP R12, #8
	BEQ Verde
	BNE Reset	
L19
	VCMP.F32 S1, S7
	VMRS APSR_nzcv, FPSCR
	BEQ L9
	BNE Rojo	
L9
	CMP R12, #9
	BEQ Verde
	BNE Reset	
L1A
	VCMP.F32 S1, S6
	VMRS APSR_nzcv, FPSCR
	BEQ LA
	BNE Rojo	
LA
	CMP R12, #10
	BEQ Verde
	BNE Reset
	
	
Tiempo
	CMP R8, #1
	BEQ	V11
	CMP R8, #2
	BEQ	V12
	CMP R8, #3
	BEQ	V13
	CMP R8, #5
	BEQ	V21
	CMP R8, #6
	BEQ	V22
	CMP R8, #7
	BEQ	V23
	CMP R8, #9
	BEQ	V31
	CMP R8, #10
	BEQ	V32
	CMP R8, #11
	BEQ	V33
CMG
	CMP R8, #1
	BEQ Com1
	CMP R8, #2
	BEQ Com1
	CMP R8, #3
	BEQ Com1
	CMP R8, #5
	BEQ Com2
	CMP R8, #6
	BEQ Com2
	CMP R8, #7
	BEQ Com2
	CMP R8, #9
	BEQ Com3
	CMP R8, #10
	BEQ Com3
	CMP R8, #11
	BEQ Com3	
Reset 
	VLDR.F32 S1, =0
	B Loop
Perder
	VLDR.F32 S1, =0
	VLDR.F32 S5, =0
	VLDR.F32 S6, =0
	VLDR.F32 S7, =0
	VLDR.F32 S8, =0
	LDR R8, =0
	LDR R9, =0
	LDR R12, =0
	B Loop	
Avance
	VLDR.F32 S1, =0
	VLDR.F32 S5, =0
	VLDR.F32 S6, =0
	VLDR.F32 S7, =0
	VLDR.F32 S8, =0
	LDR R9, =0
	CMP R12, #10
	BEQ	Ganar
	CMP R12, #0
	BGT Control
Control
	CMP R8, #1
	BEQ Conteo1
	CMP R8, #2
	BEQ Conteo1
	CMP R8, #3
	BEQ Conteo1
	CMP R8, #5
	BEQ Conteo2
	CMP R8, #6
	BEQ Conteo2
	CMP R8, #7
	BEQ Conteo2
	CMP R8, #9
	BEQ Conteo3
	CMP R8, #10
	BEQ Conteo3
	CMP R8, #11
	BEQ Conteo3
Ganar
	VLDR.F32 S1, =0
	VLDR.F32 S5, =0
	VLDR.F32 S6, =0
	VLDR.F32 S7, =0
	VLDR.F32 S8, =0
	LDR R9, =0
	LDR R12, =0
	B RutinaW 
RutinaW
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x02
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x02
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x02
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x02
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	LDR R5, =GPIO_PORTE1
	LDR R4, =0x0
	STR R4, [R5]
	LDR R2, =0
	LDR R3, =D
	BL Delay
	B Cambios	
Cambios
	CMP R8, #1
	BEQ Referencia1
	CMP R8, #2
	BEQ Referencia1
	CMP R8, #3
	BEQ Referencia1
	CMP R8, #5
	BEQ Referencia2
	CMP R8, #6
	BEQ Referencia2
	CMP R8, #7
	BEQ Referencia2
	CMP R8, #9
	BEQ Referencia3
	CMP R8, #10
	BEQ Referencia3
	CMP R8, #11
	BEQ Referencia3
	B Loop
	
	ALIGN                           
    END 
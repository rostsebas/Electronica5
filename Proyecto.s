SYSCTL_RCGCGPIO_R  EQU 0x400FE608
GPIO_LOCK_KEY	   EQU 0x4C4F434B 
	
GPIO_PORTB0        EQU 0x40005004
GPIO_PORTB1        EQU 0x40005008
GPIO_PORTB2        EQU 0x40005010
GPIO_PORTB3        EQU 0x40005020
GPIO_PORTB4        EQU 0x40005040
GPIO_PORTB5	       EQU 0x40005080	
GPIO_PORTB6        EQU 0x40005100
GPIO_PORTB7        EQU 0x40005200
GPIO_PORTB_AMSEL_R EQU 0x40005528
GPIO_PORTB_PCTL_R  EQU 0x4000552C
GPIO_PORTB_DIR_R   EQU 0x40005400
GPIO_PORTB_AFSEL_R EQU 0x40005420
GPIO_PORTB_DEN_R   EQU 0x4000551C	
GPIO_PORTB_LOCK_R  EQU 0x40005520
GPIO_PORTB_CR_R    EQU 0x40005524
SWLED              EQU 0x400053C0	;3C0=420
;F4	E4	E5	D6	D7	C6	C7	A6	A7  
GPIO_PORTE0        EQU 0x40024004
GPIO_PORTE1        EQU 0x40024008
GPIO_PORTE2        EQU 0x40024010
GPIO_PORTE3        EQU 0x40024020
GPIO_PORTE4        EQU 0x40024040 
GPIO_PORTE5        EQU 0x40024080	
GPIO_PORTE_AMSEL_R EQU 0x40024528
GPIO_PORTE_PCTL_R  EQU 0x4002452C
GPIO_PORTE_DIR_R   EQU 0x40024400
GPIO_PORTE_AFSEL_R EQU 0x40024420
GPIO_PORTE_DEN_R   EQU 0x4002451C	
GPIO_PORTE_LOCK_R  EQU 0x40024520
GPIO_PORTE_CR_R    EQU 0x40024524	
SWRUTINA           EQU 0x400240E0	
	
C		   		   EQU 100000

		 AREA    Proyecto, CODE, READONLY,ALIGN=2
		 THUMB
		 EXPORT Start 
		 EXPORT	Delay
		 EXPORT	Loop  
		 IMPORT Led1 			;Leds.s
		 IMPORT Led2
         IMPORT Led3
	     IMPORT Led4		 
		 IMPORT Rojo	
		 IMPORT Verde	
		 IMPORT Rutina1	  ;Rutinas.s	
		 IMPORT Rutina2	  ;Rutina2.s
		 IMPORT Rutina3	  ;Rutina3.s
		
Start
;Configuración del puerto B.
	;activación de reloj para puerto B.
    LDR R1, =SYSCTL_RCGCGPIO_R
    LDR R0, [R1]                   
    ORR R0, R0, #0x02            
    STR R0, [R1]                   
    NOP
    NOP
	;desbloqueo de pines.
	LDR R1, =GPIO_PORTB_LOCK_R	
	LDR R0, =GPIO_LOCK_KEY                     
    STR R0, [R1]
    LDR R1, =GPIO_PORTB_CR_R    
    MOV R0, #0xFF                   
    STR R0, [R1]   
	
	;deshabilitar función analógica.
    LDR R1, =GPIO_PORTB_AMSEL_R   
	LDR R0, [R1] 	
    BIC R0, #0xFF                      
    STR R0, [R1]
	
	;configurar como GPIO.
    LDR R1, =GPIO_PORTB_PCTL_R      
    LDR R0, [R1]   	
    BIC R0, R0, #0x000000FF  
	BIC R0, R0, #0x00000F00	
    STR R0, [R1]   
	;especificar dirección de PB0.
    LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    ORR R0, R0, #0x01              
    STR R0, [R1]	
	;especificar dirección de PB1.
    LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    ORR R0, R0, #0x02              
    STR R0, [R1] 
	;especificar dirección de PB2.
    LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    ORR R0, R0, #0x04              
    STR R0, [R1] 
	;especificar dirección de PB3.
    LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    ORR R0, R0, #0x08              
    STR R0, [R1] 
	;especificar dirección de PB4.
	LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    BIC R0, R0, #0x10             
    STR R0, [R1] 
	;especificar dirección de PB5.
	LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    BIC R0, R0, #0x20             
    STR R0, [R1] 
	;especificar dirección de PB6.
	LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    BIC R0, R0, #0x40              
    STR R0, [R1]
	;especificar dirección de PB7.
	LDR R1, =GPIO_PORTB_DIR_R      
    LDR R0, [R1]                   
    BIC R0, R0, #0x80              
    STR R0, [R1]   	
	;limpiar bits en función alternativa.
    LDR R1, =GPIO_PORTB_AFSEL_R    
    LDR R0, [R1]                   
    BIC R0, R0, #0xFF             
    STR R0, [R1]    
	;habilitar como puerto digital.
    LDR R1, =GPIO_PORTB_DEN_R      
    LDR R0, [R1]                   
    ORR R0, R0, #0xFF             
    STR R0, [R1]  
	
;Configuración del purto E.	
	;activación de reloj para puerto E.
    LDR R7, =SYSCTL_RCGCGPIO_R
    LDR R6, [R7]                   
    ORR R6, R6, #0x10           
    STR R6, [R7]                   
    NOP
    NOP
	;desbloqueo de pines.
	LDR R7, =GPIO_PORTE_LOCK_R	
	LDR R6, =GPIO_LOCK_KEY                     
    STR R6, [R7]
    LDR R7, =GPIO_PORTE_CR_R    
    MOV R6, #0xFF                   
    STR R6, [R7]   	
	;deshabilitar función analógica.
    LDR R7, =GPIO_PORTE_AMSEL_R   
	LDR R6, [R7] 	
    BIC R6, #0xFF                      
    STR R6, [R7]
	;configurar como GPIO.
    LDR R7, =GPIO_PORTE_PCTL_R      
    LDR R6, [R7]   	
    BIC R6, R6, #0x000000FF  
	BIC R6, R6, #0x00000F00	
    STR R6, [R7]   
	;especificar dirección de PE0.
    LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                   
    ORR R6, R6, #0x01              
    STR R6, [R7]	
	;especificar dirección de PE1.
    LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                   
    ORR R6, R6, #0x02              
    STR R6, [R7] 
	;especificar dirección de PE2.
    LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                   
    ORR R6, R6, #0x04             
    STR R6, [R7] 
	;especificar dirección de PE3.
    LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                   
    ORR R6, R6, #0x0              
    STR R6, [R7] 
	;especificar dirección de PE4.
	LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                   
    BIC R6, R6, #0x10           
    STR R6, [R7] 
	;especificar dirección de PE5.
	LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                  
    BIC R6, R6, #0x0           
    STR R6, [R7] 
	;especificar dirección de PE45.
	LDR R7, =GPIO_PORTE_DIR_R      
    LDR R6, [R7]                  
    BIC R6, R6, #0x30           
    STR R6, [R7] 
	;limpiar bits en función alternativa.
    LDR R7, =GPIO_PORTE_AFSEL_R    
    LDR R6, [R7]                   
    BIC R6, R6, #0xFF             
    STR R6, [R7]    
	;habilitar como puerto digital.
    LDR R7, =GPIO_PORTE_DEN_R      
    LDR R6, [R7]                   
    ORR R6, R6, #0xFF             
    STR R6, [R7]  
	
	LDR R3, =C
	B Loop 

Delay	; Rutina de retardo de 50ms.
	ADD R2, #1
	NOP
	NOP
	NOP
	NOP
	CMP R2, R3
	BNE Delay
	BX LR
		
Loop	;Ciclo para lectura de los switch.
	;Leer el valor del switch.	
	LDR R1, = SWLED
	LDR R0, [R1]
	LDR R7, = SWRUTINA
	LDR R6, [R7]
	;Retardo.
	LDR R2, =0
	LDR R3, =C
	BL Delay
	;Encendido leds
	CMP R0, #0x10
	BEQ Led1
	CMP R0, #0x20
	BEQ Led2
	CMP R0, #0x40
	BEQ Led3
	CMP R0, #0x80
	BEQ Led4
	;Encendido rutinas
	CMP R6, #0x08
	BEQ Rutina3	
	CMP R6, #0x10
	BEQ Rutina1
	CMP R6, #0x20
	BEQ Rutina2	
	B Loop
	
    ALIGN                           
    END  


_main:

;Affichage_BCD_PIC16F877.c,1 :: 		void main() {
;Affichage_BCD_PIC16F877.c,3 :: 		TRISB = 0;
	CLRF       TRISB+0
;Affichage_BCD_PIC16F877.c,4 :: 		TRISC = 0;
	CLRF       TRISC+0
;Affichage_BCD_PIC16F877.c,5 :: 		TRISD = 0;
	CLRF       TRISD+0
;Affichage_BCD_PIC16F877.c,7 :: 		PORTB = 3<<1;
	MOVLW      6
	MOVWF      PORTB+0
;Affichage_BCD_PIC16F877.c,8 :: 		PORTC = 4 | 5<<4;
	MOVLW      84
	MOVWF      PORTC+0
;Affichage_BCD_PIC16F877.c,9 :: 		PORTD = 0b00011000;
	MOVLW      24
	MOVWF      PORTD+0
;Affichage_BCD_PIC16F877.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

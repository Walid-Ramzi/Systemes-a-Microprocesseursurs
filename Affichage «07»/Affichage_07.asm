
_main:

;Affichage_07.c,1 :: 		void main () {
;Affichage_07.c,3 :: 		trisc=0;
	CLRF       TRISC+0
;Affichage_07.c,4 :: 		trisd=0 ;
	CLRF       TRISD+0
;Affichage_07.c,6 :: 		portc=0b11110111  ;
	MOVLW      247
	MOVWF      PORTC+0
;Affichage_07.c,7 :: 		portd=0b10001111  ;
	MOVLW      143
	MOVWF      PORTD+0
;Affichage_07.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

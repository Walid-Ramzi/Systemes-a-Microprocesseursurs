
_main:

;Affichage_par_Chargement.c,2 :: 		void main() {
;Affichage_par_Chargement.c,3 :: 		TRISA=0;
	CLRF       TRISA+0
;Affichage_par_Chargement.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;Affichage_par_Chargement.c,5 :: 		PORTB=TAB [0]; PORTA.f0=0; PORTA.f0=1;
	MOVF       _TAB+0, 0
	MOVWF      PORTB+0
	BCF        PORTA+0, 0
	BSF        PORTA+0, 0
;Affichage_par_Chargement.c,6 :: 		PORTB=TAB [1]; PORTA.f1=0; PORTA.f1=1;
	MOVF       _TAB+2, 0
	MOVWF      PORTB+0
	BCF        PORTA+0, 1
	BSF        PORTA+0, 1
;Affichage_par_Chargement.c,7 :: 		PORTB=TAB [2]; PORTA.f2=0; PORTA.f2=1;
	MOVF       _TAB+4, 0
	MOVWF      PORTB+0
	BCF        PORTA+0, 2
	BSF        PORTA+0, 2
;Affichage_par_Chargement.c,8 :: 		PORTB=TAB [3]; PORTA.f3=0; PORTA.f3=1;
	MOVF       _TAB+6, 0
	MOVWF      PORTB+0
	BCF        PORTA+0, 3
	BSF        PORTA+0, 3
;Affichage_par_Chargement.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

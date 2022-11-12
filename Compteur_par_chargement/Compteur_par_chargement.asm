
_main:

;Compteur_par_chargement.c,3 :: 		void main() {
;Compteur_par_chargement.c,4 :: 		TRISA=0;
	CLRF       TRISA+0
;Compteur_par_chargement.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;Compteur_par_chargement.c,6 :: 		for(i=0;i<=9;i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _i+0, 0
	SUBLW      9
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main1
;Compteur_par_chargement.c,7 :: 		for(j=0;j<=9;j++) {
	CLRF       _j+0
	CLRF       _j+1
L_main3:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _j+0, 0
	SUBLW      9
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Compteur_par_chargement.c,8 :: 		PORTB= Tab[i]; PORTA.f0=0; PORTA.f0=1;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _Tab+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BCF        PORTA+0, 0
	BSF        PORTA+0, 0
;Compteur_par_chargement.c,9 :: 		PORTB= Tab[j]; PORTA.f1=0; PORTA.f1=1;
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _Tab+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BCF        PORTA+0, 1
	BSF        PORTA+0, 1
;Compteur_par_chargement.c,10 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Compteur_par_chargement.c,7 :: 		for(j=0;j<=9;j++) {
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Compteur_par_chargement.c,11 :: 		}
	GOTO       L_main3
L_main4:
;Compteur_par_chargement.c,6 :: 		for(i=0;i<=9;i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Compteur_par_chargement.c,12 :: 		}
	GOTO       L_main0
L_main1:
;Compteur_par_chargement.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main


_main:

;Affichage_par_Décalage.c,3 :: 		void main() {
;Affichage_par_Décalage.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;Affichage_par_Décalage.c,5 :: 		for(i=0;i<23;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      23
	SUBWF      _i+0, 0
L__main6:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;Affichage_par_Décalage.c,6 :: 		if(Tab[i]==1){
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
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      1
	XORWF      R1+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Affichage_par_Décalage.c,7 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;Affichage_par_Décalage.c,8 :: 		}
	GOTO       L_main4
L_main3:
;Affichage_par_Décalage.c,10 :: 		PORTB.F1=0;
	BCF        PORTB+0, 1
;Affichage_par_Décalage.c,11 :: 		}
L_main4:
;Affichage_par_Décalage.c,12 :: 		PORTB.F0=0;PORTB.F0=1;
	BCF        PORTB+0, 0
	BSF        PORTB+0, 0
;Affichage_par_Décalage.c,13 :: 		PORTB.F2=0;PORTB.F2=1;
	BCF        PORTB+0, 2
	BSF        PORTB+0, 2
;Affichage_par_Décalage.c,5 :: 		for(i=0;i<23;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Affichage_par_Décalage.c,14 :: 		}
	GOTO       L_main0
L_main1:
;Affichage_par_Décalage.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

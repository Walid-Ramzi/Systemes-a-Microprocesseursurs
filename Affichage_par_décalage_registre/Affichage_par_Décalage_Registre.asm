
_main:

;Affichage_par_Décalage_Registre.c,3 :: 		void main() {
;Affichage_par_Décalage_Registre.c,4 :: 		TRISB = 0;
	CLRF       TRISB+0
;Affichage_par_Décalage_Registre.c,5 :: 		PORTB = 0;
	CLRF       PORTB+0
;Affichage_par_Décalage_Registre.c,6 :: 		for(i=0;i<4;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      4
	SUBWF      _i+0, 0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;Affichage_par_Décalage_Registre.c,7 :: 		for(j=7;j>=0;j--){
	MOVLW      7
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_main3:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	SUBWF      _j+0, 0
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Affichage_par_Décalage_Registre.c,8 :: 		if(((tab[i])&(1<<j))!=0){
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _tab+0
	MOVWF      FSR
	MOVF       _j+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main11:
	BTFSC      STATUS+0, 2
	GOTO       L__main12
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main11
L__main12:
	MOVF       R0+0, 0
	ANDWF      INDF+0, 0
	MOVWF      R2+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	ANDWF      R0+1, 0
	MOVWF      R2+1
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      0
	XORWF      R2+0, 0
L__main13:
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;Affichage_par_Décalage_Registre.c,9 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;Affichage_par_Décalage_Registre.c,10 :: 		}
	GOTO       L_main7
L_main6:
;Affichage_par_Décalage_Registre.c,12 :: 		PORTB.F1=0;
	BCF        PORTB+0, 1
;Affichage_par_Décalage_Registre.c,13 :: 		}
L_main7:
;Affichage_par_Décalage_Registre.c,14 :: 		PORTB.F0=0;PORTB.F0=1;
	BCF        PORTB+0, 0
	BSF        PORTB+0, 0
;Affichage_par_Décalage_Registre.c,15 :: 		PORTB.F2=0;PORTB.F2=1;
	BCF        PORTB+0, 2
	BSF        PORTB+0, 2
;Affichage_par_Décalage_Registre.c,7 :: 		for(j=7;j>=0;j--){
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;Affichage_par_Décalage_Registre.c,16 :: 		}
	GOTO       L_main3
L_main4:
;Affichage_par_Décalage_Registre.c,6 :: 		for(i=0;i<4;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Affichage_par_Décalage_Registre.c,17 :: 		}
	GOTO       L_main0
L_main1:
;Affichage_par_Décalage_Registre.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

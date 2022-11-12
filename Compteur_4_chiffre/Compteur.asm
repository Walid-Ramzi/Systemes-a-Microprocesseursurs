
_init:

;Compteur.c,7 :: 		void init() {
;Compteur.c,8 :: 		TRISC=0;
	CLRF       TRISC+0
;Compteur.c,9 :: 		TRISD=0;
	CLRF       TRISD+0
;Compteur.c,10 :: 		}
L_end_init:
	RETURN
; end of _init

_decomp:

;Compteur.c,11 :: 		void decomp(){
;Compteur.c,12 :: 		mil=x/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _mil+0
	MOVF       R0+1, 0
	MOVWF      _mil+1
;Compteur.c,13 :: 		cent=(x-mil*1000)/100;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      _x+0, 0
	MOVWF      FLOC__decomp+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _x+1, 0
	MOVWF      FLOC__decomp+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__decomp+0, 0
	MOVWF      R0+0
	MOVF       FLOC__decomp+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _cent+0
	MOVF       R0+1, 0
	MOVWF      _cent+1
;Compteur.c,14 :: 		diz=(x-mil*1000-cent*100)/10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      FLOC__decomp+0, 1
	BTFSS      STATUS+0, 0
	DECF       FLOC__decomp+1, 1
	MOVF       R0+1, 0
	SUBWF      FLOC__decomp+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__decomp+0, 0
	MOVWF      R0+0
	MOVF       FLOC__decomp+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _diz+0
	MOVF       R0+1, 0
	MOVWF      _diz+1
;Compteur.c,15 :: 		uni= x-mil*1000-cent*100-diz*10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      FLOC__decomp+0, 0
	MOVWF      _uni+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__decomp+1, 0
	MOVWF      _uni+1
;Compteur.c,16 :: 		}
L_end_decomp:
	RETURN
; end of _decomp

_affich:

;Compteur.c,17 :: 		void affich(){
;Compteur.c,18 :: 		PORTC= mil|cent<<4;
	MOVLW      4
	MOVWF      R1+0
	MOVF       _cent+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__affich7:
	BTFSC      STATUS+0, 2
	GOTO       L__affich8
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__affich7
L__affich8:
	MOVF       R0+0, 0
	IORWF      _mil+0, 0
	MOVWF      PORTC+0
;Compteur.c,19 :: 		PORTD= diz|uni<<4;
	MOVLW      4
	MOVWF      R1+0
	MOVF       _uni+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__affich9:
	BTFSC      STATUS+0, 2
	GOTO       L__affich10
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__affich9
L__affich10:
	MOVF       R0+0, 0
	IORWF      _diz+0, 0
	MOVWF      PORTD+0
;Compteur.c,20 :: 		}
L_end_affich:
	RETURN
; end of _affich

_main:

;Compteur.c,22 :: 		void main() {
;Compteur.c,23 :: 		for(x=0;x<=9999;x++){
	CLRF       _x+0
	CLRF       _x+1
L_main0:
	MOVLW      128
	XORLW      39
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _x+0, 0
	SUBLW      15
L__main12:
	BTFSS      STATUS+0, 0
	GOTO       L_main1
;Compteur.c,24 :: 		init();
	CALL       _init+0
;Compteur.c,25 :: 		decomp();
	CALL       _decomp+0
;Compteur.c,26 :: 		affich();
	CALL       _affich+0
;Compteur.c,27 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Compteur.c,23 :: 		for(x=0;x<=9999;x++){
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;Compteur.c,28 :: 		}
	GOTO       L_main0
L_main1:
;Compteur.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

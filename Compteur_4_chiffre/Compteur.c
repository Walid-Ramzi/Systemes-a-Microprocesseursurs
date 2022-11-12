/*Prototype (Déclaration)*/
void init();
void decomp();
void affich();
int mil,cent,diz,uni,x;
/*création (Définition)*/
  void init() {
   TRISC=0;
   TRISD=0;
  }
  void decomp(){
   mil=x/1000;
   cent=(x-mil*1000)/100;
   diz=(x-mil*1000-cent*100)/10;
   uni= x-mil*1000-cent*100-diz*10;
  }
  void affich(){
    PORTC= mil|cent<<4;
    PORTD= diz|uni<<4;
  }
 /*l'utilisation (l'appel)*/
void main() {
   for(x=0;x<=9999;x++){
      init();
      decomp();
      affich();
      delay_ms(500);
   }
}

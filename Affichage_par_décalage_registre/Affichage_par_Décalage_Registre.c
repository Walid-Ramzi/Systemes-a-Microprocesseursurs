int tab[] = {0x66,0x4F,0x5B,0x06};
int i,j;
void main() {
 TRISB = 0;
 PORTB = 0;
 for(i=0;i<4;i++){
  for(j=7;j>=0;j--){
   if(((tab[i])&(1<<j))!=0){
    PORTB.F1=1;
    }
   else{
   PORTB.F1=0;
   }
  PORTB.F0=0;PORTB.F0=1;
  PORTB.F2=0;PORTB.F2=1;
  }
 }
}

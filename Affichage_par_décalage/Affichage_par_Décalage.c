int Tab [] = {1,0,0,1,1,1,1,0   ,1,0,1,1,0,1,1,0   ,0,0,0,0,1,1,0,0};
int i;
void main() {
     TRISB=0;
     for(i=0;i<23;i++){
        if(Tab[i]==1){
          PORTB.F1=1;
         }
         else {
           PORTB.F1=0;
         }
          PORTB.F0=0;PORTB.F0=1;
          PORTB.F2=0;PORTB.F2=1;
     }
}

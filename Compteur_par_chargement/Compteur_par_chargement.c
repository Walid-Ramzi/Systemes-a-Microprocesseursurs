int Tab [] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int i,j;
void main() {
  TRISA=0;
  TRISB=0;
  for(i=0;i<=9;i++) {
      for(j=0;j<=9;j++) {
          PORTB= Tab[i]; PORTA.f0=0; PORTA.f0=1;
          PORTB= Tab[j]; PORTA.f1=0; PORTA.f1=1;
          delay_ms(500);
      }
    }
}

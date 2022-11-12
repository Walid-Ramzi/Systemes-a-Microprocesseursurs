int TAB [] ={0xF9,0xA4,0xB0,0x99};
void main() {
    TRISA=0;
    TRISB=0;
    PORTB=TAB [0]; PORTA.f0=0; PORTA.f0=1;
    PORTB=TAB [1]; PORTA.f1=0; PORTA.f1=1;
    PORTB=TAB [2]; PORTA.f2=0; PORTA.f2=1;
    PORTB=TAB [3]; PORTA.f3=0; PORTA.f3=1;
}

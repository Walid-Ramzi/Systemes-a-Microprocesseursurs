void main() {

TRISB = 0;
TRISC = 0;
TRISD = 0;

PORTB = 3<<1;
PORTC = 4 | 5<<4;
PORTD = 0b00011000;

}

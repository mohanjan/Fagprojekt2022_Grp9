long int inRead = 0;
long int shiftReg=0;
long int z = 0; //current sample

// increased sample rate thingies
const uint32_t INTERVAL_MICROSECONDS = 20; // 25 kHz
const uint32_t CLOCKS_PER_MICROSECOND = F_CPU / 1000000ul;
const uint16_t TIMER1_TOP = (INTERVAL_MICROSECONDS * CLOCKS_PER_MICROSECOND) - 1;

const byte MAX_SAMPLE_COUNT = 3;
volatile byte SampleCounter = 0;
volatile uint16_t SampleBuffer[MAX_SAMPLE_COUNT];

//ADDAC settings
const int base = 10;
const int NS = 128;
const int DA_AND = 0b1<< (base-1); //0x200; //15 = 0x2000
const int ddcval = (0b1<<base) -1; //0x3ff; //15 = 0x7fff, 10=3ff
long int zneg = 0; //previous sample
long int ddc = 0; //digital to digital converter
void AD(); //Analog to digital function
void DA(); //digital to analog function
int count;

//port settings
int AD_I = 3;
int AD_IA = A0;
int AD_O = 4;
int DA_O = 7;

//Algorithms
long int func(long int sample);
long int buff[NS] = {0};
int b=0;


void setup() {     
  pinMode(DA_O, OUTPUT); 
  pinMode(AD_O, OUTPUT);
  pinMode(AD_I, INPUT);  
  pinMode(AD_IA, INPUT);  

// Set up the ADC to start a conversion when Timer1 overflows
  ADMUX = 0;
  ADCSRA = 0;
  ADCSRB = 0;
  DIDR0 = 0;

  // Select the AVCC reference and input pin A0
  ADMUX |= _BV(REFS0);
    // Set ADC clock prescale.
  // For full resolution (10 bits) the ADC clock must be 
  // lower than 200 kHz.  At the expense of a few 
  // LSBs we can crank the ADC clock up to 1 MHz
  // and get 74000 samples per second.

#if (F_CPU > 8000000ul)
  // On a 16 MHz Arduino use a prescale of 16
  // The next higher available prescale is 128.
  ADCSRA |= _BV(ADPS2) | _BV(ADPS0); // Prescale = 16 = 1 MHz
#else
  // On an 8 MHz Arduino use a prescale of 8.
  // The next higher available prescale is 64.
  ADCSRA |= _BV(ADPS=1) | _BV(ADPS0); // Prescale = 8 = 1 MHz
#endif

  // Select auto-trigger source: Begin Conversion on Timer1 Overflow
  ADCSRB |= _BV(ADTS2) | _BV(ADTS1);

  // ADC Enable, Auto-trigger enable, Clear interrupt flag, Enable interrupt
  ADCSRA |= _BV(ADEN) | _BV(ADATE) | _BV(ADIF) | _BV(ADIE);

  // Start Timer1 overflowing every INTERVAL_MICROSECONDS
  TCCR1A = 0;
  TCCR1B = 0;
  TIMSK1 = 0; // Disable all Timer1 interrupts

  ICR1 = TIMER1_TOP; // Set INTERVAL_MICROSECONDS

  // Set WGM 14 (0b1110): Fast PWM, TOP in ICR1, TOV1 at TOP
  TCCR1A |= _BV(WGM11);
  TCCR1B |= _BV(WGM13) | _BV(WGM12);

  TIFR1 |= _BV(TOV1);  // Clear any pending Timer1 Overflow

  // Start Timer1 with Prescale=1
  TCCR1B |= _BV(CS10);
  
}

// ADC Conversion Complete interrupt service routine
ISR(ADC_vect)
{
  TIFR1 |= _BV(TOV1);  // Clear the pending Timer1 Overflow Interrupt

  uint16_t val = ADC;

  if (SampleCounter < MAX_SAMPLE_COUNT)
  {
    SampleBuffer[SampleCounter++] = val;
  }
}



void loop() {
  if (SampleCounter == MAX_SAMPLE_COUNT)
  {
    // All samples have been collected.  The ISR won't be doing anything
    // until the SampleCount is reset.

    Serial.print(micros());
    Serial.print(", ");
    Serial.print(SampleBuffer[0]);
    Serial.print(", ");
    Serial.print(SampleBuffer[1]);
    Serial.print(", ");
    Serial.println(SampleBuffer[2]);
    Serial.flush(); // Make sure all the character get sent

    SampleCounter = 0;
  }
  //delayMicroseconds(10);
 //AD conversion
  AD();
 // buff[i]=shiftReg;
  
  /*if(i==NS-1){
    i=0;
  }*/
 //DSP world
 /*switch (b){
  
  default:

    break;
 }*/

 //DA conversion
 //DA(buff[i]);
  DA(shiftReg);
 //i++;
}


long int func(long int sample){
  
  
  

  return sample;
}

void AD(){
   inRead = (digitalRead(AD_I));
  shiftReg = shiftReg>> 1;
  switch(inRead){
    case  !0:
      digitalWrite(AD_O, HIGH);
      shiftReg |= (inRead << base) ;
      break;
    default:
     digitalWrite(AD_O, LOW);
     break;
 }
}


void DA(long int input){
  //z-=ddc;
  z = input-ddc; //delta
  zneg += z;         //z-1 sample value

  switch (zneg & DA_AND){
    case DA_AND:
      digitalWrite(DA_O, HIGH);
      ddc = ddcval;
      break;
    default:
      digitalWrite(DA_O, LOW);
      ddc = 0x000;
      break;
  }
  
}

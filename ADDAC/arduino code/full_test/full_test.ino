long int inRead = 0;
long int shiftReg=0;
int i=0;
long int z = 0; //current sample
long int zneg = 0; //previous sample
long int ddc = 0; //digital to digital converter

void setup() {     
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT);
  pinMode(4, INPUT);  
}


void loop() {

 //AD conversion
 inRead = digitalRead(4);
 shiftReg = shiftReg >> 1;
 shiftReg |= (inRead << 8) ;
  switch(inRead){
  case 1:
    digitalWrite(3, HIGH);
    break;
  default:
    digitalWrite(3, LOW);
    break;
 }

 //DA conversion
 z = shiftReg-ddc; //delta
  
 zneg += z;          //z-1 sample value
 //zneg &= 0xffff;
 
  switch (zneg & 0x2000){
    case 0x2000:
      digitalWrite(2, HIGH);
      digitalWrite(LED_BUILTIN, HIGH);
      ddc=0xffff;
      break;
      
    default:
      digitalWrite(2, LOW);
      digitalWrite(LED_BUILTIN, LOW);
      ddc=0x0000;
      break;
  }



  
}

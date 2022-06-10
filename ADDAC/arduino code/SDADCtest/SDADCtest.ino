unsigned int inRead = 0;
unsigned int shiftReg=0;
int i=0;

/*
 * 1. read input, this is now MSB
 * 2. 
 * 
 * 
 * 
 */


void setup() {
  Serial.begin(9600);        
  pinMode(2, OUTPUT);  //sets D2 to output mode  
  pinMode(4, INPUT);  
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  
 inRead = (digitalRead(4));


  switch(inRead){
    case  0:
      
      digitalWrite(2, HIGH);
      digitalWrite(LED_BUILTIN, HIGH);
      shiftReg = shiftReg >> 1;
      shiftReg |= (inRead << 7) ;
      Serial.println(inRead);
      break;
    default:
  
     digitalWrite(2, LOW);
     digitalWrite(LED_BUILTIN, LOW);
     shiftReg = shiftReg>> 1;
     Serial.println(inRead);
     break;
 }
}

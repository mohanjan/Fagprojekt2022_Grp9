long int inRead = 0;
long int shiftReg=0;
long int z = 0; //current sample

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
int i = 0;
int j = 0;

//port settings
int AD_I = 3;
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
}

void loop() {
  //delayMicroseconds(10);
 //AD conversion
  AD();
  /*switch (j){
    case base:
      buff[i]=shiftReg;
      j=0;
      i++;
    default:
    j++;
    break;
  }

  
  if(i==NS-1){
    i=0;
  }*/
 //DSP world
 /*switch (b){
  
  default:

    break;
 }*/

 //DA conversion
 //DA(buff[i-1]);
 DA(shiftReg);

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

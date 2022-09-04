// //    -----DAC specific variables-----
// const int base = 10;
// const int NS = 128;
// const int DA_AND = 0b1 << (base - 1); //0x200; //15 = 0x2000
// const int ddcval = (0b1 << base) -1; //0x3ff; //15 = 0x7fff, 10=3ff
// long int z = 0;
// long int zneg = 0; //previous sample
// long int ddc = 0; //digital to digital converter
int DA_O = 7; //Sigma delta write pin
//    -----midi specific variables-----
long int inRead = 0;
long int shiftReg=0;
int MIDIIn = 0; //midi read pin
int active = 1; //used in switch statement in loop
int msgSize = 0;
int byt = 0;


class MIDI{
  public:
    int channel;
    int note;
    int vel;
    int noteOn;
    int pitchBend;
    byte statusByte;
    byte data1Byte; 
    byte data2Byte;

    int toHz(){
      int rval =0;
      int mult = 0;
      if (note<24){
        mult =1;        
      }else if(note <36 && note >=24){
        mult =2;
      }else if(note <48 && note >=36){
        mult =4;
      }else if(note <60 && note >=48){
        mult =8;
      }else if(note <72 && note >=60){
        mult =16;
      }else if(note <84 && note >=72){
        mult =32;
      }else if(note <96 && note >=84){
        mult =64;
      }else if(note <108 && note >=96){
        mult =128;
      }

      mult = pBend(mult);

      switch(note % 12){
        case 0: //C
         rval = (16.352*mult);
         return rval;
         break;

        case 1://C#
          rval = 17.324*mult;
          return rval;
          break;

        case 2://D
          rval = 18.354*mult;
          return rval;
          break;

        case 3://D#
          rval = 19.445*mult;
          return rval;
          break;

        case 4://E
          rval = 20.602*mult;
          return rval;
          break;

        case 5://F
          rval = 21.827*mult;
          return rval;
          break;

        case 6://F#
          rval = 23.125*mult;
          return rval;
          break;

        case 7://G
          rval = 24.5*mult;
          return rval;
          break;

        case 8://G#
          rval = 25.957*mult;
          return rval;      
          break;

        case 9://A
          rval = 27.5*mult;
          return rval;      
          break;

        case 10://A#
          rval = 29.135*mult;
          return rval;          
          break;
        
        case 11://B
          rval =  30.868 * mult;
          return rval;
          break;

        default:
          return 0;
          break;

        return rval;
      }
    }

    int pBend(int in){
      if (pitchBend>8192)
      {
        return in + (pitchBend>>11);
      }
      else if(pitchBend<8192){
        return in - (pitchBend>>4);
      }
      else{
        return in;
      }
      
    } 
};



//Midi related functions
void MIDIread(MIDI * midi_p);
void checkMIDI(MIDI * midi_p);
MIDI MIDIC1;

//void DA(); //digital to analog function



void setup() {
  pinMode(DA_O, OUTPUT);
  //pinMode(MIDIIn, INPUT);
  Serial.begin(31250);
  pinMode(3, OUTPUT);
}



void loop() {
  delayMicroseconds(10000);
  checkMIDI(&MIDIC1);
  MIDIread(&MIDIC1);


  //pitch bend code here

  switch (MIDIC1.noteOn)
  {
  case !0:
    tone(DA_O, MIDIC1.toHz());
    
    break;
    
  case 0:
    noTone(DA_O);
      
    break;
      
  default:
    break;
  }


}





void checkMIDI(MIDI * midi_p){
  do{
    if (Serial.available()){
      midi_p->statusByte = Serial.read();//read first byte
      midi_p->data1Byte = Serial.read();//read next byte
      midi_p->data2Byte = Serial.read();//read final byte
    }
  }
  while (Serial.available() > 2);//when at least three bytes available
}

void MIDIread(MIDI * midi_p){
    switch ((midi_p->statusByte & 0b11110000) >> 4)
    //improve channel things
      {
      case 0x8: //note off (last 4 bits supposed to be channel)
        midi_p->noteOn = 0;
        midi_p->note = midi_p->data1Byte;
        midi_p->vel = midi_p->data2Byte;
        break;

      case 0x9: //note on
        midi_p->noteOn = 1;
        midi_p->note = midi_p->data1Byte;
        midi_p->vel = midi_p->data2Byte;    
        break;
      
      case 0xA: //Key pressure
        break;
      
      case 0xB: //controller change
        break;

      case 0xC: //program change
        break;

      case 0xD: // channel aftertouch
        break;

      case 0xE: //Pitch bend change
        
        midi_p->pitchBend = midi_p->data2Byte << 7;
        midi_p->pitchBend |= midi_p->data1Byte;  

        break;

      default:
        break;
      }
}



// void DA(long int input){
//   //z-=ddc;
//   z = input-ddc; //delta
//   zneg += z;         //z-1 sample value

//   switch (zneg & DA_AND){
//     case DA_AND:
//       digitalWrite(DA_O, HIGH);
//       ddc = ddcval;
//       break;
//     default:
//       digitalWrite(DA_O, LOW);
//       ddc = 0x000;
//       break;
//   }
  
// }

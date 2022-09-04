
byte commandByte;
byte noteByte;
byte velocityByte;

byte noteOn = 144;
byte noteOff = 128;
byte toHz(byte note);
//light up led at pin 13 when receiving noteON message with note = 60

void setup(){
  Serial.begin(31250);
  pinMode(7,OUTPUT);
  
}


void checkMIDI(){
  do{
    if (Serial.available()){
      commandByte = Serial.read();//read first byte
      noteByte = Serial.read();//read next byte
      velocityByte = Serial.read();//read final byte
      if (commandByte == noteOn){//if note on message
        //check if note == 60 and velocity > 0
        
        tone(7, toHz(noteByte));
      }
      else if(commandByte==noteOff){
        noTone(7);
      }
    }
  }
  while (Serial.available() > 2);//when at least three bytes available
}
    

void loop(){
  checkMIDI();  

}


byte toHz(byte note){
      switch(note % 12){
        case 0: //C
         return (int)(16.352*((note/12)-1));
         break;

        case 1://C#
          return (int)(17.324*((note/12)-1));
          break;

        case 2://D
          return (int)(18.354*((note/12)-1));
          break;

        case 3://D#
          return (int)(19.445*((note/12)-1));
          break;

        case 4://E
          return (int)(20.602*((note/12)-1));
          break;

        case 5://F
          return (int)(21.827*((note/12)-1));
          break;

        case 6://F#
          return (int)(23.125*((note/12)-1));
          break;

        case 7://G
          return (int)(24.5*((note/12)-1));
          break;

        case 8://G#
          return (int)(25.957*((note/12)-1));
          break;

        case 9://A
          return (int)(27.5*((note/12)-1));
          break;

        case 10://A#
          return (int)(29.135*((note/12)-1));
          break;
        
        case 11://B
          return (int)(30.868*((note/12)-1));

          break;

        default:
          return 0;
          break;
      }
    }

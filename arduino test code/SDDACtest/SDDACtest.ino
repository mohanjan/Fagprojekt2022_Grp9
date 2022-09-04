const int P_O =7;

void setup() {
  //pinMode(LED_BUILTIN, OUTPUT); 
  pinMode(P_O, OUTPUT);  //sets D2 to output mode
  pinMode(A0, INPUT);
}

const int NS = 64;
//int t=0;
int p =0;
int z = 0; //current sample
  int zneg = 0; //previous sample
  int ddc = 0; //digital to digital converter
    int i = 0;

  
  long int sin_LUT[NS] = {32768, 36030, 39260, 42426, 45496, 48439, 51226, 53830, 56225, 58386, 60293, 61926, 63270, 64310, 65037, 
65443, 65525, 65281, 64713, 63829, 62635, 61145, 59373, 57336, 55055, 52553, 49854, 46985, 43975, 40853, 
37651, 34401, 31134, 27884, 24682, 21560, 18550, 15681, 12982, 10480, 8199, 6162, 4390, 2900, 1706, 
822, 254, 10, 92, 498, 1225, 2265, 3609, 5242, 7149, 9310, 11705, 14309, 17096, 20039, 
23109, 26275, 29505, 32767};
long int saw_LUT[NS]={
  1024,2048,3072,4096,5120,6144,7168,8192,
9216,10240,11264,12288,13312,14336,15360,16384,
17407,18431,19455,20479,21503,22527,23551,24575,
25599,26623,27647,28671,29695,30719,31743,32767,
33791,34815,35839,36863,37887,38911,39935,40959,
41983,43007,44031,45055,46079,47103,48127,49151,
50174,51198,52222,53246,54270,55294,56318,57342,
58366,59390,60414,61438,62462,63486,64510,65534
};

void loop() {
  //p = analogRead(A0);
 
  z = saw_LUT[i]-ddc; //delta
  
  zneg += z;          //z-1 sample value
  //zneg &= 0xffff; 
   
  
  //pwm part
  
  if((zneg & 0x8000) == 0x8000){
    digitalWrite(P_O, HIGH);
    //digitalWrite(LED_BUILTIN, HIGH);
    ddc=0xffff;
  }else{
    digitalWrite(P_O, LOW);
    //digitalWrite(LED_BUILTIN, LOW);
    ddc=0x0000;
  }

  delayMicroseconds(0);
  
 switch (i){
  case NS-1:
    i=0;
    break;
  default:
  i++;
  break;
 }


}

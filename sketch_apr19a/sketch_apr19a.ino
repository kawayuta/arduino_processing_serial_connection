int swich = A0;

void setup() {
  Serial.begin(9600);
  pinMode(swich, INPUT_PULLUP);
}

void loop() {
 int swichState = digitalRead(swich);
 Serial.println(swichState);
 delay(1);
  
}

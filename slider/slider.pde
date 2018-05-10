import processing.net.*;
import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer audio;
public enum PLAY_STATUS {
  NOT_PLAYED,
  PLAYING
}

Serial myPort;
int val = 0;
Boolean Status = false;
boolean isPlay = false;

  int ressCount = 0;
  int waterCount = 0;
void setup(){
  myPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  
}


void draw() {
    
  if (Status && !isPlay) {
      minim = new Minim(this);
      float rand = random(1,19);
      audio = minim.loadFile(int(rand) +".mp3", 2048);
      audio.play();
      isPlay = true;
  }
  if (!Status && isPlay) {
      audio.pause();
      audio.close();
      isPlay =false;
  }
}
  


void serialEvent(Serial p) {
  int res = p.read();
  if (res == 48 || res == 49) {
    Status = (res == 48) ? true : false;
  println(res);
  }
  println(Status);
  
}
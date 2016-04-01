import oscP5.*;
import netP5.*;

OscP5 oscP5;

int c;

void setup() {
  size(500, 500);  
  oscP5 = new OscP5(this, 12000);
  c = 0;
}

void draw() {
  if (c==1) {
    background(0);
  }
  else if (c==2) {
    background(0, 255, 0);
  }
}

void keyPressed() {
}

void oscEvent(OscMessage theOscMessage) {
  
  if (theOscMessage.addrPattern().equals("/wek/outputs")) {
    c = (int) theOscMessage.get(0).floatValue();
  }
}

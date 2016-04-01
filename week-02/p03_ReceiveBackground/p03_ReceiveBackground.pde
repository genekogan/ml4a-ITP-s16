import oscP5.*;
import netP5.*;

OscP5 oscP5;

float r, g, b;

void setup() {
  size(500, 500);  
  oscP5 = new OscP5(this, 12000);
}

void draw() {
}

void keyPressed() {
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.addrPattern().equals("/wek/outputs")) {
    float f1 = theOscMessage.get(0).floatValue();
    float f2 = theOscMessage.get(1).floatValue();
    float f3 = theOscMessage.get(2).floatValue();
    r = lerp(r, 255 * f1, 0.1);
    g = lerp(g, 255 * f2, 0.1);
    b = lerp(b, 255 * f3, 0.1);
    background(r, g, b);
  }
}

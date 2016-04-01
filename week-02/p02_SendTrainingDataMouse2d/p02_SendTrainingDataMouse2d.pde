import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

boolean isSending = false;

void setup() {
  size(500, 500);
  
  oscP5 = new OscP5(this, 1234);
  
  // sending to wekinator on same computer
  // ip address is "localhost" or 127.0.0.1
  // wekinator's default port is 6448
  myRemoteLocation = new NetAddress("127.0.0.1",6448);
}

void draw() {
  background(255, 0, 0);
  if (isSending) {
    background(0, 255, 0);
    OscMessage msg = new OscMessage("/wek/inputs");
    msg.add((float) mouseX);
    msg.add((float) mouseY);
    oscP5.send(msg, myRemoteLocation);
  }
}

void keyPressed() {
  if (key==' ') {
    isSending = !isSending;
  }
}

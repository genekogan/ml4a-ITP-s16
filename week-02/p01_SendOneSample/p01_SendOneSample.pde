import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(500, 500);
  
  oscP5 = new OscP5(this, 1234);
  
  // sending to wekinator on same computer
  // ip address is "localhost" or 127.0.0.1
  // wekinator's default port is 6448
  myRemoteLocation = new NetAddress("127.0.0.1",6448);
}

void draw() {
}

void keyPressed() {
  if (key==' ') {
    OscMessage msg = new OscMessage("/wek/inputs");
    msg.add(0.5);
    msg.add(-2.5);
    oscP5.send(msg, myRemoteLocation);
  }
}

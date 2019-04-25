/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress destination;

void setup() {
  size(1024, 728);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12001);
  
  /* destination is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  destination = new NetAddress("127.0.0.1",12000);
}


void draw() {
  background(0);  

  /* in the following different ways of creating osc messages are shown by example */
  OscMessage m = new OscMessage("/centers");
  
  // Send the mouse position as a comma-delimited string
  m.add(mouseX + "," + mouseY); /* add a string to the osc message */
  
  /* send the message */
  oscP5.send(m, destination); 
  m.print();
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage m) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  if(m.addrPattern().equals("/test")) {
    m.print();
    println(m.get(0).intValue());
    println(m.get(1).intValue());
  }
}

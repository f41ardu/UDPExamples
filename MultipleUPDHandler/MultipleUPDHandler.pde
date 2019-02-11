// f41ardu
// 
// A Thread using receiving UDP to receive images

import hypermedia.net.*;

String ip       = "localhost";  // the fixed remote IP address
int sendtoport        = 9000;    // the destination port

UDP myUDP, secondUDP;

String received = ""; 
String received2 = ""; 
String newreceived = ""; 
String new2received = ""; 
String returned = ""; 
String returned2 = ""; 

PFont font; 
int i = 0; 
int j = 0; 

void setup() {
  size(400, 300);  
  font = createFont("Arial", 40);
  textFont(font, 20);
  textAlign(LEFT, CENTER);
  myUDP = new myUDP(this, "localhost", 8889 );
  myUDP.setReceiveHandler("myreceiver");
  secondUDP = new myUDP(this, "localhost", 8890 );
  secondUDP.setReceiveHandler("secondreceiver");
}

void draw() {
  

  if (received != "") {
    i++; 
    returned = i + " OK -> " + received;
    newreceived = received; 
    myUDP.send(returned.getBytes(), ip, sendtoport );
    
  }
  if (received2 != "") {
    j++; 
    returned2 = i + " OK -> " + received2;
    new2received = received2; 
//    myUDP.send(returned.getBytes(), ip, sendtoport );
    
  }

  // Draw the image
  background(0);
  text("Receiver Handle 1:"  + newreceived, 30, 50, width, height);
  text("Receiver Handle 2 :" + new2received, 30, 80, width, height);
  received = ""; 
  received2 = ""; 
}

// our individual receivers 
// for demonstration purpose we make use of individual handlers

 void myreceiver( byte[] data, String ip, int port) { // <– not default handler
    {
     
      //void MYreceive( byte[] data, String ip, int port ) {   // not <-- extended handler
      received= new String(data);
      println("handle 1: "+ received +" "+ ip + " " + " " + port);
    }
  }
  
  void secondreceiver( byte[] data, String ip, int port) { // <– default handler
    {
     
      //void MYreceive( byte[] data, String ip, int port ) {   // <-- extended handler
      received2= new String(data);
      println("handle 2: "+ received2 +" "+ ip + " " + " " + port);
    }
  }

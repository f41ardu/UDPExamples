/*
Copyright (c) 2019 f41ardu(at)arcor.de
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
//
// Simple UDP Receiver Test for Processing  
// 
// 
// 11/02/2019 version 0.1 (experimental)
 // 

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
  myUDP = new UDP(this, 8889 );
  myUDP.setReceiveHandler("myreceiver");
  myUDP.listen( true); 
  secondUDP = new UDP(this, 8890 );
  secondUDP.setReceiveHandler("secondreceiver");
  secondUDP.listen( true); 
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
  // show info
  text("UDP Processing Demo", 30, -100, width, height);
  text("Receiver Handle 1:"  + newreceived, 30, 50, width, height);
  text("Receiver Handle 2 :" + new2received, 30, 80, width, height);
  received = ""; 
  received2 = ""; 
}

// two individual receivers
// for demonstration purpose we make use of individual handlers

 void myreceiver( byte[] data, String ip, int port) { // <– not default handler
    {
     
      //void MYreceive( byte[] data, String ip, int port ) {   // not <-- extended handler
      received= new String(data);
//      println("handle 1: "+ received +" "+ ip + " " + " " + port);
    }
  }
  
  void secondreceiver( byte[] data, String ip, int port) { // <– default handler
    {
     
      //void MYreceive( byte[] data, String ip, int port ) {   // <-- extended handler
      received2= new String(data);
  //    println("handle 2: "+ received2 +" "+ ip + " " + " " + port);
    }
  }

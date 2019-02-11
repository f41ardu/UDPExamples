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
// Simple UDP Test for Processing  
// 
// 
// 11/02/2019 version 0.1
// 

import hypermedia.net.*;

UDP udp;  // define UDP object one
UDP udp2; // define UDP object two

// Tello UDP communication  
String ip       = "localhost";  // the fixed remote IP address
int destport    = 8889;    // the destination port
int destport2   = 8890;    // an other destination port 

int retry = 10; 

// Keyboard handling
String textBuffer = "command";
String input = textBuffer;
String output = ""; 
String received = ""; 
Boolean receivedData = false;

PFont font;

void setup() {
  size(640, 480);
  font = createFont("Sans Serif", 40);
  textFont(font, 20);
  textAlign(LEFT, CENTER);

  // UDP setup using default handler receive
  udp = new UDP(this, 9000 );  // create a new datagram connection lsiten on port 9000
  // No ipmlementation for a second receive handler 
  udp2 = new UDP(this ,9100 );  // create a new datagram connection listen on port 9100
  // UDP Buffer for first udp object only 
  udp.setBuffer( 1518 );
  // udp.log( true );     // <-- printout the connection activity
  udp.listen( true );           // listen on udp object one and wait for incoming message

}
int i = 0; 
// Processing main loop
void draw() {
 
  background(0);
  // show help 
  text("UDP Processing Demo", 30, -140, width, height);
  text("Press <ENTER> to start", 30, -110, width, height);
  text("Send some commands ", 30, -70, width, height);
  // show input 
  text("Commands send:" + textBuffer, 30, 0, width, height);
  // show buffer send 
  text("Send:" + output, 30, 40, width, height);
  // show what receiver tell us 
  text("Received:" + received, 30, 80, width, height);
  // send somthing to the second receiver 
  String tt = " " + i++; 
  udp2.send(tt.getBytes(), ip, 8890 );   // the message to send

  // talk to first receiver
  // send command as long as no response is received and input is not empty  
  if ( receivedData != true && input != "" ) { 
    sendData();   
  } else {
    // reset to input and receivedData to accept new command
    input =""; 
    receivedData = false;
  } 
}

void sendData() {
  if (input != "") { 
    // udp send require byteArray
    byte[] byteBuffer = input.getBytes();
    udp.send(byteBuffer, ip, destport );   // the message to send
  }
}

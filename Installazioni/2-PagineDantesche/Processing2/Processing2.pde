// -
// Installazione "Pagine dantesche" della nuova area per il Museo Dantesco dal nome Sui passi di Dante  by peterbaru [Museo Dantesco, Dante Alighieri,  Patrimonio culturale, Ravenna, Interaction Design]
// 2021 © Pietro Baruzzi, Università degli Studi della Repubblica di San Marino
// Educational purposes, MIT License, 2021, San Marino

import processing.serial.*;
import processing.video.*;
import codeanticode.syphon.*;

Movie Video0; //luce accesa
Movie Video2; //commedia apertura
Movie Video3; //commedia frecce
Movie Video4; //vitanova apertura
Movie Video5; //vitanova frecce
Movie Video6; //staifresco
Movie Video7; //introduzione vita nova
Movie Video9; //D'Avenia

SyphonServer serverVideo0;
SyphonServer serverVideo2;
SyphonServer serverVideo3;
SyphonServer serverVideo4;
SyphonServer serverVideo5;
SyphonServer serverVideo6;
SyphonServer serverVideo7;
SyphonServer serverVideo9;

String val;

Serial myPort;

int seleziona_video =0;

void setup() {
  //fullScreen();
  size (888, 629, P3D);
  background(0, 0, 0);

  Video0 = new Movie(this, "Video0.mp4");
  Video0.play();

  Video2 = new Movie(this, "Video2.mp4");
  Video3 = new Movie(this, "Video3.mp4");
  Video5 = new Movie(this, "Video5.mp4");
  Video6 = new Movie(this, "Video6.mp4");


  Video4 = new Movie(this, "Video4.mp4");
  Video7 = new Movie(this, "Video7.mp4");
  Video9 = new Movie(this, "Video9.mp4");

  printArray(Serial.list());

  myPort = new Serial (this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');
  
  serverVideo0 = new SyphonServer(this, "Processing Syphon");
  serverVideo2 = new SyphonServer(this, "Processing Syphon");
  serverVideo3 = new SyphonServer(this, "Processing Syphon");
  serverVideo4 = new SyphonServer(this, "Processing Syphon");
  serverVideo5 = new SyphonServer(this, "Processing Syphon");
  serverVideo6 = new SyphonServer(this, "Processing Syphon");
  serverVideo7 = new SyphonServer(this, "Processing Syphon");
  serverVideo9 = new SyphonServer(this, "Processing Syphon");
}

void serialEvent(Serial p) { 
  val = p.readString(); 
  println(val);
  String[] comandi=val.split(";");


  if (comandi[0].equals("1")) {
    seleziona_video=1;

    Video0.loop();

    Video2.stop();
    Video6.stop();

    Video4.stop();
    Video7.stop();
    Video9.stop();

    Video0.volume(1);
  }

  if (comandi[0].equals("2")) {

    seleziona_video=2;

    Video0.stop();

    Video2.play();
    Video3.loop();
    Video6.stop();


    Video4.stop();
    Video7.stop();
    Video9.stop();

    Video2.volume(1);
  }

  if (comandi[0].equals("3")) {
    seleziona_video = 3;

     Video0.stop();

    Video2.stop();
    Video6.stop();


    Video4.play();
    Video5.loop();
    Video7.stop();
    Video9.stop();

    Video4.volume(1);
  }

  if (comandi[0].equals("7")) {
    seleziona_video = 4;

     Video0.stop();

    Video2.stop();
    Video6.play();


    Video4.stop();
    Video7.stop();
    Video9.stop();

   Video6.volume(1);
  }

  if (comandi[0].equals("11")) {
    seleziona_video = 5;
    
 Video0.stop();

    Video2.stop();
    Video6.stop();


    Video4.stop();
    Video7.play();
    Video9.stop();

   Video7.volume(1);
    
  }
  
   if (comandi[0].equals("12")) {
    seleziona_video = 6;
    
 Video0.stop();

    Video2.stop();
    Video6.stop();


    Video4.stop();
    Video7.stop();
    Video9.play();

   Video9.volume(1);
    
  }
}



void draw() {
  switch(seleziona_video) {

  case 1:
    image(Video0, 0, 0, width, height);
    break;
  case 2:
    image(Video2, 0, 0, width, height);
    
    if (Video2.time() >= 8) {
    image(Video3, 0, 0, width, height);
    }
    
    break;
  case 3:
    image(Video4, 0, 0, width, height);
    
    if (Video4.time() >= 5) {
    image(Video5, 0, 0, width, height);
    }
    
    break;
  case 4:
    image(Video6, 0, 0, width, height);
    break;
  case 5:
    image(Video7, 0, 0, width, height);
    break;
  case 6:
    image(Video9, 0, 0, width, height);
    break;
  }
  
    serverVideo0.sendImage(Video0); 
    serverVideo2.sendImage(Video2); 
    serverVideo3.sendImage(Video3); 
    serverVideo4.sendImage(Video4); 
    serverVideo5.sendImage(Video5); 
    serverVideo6.sendImage(Video6); 
    serverVideo7.sendImage(Video7); 
    serverVideo9.sendImage(Video9); 
}

void movieEvent(Movie m) {
  m.read();
}

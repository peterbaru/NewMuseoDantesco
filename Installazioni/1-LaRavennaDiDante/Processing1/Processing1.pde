// -
// Installazione "La Ravenna di Dante" della nuova area per il Museo Dantesco dal nome Sui passi di Dante  by peterbaru [Museo Dantesco, Dante Alighieri,  Patrimonio culturale, Ravenna, Interaction Design]
// 2021 © Pietro Baruzzi, Università degli Studi della Repubblica di San Marino
// Educational purposes, MIT License, 2021, San Marino

import processing.serial.*;
import processing.video.*;
import codeanticode.syphon.*;

PImage MappaTomba;
PImage MappaSanFrancesco;
PImage MappaBraccioforte;
PImage MappaMosaici;
PImage MappaPineta;
PImage MappaPolenta;
PImage MappaTraversari;
PImage MappaPortoFuori;
PImage MappaSantoStefano;

SyphonServer serverMappaTomba;
SyphonServer serverMappaSanFrancesco;
SyphonServer serverMappaBraccioforte;
SyphonServer serverMappaMosaici;
SyphonServer serverMappaPineta;
SyphonServer serverMappaPolenta;
SyphonServer serverMappaTraversari;
SyphonServer serverMappaPortoFuori;
SyphonServer serverMappaSantoStefano;

Movie Video1;
Movie Video2;
Movie Video3;
Movie Video4;
Movie Video5;
Movie Video6;

SyphonServer serverVideo1;
SyphonServer serverVideo2;
SyphonServer serverVideo3;
SyphonServer serverVideo4;
SyphonServer serverVideo5;
SyphonServer serverVideo6;

String val;

Serial myPort;

int seleziona_foto = 0;

int opzione = 1;

void setup() {
  
  fullScreen(P3D);
  background(0);

  MappaTomba = loadImage("MappaTomba.png");
  MappaSanFrancesco = loadImage("MappaSanFrancesco.png");
  MappaBraccioforte = loadImage("MappaBraccioforte.png");
  MappaMosaici = loadImage("MappaMosaici.png");
  MappaPineta = loadImage("MappaPineta.png");
  MappaPolenta = loadImage("MappaPolenta.png");
  MappaTraversari = loadImage("MappaTraversari.png");
  MappaPortoFuori = loadImage("MappaPortoFuori.png");
  MappaSantoStefano = loadImage("MappaSantoStefano.png");
  
serverMappaTomba = new SyphonServer(this, "Processing Syphon");
serverMappaSanFrancesco = new SyphonServer(this, "Processing Syphon");
serverMappaBraccioforte = new SyphonServer(this, "Processing Syphon");
serverMappaMosaici = new SyphonServer(this, "Processing Syphon");
serverMappaPineta = new SyphonServer(this, "Processing Syphon");
serverMappaPolenta = new SyphonServer(this, "Processing Syphon");
serverMappaTraversari = new SyphonServer(this, "Processing Syphon");
serverMappaPortoFuori = new SyphonServer(this, "Processing Syphon");
serverMappaSantoStefano = new SyphonServer(this, "Processing Syphon");

  Video1 = new Movie(this, "Video1.mp4");
  Video2 = new Movie(this, "Video2.mp4");
  Video3 = new Movie(this, "Video3.mp4");
  Video4 = new Movie(this, "Video4.mp4");
  Video5 = new Movie(this, "Video5.mp4");
  Video6 = new Movie(this, "Video6.mp4");
  
serverVideo1 = new SyphonServer(this, "Processing Syphon");
serverVideo2 = new SyphonServer(this, "Processing Syphon");
serverVideo3 = new SyphonServer(this, "Processing Syphon");
serverVideo4 = new SyphonServer(this, "Processing Syphon");
serverVideo5 = new SyphonServer(this, "Processing Syphon");
serverVideo6 = new SyphonServer(this, "Processing Syphon");
  
  printArray(Serial.list());

  myPort = new Serial (this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');
  
  image (MappaTomba, 0, 0, width, height-100);
  
}

void serialEvent(Serial p) { 
  val = p.readString(); 
  println(val);
  String[] comandi=val.split(";");


  if (comandi[0].equals("1")) { //tomba
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 1;
  }
  
  if (comandi[0].equals("2")) { //San Francesco
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 2;
  }
  
  if (comandi[0].equals("3")) { //braccioforte
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 3;
  }
  
  if (comandi[0].equals("4")) { //mosaici
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 4;
  }
  
   if (comandi[0].equals("5")) { //pineta
    Video3.play();
    Video6.play();
    Video1.stop();
    Video2.stop();
    Video4.stop();
    Video5.stop();
    seleziona_foto = 5;
  }
  
  if (comandi[0].equals("6")) { //polenta
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 6;
  }
  
  if (comandi[0].equals("7")) { //traversari
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 7;
  }
  
   if (comandi[0].equals("8")) { //Porto Fuori
    Video1.play();
    Video5.play();
    Video2.stop();
    Video3.stop();
    Video4.stop();
    Video6.stop();
    
    seleziona_foto = 8;
  }
    
  if (comandi[0].equals("9")) { //Santo Stefano
    Video2.play();
    Video4.play();
    Video1.stop();
    Video3.stop();
    Video5.stop();
    Video6.stop();
    seleziona_foto = 9;
  }
}

void draw() { 

  switch(seleziona_foto) {

  case 1: //tomba
  
    if (opzione == 1) { // da portofuori a ravenna
        image (MappaTomba, 0, 0, width, height-100);
        opzione = 1;
    } else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height-100);
      if (Video2.time() >= 3) {
        image (MappaTomba, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaTomba, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    break;

 case 2: //San Francesco

    if (opzione == 1) { // da portofuori a ravenna
        image (MappaSanFrancesco, 0, 0, width, height-100);
        opzione = 1;
      }  else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height);
      if (Video2.time() >= 3) {
        image (MappaSanFrancesco, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaSanFrancesco, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    break;
    
     case 3: //Braccioforte
if (opzione == 1) { // da portofuori a ravenna
        image (MappaBraccioforte, 0, 0, width, height-100);
        opzione = 1;
    } else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height-100);
      if (Video2.time() >= 3) {
        image (MappaBraccioforte, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaBraccioforte, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    
    break;
    
     case 4: //Mosaici
     if (opzione == 1) { // da portofuori a ravenna
        image (MappaMosaici, 0, 0, width, height-100);
        opzione = 1;
    } else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height-100);
      if (Video2.time() >= 3) {
        image (MappaMosaici, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaMosaici, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    break;
    
     case 5: //pineta
     
if (opzione == 5) { // da portofuori a ravenna
        image (MappaPineta, 0, 0, width, height-100);
        opzione = 5;
    } else if (opzione == 1) { // da ravenna a pineta
      image (Video3, 0, 0, width, height-100);
      if (Video3.time() >= 5) {
        image (MappaPineta, 0, 0, width, height-100);
        opzione = 5;
      }
    } else if (opzione == 8) { // da portofuori a pineta
    image (Video6, 0, 0, width, height-100);
      if (Video6.time() >= 4) {
        image (MappaPineta, 0, 0, width, height-100);
        opzione = 5;
    }
    }
    break;
    
     case 6: //Polenta

   if (opzione == 1) { // da portofuori a ravenna
        image (MappaPolenta, 0, 0, width, height-100);
        opzione = 1;
    } else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height-100);
      if (Video2.time() >= 3) {
        image (MappaPolenta, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaPolenta, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    break;
    
     case 7: //Traversari

   if (opzione == 1) { // da portofuori a ravenna
        image (MappaTraversari, 0, 0, width, height-100);
        opzione = 1;
    } else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height-100);
      if (Video2.time() >= 3) {
        image (MappaTraversari, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaTraversari, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    break;

  case 8: //portofuori

   if (opzione == 8) { // da portofuori a ravenna
        image (MappaPortoFuori, 0, 0, width, height-100);
        opzione = 8;
    } else if (opzione == 1) { // da ravenna a portofuori
      image (Video1, 0, 0, width, height-100);
      if (Video1.time() >= 3) {
        image (MappaPortoFuori, 0, 0, width, height-100);
        opzione = 8;
      }
    } else if (opzione == 5) { // da pineta a portofuori
    image (Video5, 0, 0, width, height-100);
      if (Video5.time() >= 4) {
        image (MappaPortoFuori, 0, 0, width, height-100);
        opzione = 8;
    }
    }
    break;
    
     case 9: //Santo Stefano
     if (opzione == 1) { // da portofuori a ravenna
        image (MappaSantoStefano, 0, 0, width, height-100);
        opzione = 1;
    } else if (opzione == 8) { // da portofuori a ravenna
      image (Video2, 0, 0, width, height-100);
      if (Video2.time() >= 3) {
        image (MappaSantoStefano, 0, 0, width, height-100);
        opzione = 1;
      }
    } else if (opzione == 5) { // da pineta a ravenna
    image (Video4, 0, 0, width, height-100);
      if (Video4.time() >= 5) {
        image (MappaSantoStefano, 0, 0, width, height-100);
        opzione = 1;
    }
    }
    break;
  }

serverMappaTomba.sendImage(MappaTomba); 
serverMappaSanFrancesco.sendImage(MappaSanFrancesco); 
serverMappaBraccioforte.sendImage(MappaBraccioforte); 
serverMappaMosaici.sendImage(MappaMosaici); 
serverMappaPineta.sendImage(MappaPineta); 
serverMappaPolenta.sendImage(MappaPolenta); 
serverMappaTraversari.sendImage(MappaTraversari); 
serverMappaPortoFuori.sendImage(MappaPortoFuori); 
serverMappaSantoStefano.sendImage(MappaSantoStefano); 

serverVideo1.sendImage(Video1); 
serverVideo2.sendImage(Video2); 
serverVideo3.sendImage(Video3); 
serverVideo4.sendImage(Video4); 
serverVideo5.sendImage(Video5); 
serverVideo6.sendImage(Video6); 

}

void movieEvent(Movie m) {
  m.read();
}

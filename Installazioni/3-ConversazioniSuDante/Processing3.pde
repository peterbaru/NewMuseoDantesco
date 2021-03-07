import processing.serial.*;
import processing.video.*;
import codeanticode.syphon.*;

Movie myMovie;
Movie movieSegreto;
Movie movieSbloccato;

SyphonServer servermyMovie;
SyphonServer servermovieSegreto;
SyphonServer servermovieSbloccato;

String messaggio;

int selectVideo= 1;

Serial myPort;

void setup() {
   size(1920,1080,P3D);
   myMovie = new Movie(this, "Video1.mp4");
   myMovie.loop();

   movieSegreto = new Movie(this, "Video2.mp4");
   
   
   movieSbloccato = new Movie(this, "Video3.mp4");
   
   servermyMovie = new SyphonServer(this, "Processing Syphon");
   servermovieSegreto = new SyphonServer(this, "Processing Syphon");
   servermovieSbloccato = new SyphonServer(this, "Processing Syphon");
   
   printArray(Serial.list());
  
  myPort = new Serial (this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n'); 
}

void serialEvent(Serial p) { 
  messaggio = p.readString(); 
  println(messaggio);
  String[] comandi=messaggio.split(";");
 
 if(selectVideo<3){
      if(comandi[0].equals("1")){
         selectVideo=1;
         movieSegreto.stop();
         myMovie.volume(1);        
        }
      if(comandi[0].equals("2")){
        myMovie.volume(0);
        selectVideo=2;
        movieSegreto.play();
      } 
    }
}


void draw() {
  background (255);
  
  
  switch(selectVideo){
  case 1:
    image(myMovie,0,0, width,height);
    break;
  case 2:
   image(movieSegreto,0,0,width,height);
    break;
    case 3:
     image(movieSbloccato,0,0,width,height);
     movieSegreto.stop();
    break;
  }
   
   if (movieSegreto.time() >= 2) { 
     // movieSegreto.stop();
      selectVideo=3;
      movieSbloccato.play();     
  }
  
  if (movieSbloccato.time() >= 208) { //il numero da inserire sono i secondi totali
    movieSbloccato.stop();
    selectVideo=1;
    myMovie.volume(1);
     
    }
    
    servermyMovie.sendImage(myMovie); 
    servermovieSegreto.sendImage(movieSegreto); 
    servermovieSbloccato.sendImage(movieSbloccato); 
}

void movieEvent(Movie m) {
  m.read();
}

import processing.sound.*;
import processing.video.*;

int timer = 0;
int tiempoInicial;

Movie vid;
boolean playing;
boolean perdio = false;
String texto = "tócame";
String soltar = "qué fácil fue soltarme";
String ganaste = "sabía que no me dejarías ir";
String créditos = "Concepto, programación, animación y música: Renzo Rospigliosi";
String web = "renzorospigliosi.com";

void setup() {
  size(displayWidth, displayHeight);
  vid = new Movie(this, "tocame.mp4");  
  SoundFile song = new SoundFile(this, "water.mp3");
  song.play();
}

void draw() {
  background(255);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(40);
  fill(0);
  textFont(createFont("Consolas", 40));
  
  if (perdio == false && timer < 61){
    text(texto, width/2, height/6);
  } else {
    text(soltar, width/2, height/2);
    textSize(20);
    text(créditos, width/2, height - 40);
    textSize(10);
    text(web, width/2, height -20);
  }
  
  if (playing && timer < 61){
    image(vid, width/2, height/2, width/2, height/2);
    timer = (millis() - tiempoInicial) / 1000;
    text(timer, width/2+270, height/6);
  } else {
    // Qué pasa cuando no está reproduciendo el video
  }

  // Qué pasa cuando pasa el minuto
  if (timer > 60){
    text(ganaste, width/2, height/2);
    soltar = "";
  } else {
    // Qué pasa cuando no ha pasado el minuto
  }
}

void mousePressed() {
  vid.play();
  playing = true;
  texto = "no me sueltes";
  tiempoInicial = millis();

  // Para resetear el sketch si se cumple alguna de las condiciones
  if (perdio || timer > 60) {
    perdio = false;
    timer = 0;
    tiempoInicial = millis();
  }
}

void mouseReleased() {
  vid.stop();
  playing = false;
  tiempoInicial = 0;
  texto = "";
  perdio = true;
}

void movieEvent(Movie m) {
  m.read();
}

void settings() {
  fullScreen();
}

void stop() {
  vid.stop();
  super.stop();
}

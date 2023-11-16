import processing.sound.*;
import processing.video.*;

Movie vid;
float timer = 0;
int tiempoInicial;
boolean playing = false;
boolean perdio = false;
String texto = "tócame";
String créditos = "Concepto, programación, animación y música: Renzo Rospigliosi";
String web = "renzorospigliosi.com";

void setup() {
  size(displayWidth, displayHeight);
  vid = new Movie(this, "tocame.mp4");
  SoundFile song = new SoundFile(this, "water.mp3");
  song.play();
  vid.hide();
}

void draw() {
  background(255);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(40);
  fill(0);
  textFont(createFont("Consolas", 40));

  if (playing && timer < 61) {
    image(vid, width / 2, height / 2, width / 2, height / 2);
    timer = (millis() - tiempoInicial) / 1000;
    text(floor(timer), width / 2 + 270, height / 6);
    mostrarTexto("no te alejes", height / 6);
  } else {
    if (!playing && !perdio) {
      mostrarTexto("tócame", height / 6);
    } else if (playing && timer > 60) {
      mostrarTexto("sabía que no me dejarías ir", height / 2);
      mostrarTexto(créditos, height - 40, 15);
      mostrarTexto(web, height - 20, 10);
    } else if (!playing && perdio) {
      mostrarTexto("qué fácil fue soltarme", height / 2);
      mostrarTexto(créditos, height - 40, 15);
      mostrarTexto(web, height - 20, 10);
    }
  }
}

void mousePressed() {
  if (!playing) {
    vid.play();
    playing = true;
    texto = "no me sueltes";
    tiempoInicial = millis();
  } else {
    // Para resetear el sketch si se cumple alguna de las condiciones
    if (perdio || timer > 60) {
      perdio = false;
      timer = 0;
      tiempoInicial = millis();
    }
  }
}

void mouseReleased() {
  if (playing) {
    vid.stop();
    playing = false;
    tiempoInicial = 0;
    perdio = true;
  }
}

void mostrarTexto(String txt, float posY, float size) {
  textSize(size);
  text(txt, width / 2, posY);
}

void mostrarTexto(String txt, float posY) {
  mostrarTexto(txt, posY, 40);
}

void windowResized() {
  size(displayWidth, displayHeight);
}

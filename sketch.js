let vid;
let timer = 0;
let tiempoInicial;
let playing = false;
let perdio = false;
let texto = "tócame";
let créditos = "Concepto, programación, animación y música: Renzo Rospigliosi";
let web = "renzorospigliosi.com";

function preload() {
  vid = createVideo("tocame.mp4");
  song = loadSound("water.mp3");
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  vid.hide();
  song.play();
}

function draw() {
  background(255);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(40);
  fill(0);
  textFont("Consolas");

  if (playing && timer < 61) {
    image(vid, width / 2, height / 2, width / 2, height / 2);
    timer = (millis() - tiempoInicial) / 1000;
    text(floor(timer), width / 2 + 270, height / 6);
    mostrarTexto("no te alejes", height / 6);
  } else {
    if (!playing && !perdio) {
      mostrarTexto("tócame", height / 6);
      } else if (playing && timer <= 60) {
    } else if (playing && timer > 60) {
      mostrarTexto("sabía que no me dejarías ir", height / 2);
      mostrarTexto(créditos, height - 40, 15);
      mostrarTexto(web, height - 20, 10);
    } else if (!playing && perdio ) {
      mostrarTexto("qué fácil fue soltarme", height / 2);
      mostrarTexto(créditos, height - 40, 15);
      mostrarTexto(web, height - 20, 10);
    }
  }
}

function mousePressed() {
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

function mouseReleased() {
  if (playing) {
    vid.stop();
    playing = false;
    tiempoInicial = 0;
    perdio = true;
  }
}

function mostrarTexto(txt, posY, size = 40) {
  textSize(size);
  text(txt, width / 2, posY);
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

let timer = 0;
let tiempoInicial;

let vid;
let playing = false;
let perdio = false;
let texto = "";
let soltar = "";
let ganaste = "";
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

  // Verifica si el jugador mantiene presionado el mouse y el temporizador llega a 60
  if (mouseIsPressed && timer > 60) {
    ganaste = "sabía que no me dejarías ir"
    text(ganaste, width / 2, height / 2);
    soltar = "";
    texto = "";
    textSize(20);
    text(créditos, width / 2, height - 40);
    textSize(10);
    text(web, width / 2, height - 20);
  } else if (!perdio && timer < 61) {
    soltar = "";
    ganaste = "";
    texto = "tócame"
    text(texto, width / 2, height / 6);
  } else {
    soltar = "qué fácil fue soltarme"
    ganaste = "";
    texto = "";
    text(soltar, width / 2, height / 2);
    textSize(15);
    text(créditos, width / 2, height - 40);
    textSize(10);
    text(web, width / 2, height - 20);
  }

  if (playing && timer < 61) {
    image(vid, width / 2, height / 2, width / 2, height / 2);
    timer = (millis() - tiempoInicial) / 1000;
    text(floor(timer), width / 2 + 270, height / 6);
  }
}

function mousePressed() {
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

function mouseReleased() {
  vid.stop();
  playing = false;
  tiempoInicial = 0;
  texto = "";
  perdio = true;
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

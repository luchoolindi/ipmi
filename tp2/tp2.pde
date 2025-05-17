PImage d0, d1, d2, d3;
int grosor;
int pantalla;

float t1x, t1y;
float t2x, t2y;

float tf1x = 50;
float tf1y = 410;

float tf2x = 50;
float tf2y = 440;

int contador = 0;

float yTexto1 = 0;
float yTexto2 = 0;
float yTexto3 = 0;

float finalTexto1 = 100;
float finalTexto2 = 150;
float finalTexto3 = 200;

PFont georgia;
float alphaTextoFinal = 0;
boolean animandoTextoFinal = true;

void setup() {
  size(640, 480);
  frameRate(60);

  grosor = 5;

  t1x = 0;
  t1y = 0;

  t2x = width;
  t2y = tf2y;
  // imagenes

  d0 = loadImage("diapo0.jpg");
  d1 = loadImage("diapo1.jpg");
  d2 = loadImage("diapo2.jpg");
  d3 = loadImage("diapo3.jpg");

  d0.resize(640, 480);
  d1.resize(640, 480);
  d2.resize(640, 480);
  d3.resize(640, 480);

  georgia = createFont("Georgia", 32);
  textFont(georgia);

  pantalla = 0;  // (la de presentacion)
}

void draw() {
  background(94);
  textFont(georgia);

  if (pantalla == 0) {
    image(d0, 0, 0);

    // presentación / diapositiva 1

    textAlign(CENTER);
    textSize(grosor);
    fill(255);
    text("THE WEATHER PROJECT", width/2, height/2);

    if (grosor < 30) {
      grosor += 1; 
    }

    if (frameCount == 180) {
      pantalla = 1;
    }
  }

  // pantalla 1 / diapo2

  else if (pantalla == 1) {
    image(d1, 0, 0);

    // Animación del texto
    
    if (t1y < tf1y) {
      t1y += 2;
    }
    t1x = tf1x;

    // Animacion del texto
    
    if (t2x > tf2x) {
      t2x -= 3;
    }
    t2y = tf2y;

    fill(255);
    textSize(18);
    textAlign(LEFT);
    text("La obra se encuentra en Tate Modern, ubicado en Londres.", t1x, t1y);
    text("Fue hecho por Olafur Eliasson, artista danés-islandés en el año 2003.", t2x, t2y);

    if (t1y >= tf1y && t2x <= tf2x) {
      contador++;
      if (contador > 180) {
        pantalla = 2;
        contador = 0;
      }
    }
  }

  //diapositiva 3/ pantalla 2

  else if (pantalla == 2) {
    image(d2, 0, 0);

    fill(255);
    textSize(18);
    textAlign(LEFT);

    if (yTexto1 < finalTexto1) {
      yTexto1 += 2;
    }

    if (yTexto1 >= finalTexto1 && yTexto2 < finalTexto2) {
      yTexto2 += 2;
    }

    if (yTexto2 >= finalTexto2 && yTexto3 < finalTexto3) {
      yTexto3 += 2;
    }

    text("En esta instalación, una enorme lámpara simula el sol\nen el interior del museo.", 50, yTexto1);
    text("El espacio se llena de neblina y una luz cálida que inunda la sala,\ntambien se utilizaba un espejo gigante.", 50, yTexto2);
    text("Esto conseguia que los visitantes fueran participes de una experiencia\ninmersiva.", 50, yTexto3);

    if (yTexto3 >= finalTexto3) {
      contador++;
      if (contador > 240) {
        pantalla = 3;
        contador = 0;
      }
    }
  }

  //diapo 3/ pantalla final

  else if (pantalla == 3) {
    image(d3, 0, 0);

    if (animandoTextoFinal && alphaTextoFinal < 255) {
      alphaTextoFinal += 3;
      if (alphaTextoFinal >= 255) {
        alphaTextoFinal = 255;
        animandoTextoFinal = false;
      }
    }

    fill(255, alphaTextoFinal);
    textSize(18);
    textAlign(LEFT);
    text("La obra invita a reflexionar sobre la naturaleza,\nla percepción y la experiencia colectiva.\nEn ese momento el espectador deja de ser observador\npara convertirse en parte de la obra.\nLa obra atrajo a más de dos millones de personas durante su exhibición.\nLo que la convirtio en una de las obras mas memorables de la  Tate Modern.", 30, 40);

    fill(255, 0, 0);
    ellipse(width - 50, height - 50, 60, 60);

    fill(255);
    textSize(14);
    textAlign(CENTER, CENTER);
    text("Repetir", width - 50, height - 50);
  }
}

void mousePressed() {
  if (pantalla == 3) {
    float dx = mouseX - (width - 50);
    float dy = mouseY - (height - 50);
    if (sqrt(dx*dx + dy*dy) < 30) {
      grosor = 5;
      pantalla = 0;
      t1x = 0;
      t1y = 0;
      t2x = width;
      t2y = tf2y;
      contador = 0;
      yTexto1 = 0;
      yTexto2 = 0;
      yTexto3 = 0;
      alphaTextoFinal = 0;
      animandoTextoFinal = true;
      frameCount = 0;
    }
  }
}

//https://youtu.be/hfsV3Lh7JM0

// VARIABLES GLOBALES ----------------------------------------------------------
PImage referencia;
int columnas = 7;           // Cantidad de columnas en la grilla
int filas = 7;              // Cantidad de filas en la grilla
float radio = 15;           // Radio base de los anillos

//variables de interacción
boolean palpitacion = false;       
boolean colorRandomizado = false;  
boolean invertido = false;          

color randomClaro;          
color randomOscuro;         

// SETUP ----------------------------------------------------------------------

void setup() {
  size(800, 400);                       
  referencia = loadImage("F_4.jpg");   
  referencia.resize(width/2, height);  

  reseteo();                      // Inicializa variables a estado inicial

}

// DRAW -----------------------------------------------------------------------

void draw() {
  background(#BF0D0D);         // Fondo rojo oscuro
  image(referencia, 0, 0);

   //márgenes donde se dibujan los anillos
  float minX = width / 2 + 30;
  float maxX = width - 30;
  float minY = 30;
  float maxY = height - 30;

  // Grilla de anillos
  for (int i = 0; i < columnas; i++) { // i es para recorrer las columnas
    for (int j = 0; j < filas; j++) {  // j es para recorrer las filas

      // Calcula coordenadas mapeadas para cada anillo
      float cx = map(i, 0, columnas - 1, minX, maxX);
      float cy = map(j, 0, filas - 1, minY, maxY);

      // Verifica si el mouse está sobre el anillo para ajustar transparencia
      boolean encima = mouseEncima(cx, cy, radio);
      float transparencia = encima
        ? map(dist(mouseX, mouseY, cx, cy), 0, radio, 255, 100)
        : 255;

      // Controla efecto palpitación 
      float tamañoAnillo = radio;
      if (palpitacion) {
        tamañoAnillo += sin(frameCount * 0.1) * 5;  // Oscila entre +5 y -5
      }

      // Establece color y dibuja el anillo
      stroke(colorAnillos(i, j), transparencia);
      noFill();
      strokeWeight(2);
      anillos(cx, cy, tamañoAnillo);
    }
  }
}

// FUNCIONES PROPIAS ----------------------------------------------------------

// Dibuja un anillo
void anillos(float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
}

// Determina el color del anillo según la posición i,j
color colorAnillos(int i, int j) {
  color claro, oscuro;

  if (colorRandomizado) {
    claro = randomClaro;
    oscuro = randomOscuro;
  } else {
    // Colores base
    claro = color(34, 162, 161);
    oscuro = color(20, 100, 100);
  }

  // Invierte colores si está activo
  if (invertido) {
    color temp = claro;
    claro = oscuro;
    oscuro = temp;
  }

  // Alterna color según suma de índices
  if ((i + j) % 2 == 0) {
    return oscuro;
  } else {
    return claro;
  }
}

// Función para detectar si el mouse está sobre un círculo
boolean mouseEncima(float x, float y, float r) {
  return dist(mouseX, mouseY, x, y) < r;
}

// Eventos de teclado
void keyPressed() {
  if (key == 'r' || key == 'R') {
    reseteo();
  }
  if (key == 'p' || key == 'P') {
    palpitacion = !palpitacion;
  }
  if (key == 'c' || key == 'C') {
    colorRandomizado = true;
    invertido = false;
    randomClaro = color(random(100, 255), random(100, 255), random(100, 255));
    randomOscuro = color(random(0, 100), random(0, 100), random(0, 100));
  }
  if (key == 'i' || key == 'I') {
    invertido = !invertido;
  }
}

// Función que reinicia las variables a su estado original
void reseteo() {
  palpitacion = false;
  colorRandomizado = false;
  invertido = false;
}

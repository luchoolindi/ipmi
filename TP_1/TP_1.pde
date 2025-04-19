PImage me;
void setup () {
size(800,400);
me = loadImage("me.jpg");
background(167);



//los line se van a usar como guias y a modo de hoja cuadriculada

line(0,50,800,50);
line(0,100,800,100);
line(0,150,800,150);
line(0,200,800,200);
line(0,250,800,250);
line(0,300,800,300);
line(0,350,800,350);
line(50,0,50,400);
line(100,0,100,400);
line(150,0,150,400);
line(200,0,200,400);
line(250,0,250,400);
line(300,0,300,400);
line(350,0,350,400);
line(400,0,400,400);
line(450,0,450,400);
line(500,0,500,400);
line(550,0,550,400);
line(600,0,600,400);
line(650,0,650,400);
line(700,0,700,400);
line(750,0,750,400);


//capucha
fill(90, 110, 80);
ellipse(600,280,240,250);

//cuerpo

fill(90, 110, 80);
noStroke();
triangle(782,323,730,399,690,294);
triangle(400,285,400,400,489,264);
quad(480,277,800,326,800,400,400,400);

//cacho de capucha interno
fill(0);
ellipse(600,290,200,235);
fill(90, 110, 80);
noStroke();
triangle(497,310,706,400,500,400);

//cuello
noStroke();
fill(240,190,160);
quad(554,282,662,270,662,325,554,325);


//capucha 2
noStroke();
fill(90, 110, 80);
triangle(575,370,698,248,708,316);
triangle(598,356,675,393,702,306);
triangle(489,270,643,339,506,379);
fill(0);
stroke(4);
line(715,260,597,372);
line(501,274,597,372);
triangle(559,319,594,346,631,318);
noStroke();
fill(240,190,160);
ellipse(596,304,84,55);
triangle(626,323,662,275,663,295);
fill(#E3E3E3);
ellipse(550,360,13,13);
ellipse(650,360,13,13);
stroke(#60985E);
strokeWeight(5);
line(550,360,550,400);
line(650,360,650,400);


//cabeza y oreja


stroke(0);
strokeWeight(0);
fill(240,190,160);
ellipse(693,203,30,60);
ellipse(600,182,190,230);

//ojos
fill(255);
ellipse(555,167,45,15);
ellipse(635,167,45,15);

//pupilas
noStroke();
fill(#361D03);
ellipse(556,166,18,15);
ellipse(635,166,18,15);
fill(255);
ellipse(558,163,3,3);
ellipse(636,163,2,2);


//marcas de lca cara

noStroke();
fill(#5D3B1C);
ellipse(628,199,5,5);

//boca
stroke(0);
strokeWeight(2);
line(558,242,629,246);

//cejas
noFill();
stroke(#432507);
strokeWeight(6);
arc(550,156,50,20,PI, TWO_PI);
arc(634,156,50,20,PI, TWO_PI);

//arito
stroke(#A7A1A1);
strokeWeight(5);
line(695,227,698,235);

//pelo

noStroke();
fill(#5D3B1C);
ellipse(600,88,170,80);
ellipse(555,120,100,40);
ellipse(529,107,40,40);
quad(666,106,690,106,690,147,666,147);
ellipse(677,96,30,37);
ellipse(690,123,34,77);
ellipse(676,144,20,20);
ellipse(662,117,30,20);


//nariz
strokeWeight(2);
noFill();
stroke(0);
line(580,162,572,199);
arc(592,198, 40, 25, 0, PI);
//boca






}



void draw()  {
println("x:");
println(mouseX);
println("Y:");
println(mouseY);
me.resize(400,400);
image(me,0,0);
  }

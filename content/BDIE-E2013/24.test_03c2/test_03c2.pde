// Final sketch
// Pernille Have, phav@itu.dk

// Variable
PFont f;
int oldMouseX = 0;
int oldMouseY = 0;
color c1, c2, c3, c4, c5, c6; // Sætter 6 forskellige farver.

void setup(){
size(800, 600); // Sætter størrelsen på vinduet
background(0); // Sætter baggrunden til sort
f = createFont("Helvetica",random(50,100),true); // Definerer fonten
frameRate(12); // Sætter hastigheden ned så det ikke går så hurtigt

// Definerer de 6 farver
c1 = color(40, 115, 140); // Mørk blå
c2 = color(255, 168, 0); // Orange
c3 = color(15, 215, 180); // Tyrkis
c4 = color(150, 230, 55); // Neon grøn
c5 = color(15, 90, 80); // Mørk grøn
c6 = color(110, 64, 132); // Lilla
}

void draw(){
// Når musen bevæges skifter baggrunden farve i tilfældige gråtoner
 if(mouseX != oldMouseX && mouseY != oldMouseY){
 background(random(0,255));}

// Tekst der skifter størrelse/blinker  
  fill(255); // Hvid tekst
  textAlign(CENTER); // Teksten centres

  textFont(f,random(width/10,width/7));
  text("GREYSCALE", width/2, height/2 - 100);

  textFont(f,random(width/8,width/5));
  text("COLOR", width/2, height/2 + 200);
  
  textFont(f,random(50,100));
  text("MY KIND OF", width/2, height/2);
  
  oldMouseX = mouseX; 
  oldMouseY = mouseY;
}

// Hver gang der trykkes på musen stopper loopet og der kommer farver på baggrunden og teksten.
void mousePressed() {

  int randomNumber = round(random(1,6)); // For at skifte mellem c1-c6 skal tallene 1-6 defineres.
  
  color randomColor = c1; // Der laves en farve
  color randomColor2 = c2; // Og jeg har brug for to for både at skifte baggrund og tekst.
 
 // Her sættes hvilke farve der skal svare til hvilket tal.
  if(randomNumber == 1){
    randomColor = c1;
    randomColor2 = c2;
  } 
  
  if(randomNumber == 2){
    randomColor = c2;
    randomColor2 = c3;
  } 

  if(randomNumber == 3){
    randomColor = c3;
    randomColor2 = c4;
  } 

  if(randomNumber == 4){
    randomColor = c4;
    randomColor2 = c5;
  } 

  if(randomNumber == 5){
    randomColor = c5;
    randomColor2 = c6;
  } 
  
  if(randomNumber == 6){
  randomColor = c6;
  randomColor2 = c1;
  } 
  
  background(randomColor); // Baggrunden tildeles farve
  
  textAlign(CENTER);
  fill(randomColor2);

  textFont(f,random(width/10,width/7));
  text("GREYSCALE", width/2, height/2 - 100);

  fill(randomColor2);
  textFont(f,random(width/8,width/5));
  text("COLOR", width/2, height/2 + 200);
  
  textFont(f,random(50,100));
  text("MY KIND OF", width/2, height/2);
  
  strokeWeight(8);
  stroke(randomColor2);
  line(100, 260, width-100, 140);
  line(100, 140, width-100, 260);

  noLoop();
}

// Når musen slippes genoptages loopet i de grå toner.
void mouseReleased() {
  loop();
}

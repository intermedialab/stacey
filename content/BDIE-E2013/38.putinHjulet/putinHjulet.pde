/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/38.putinHjulet/putin.png"; */

//Putin-hjulet

// tryk på musen for at fange Putin
// tryk space for at dreje ham den anden vej 
// tryk 1 for at øge frames
// tryk 2 for at sænke frames

float counter=0;
int frames =60;
float posX = 0;
float posY = 0;
PImage putin;

void setup() {
  size(800, 600);
  background(#2AAAAA);
  putin = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/38.putinHjulet/putin.png");
  

 
}

void draw() {
  
  // Her sker der noget mystisk. Opacity giver åbenbart en et langsomt farveskift fra background i setup til farven af denne rektangel. Hvorfor mon det?
  fill(#CCCCCC, 5);          
  rect(0, 0, width, height); // Denne rektangel dækker hele display vinduet
  

  
  
 // Translate rykker billedet i x og y aksen. Sinus og Cosinus placerer billedet så det passer til cirkelbevægelsen. 
   if (mousePressed == true) {
  translate(mouseX+cos(counter), mouseY+sin(-counter));    // if true:  billedet følger musen  
  }
  else translate(width/2+cos(counter), height/2+sin(-counter)); // else:  billedet sidder "kvart inde i vinduet". Dvs. i midten
  
  
  //  TWO_PI er ren matematik. 2 Pi er en forholdet mellem en cirkels omkreds og diameter. TWO_PI roterer billedet og giver cirkelvægelsen
  if (keyPressed) {
    if (key == ' ') {
       counter+=(TWO_PI)/frames; // Hvis Space holdes nede ændrer billedet retning til med uret.
    }}
    else counter-=(TWO_PI)/frames; // Ellers: mod uret



// Her lægges der blot 1 frame til eller fra de 60 frames
  if (keyPressed) {
    if (key == '1') {
       frames ++ ;
    }}
    
  if (keyPressed) {
  if (key == '2') {
       frames -- ;
    }}

  
  rotate(counter); //Til sidst: Counter roteres
  image(putin, 0, 0, 100, 100); // billedet kaldes
  

// Antal af frames bliver printet
println(frames);

}





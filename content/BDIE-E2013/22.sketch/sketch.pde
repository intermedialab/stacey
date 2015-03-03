// Jeg vil lave cirkler der bevæger sig efter musen.
//Sætte skiftende farver på
//Cirklerne skal blive større ved tryk på mus.
//Cirklerne skal spejle sig selv, og danne mynstre.

int size = 12;

void setup() {
  size(500,500); //side størrelse
  background(225); //baggrund grå
  noStroke(); //ingen omrids
}
 
void draw() {
//cirkeler der følger mus, men tilfældige farver
  fill(random(0,255),random(0,255),random(0,255),80);
  ellipse(500-mouseX,mouseY, size,size);
  ellipse(mouseX,500-mouseY, size,size);
  ellipse(500-mouseX,500-mouseY, size,size);
  ellipse(mouseX,mouseY, size,size);

//Tryk med mus endre cirkelstørelse indtil tryk slippes
    if (mousePressed){
    fill(random(0,256),random(0,256),random(0,256),80);
    ellipse(500-mouseX,mouseY, size = 30,size = 30);
    ellipse(mouseX,500-mouseY, size = 30,size = 30);
    ellipse(500-mouseX,500-mouseY, size = 30,size = 30);
    ellipse(mouseX,mouseY, size = 30,size = 30); 
  
  } else {
    fill(random(0,255),random(0,255),random(0,255),80);
    ellipse(500-mouseX,mouseY, size = 12,size= 12);
    ellipse(mouseX,500-mouseY, size = 12,size = 12);
    ellipse(500-mouseX,500-mouseY, size = 12,size = 12);
    ellipse(mouseX,mouseY, size = 12,size = 12);
  }
} 
  

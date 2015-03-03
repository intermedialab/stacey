/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/4.the_seasons/aarstiderne.jpg"; */

//THE SEASONS
// credit to olek@itu.dk
//anem@itu.dk, annlu@itu.dk, julc@itu.dk

float posX = 0;
float posY = 0; 
float speedX = 5; //speed does not change
float speedY = 5; //therefore it is linear
float circleSize = 5;

PImage img;

void setup (){
  size (474, 398); 
  posX = width/20;
  posY = width/20;
  //The line of circles start in the left corner
  img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/4.the_seasons/aarstiderne.jpg");
  image(img); 
} 

void draw (){
  noStroke();
  ellipse (posX, posY, circleSize, circleSize);
  posX = posX + speedX; //this will move the position of the circle in addition to the defined speed
  posY = posY + speedY; //this will move the position of the circle in addition to the defined speed
 
  
 if (posX > width -(circleSize/2)){ 
         speedX = -speedX;
      fill(96, 219, 44); // Brown 
       
  }
  
  if(posX < (circleSize/2)){
      speedX = -speedX;
      fill(84, 52, 11); // Green
  }

 if (posY > height -(circleSize/2)){ 
     speedY = -speedY;     
     fill(255, 239, 1); // Yellow  
 }
 
 if(posY < (circleSize/2)){
    speedY = -speedY;
    fill(255, 255, 255); // White
 }
 
}
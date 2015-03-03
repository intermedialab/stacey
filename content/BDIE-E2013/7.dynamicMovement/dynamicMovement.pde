/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/7.dynamicMovement/sky.jpg"; */

// DYNAMIC MOVEMENT v. 2
// ceki@itu.dk

float posX = 0;
float posY = 0;
float speedX = 0; // speed does not change
float speedY = 0; // therefore it is linear
float circleSize = 100;
float toMouseX = 0;
float toMouseY = 0;
PImage img;

// Setup - runs only once in each sketch
void setup(){
  // Load image
  img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/7.dynamicMovement/sky.jpg");
  size(1000, 460);
  
  posX = width/2;
  posY = height/2;
  
  // Change the framerate for a more smooth sketch
  frameRate(150);
}

// Draw - runs once each frame
void draw(){
 image(img, 0, 0);
 ellipse(posX, posY, circleSize, circleSize); 
 posX = posX + speedX; // move the position on the xAxis with the set speed
 posY = posY + speedY; // move the position on the xAxis with the set speed
 
   // Calculate the distance to the mouse pointer
   toMouseX = distanceTo(posX, pmouseX);
   toMouseY = distanceTo(posY, pmouseY);
   
   // Change the speed, such that the eclipse chases the mouse.
   if(toMouseX > 0){
     speedX = - toMouseX/100;
     fill(toMouseX);
   }
   if(toMouseX < 0 ){
     speedX = - toMouseX/100;
     fill(-toMouseX);
   }
   if(toMouseY > 0){
     speedY = - toMouseY/100;
     
   }
   if(toMouseY < 0){
     speedY = - toMouseY/100;
     
   }
   
   // Error-handling for the wall. Ellipse can't go past the wall.
   if(posX > width-(circleSize/2)){
     posX = width-(circleSize/2);
   } else if(posX < (circleSize/2)){
     posX = (circleSize/2);
   }
   if(posY > height-(circleSize/2)){
     posY = height-(circleSize/2);
   } else if(posY < (circleSize/2)){
     posY = (circleSize/2);
   }
 
}

// Method for calculating the distance to the mouse. Returns a float.
 float distanceTo(float pos, float mouse){
    return pos - mouse; 
 }



PImage Cross;
PImage Knaldperlen;
float posX = 0;
float posY = 0;
float speedX = 5; // speed does not change
float speedY = 5; // therefore it is linear
float circleSize = 75;


void setup() {
  size (600, 800);
  noCursor(); 
  Cross = loadImage("cross.png");
  Knaldperlen = loadImage("knaldperlen.png");
  background(#FFFFFF);
  cursor(Cross,0,0);
  posX = width/2;  // we start from the middle of the screen
  posY = height/2; // or we will be in trouble, see for yourself
                   // what happens if one of these is 0
  
 

}


 void draw() {
    if (mousePressed == true) { 
      background(random(255),random(255),random(255),random(255));
    }
    else background(#FFFFFF); 
  
 image(Knaldperlen, posX, posY, circleSize, circleSize); 
 posX = posX + speedX; // move the position on the xAxis with the set speed
 posY = posY + speedY; // move the position on the xAxis with the set speed
 
 if(posX > width-(circleSize/2) || posX < (circleSize/2)){ // || means OR, as && means AND - pc(AltGr+`) mac(Alt+i)
   // now we've moved beyond the right or left side of the window
   speedX = -speedX;
 }
 
 if(posY > height-(circleSize/2) || posY < (circleSize/2)){ 
   // now we've moved beyond the bottom or the top of the window
   speedY = -speedY;
 if (mousePressed == true) { background(random(255),random(255),random(255),random(255));
 }
 }
}






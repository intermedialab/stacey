//Niels Petersen, npet@itu.dk
//Why bother creating something from scratch
//when you can outsource your worries for cheap?
//#theWesternWayOfInnovation
//=========================================================
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img;
PImage img2;
//=========================================================
float posX = 0;
float posY = 0;
float speedX = 3;
float speedY = 3;
float imgSize = 70;
//from olek@itu.dk -> Dynamic movement
//=========================================================
void setup()
{
  size (800, 570);
  posX = width/2;
  posY = height/2;
  img = loadImage("made-by-wong-1.png");
  img2 = loadImage("made-by-wong-2.png");
  minim = new Minim(this);
  player = minim.loadFile("Mao_Zedong_swagtrack.mp3", 2048);
  player.play();
  player.loop();
  
}
//=========================================================
void draw()
{
  background(255);
  image(img, 0, 0);
  image(img2, posX-60, posY-45);
  noCursor();
//========================================================= 
  posX = posX + speedX;
  posY = posY + speedY;
  if(posX > width-(imgSize/2) || posX < (imgSize/2)){
  speedX = -speedX;
 }
  if(posY > height-(imgSize/2) || posY < (imgSize/2)){ 
  speedY = -speedY;
 } //from Olek@itu.dk -> Dynamic movement 
}
//=========================================================
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}

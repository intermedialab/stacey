

/* built with Studio Sketchpad: 
 *   http://sketchpad.cc
 * 
 * observe the evolution of this sketch: 
 *   http://studio.sketchpad.cc/sp/pad/view/ro.o2CfyMx0gDs/rev.372
 * 
 * authors: 
 *   Bjarti
 *   

 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */ 


// ALEKSANDAR LAZIC - alaz
// BJARTI A STEIG - bjst
 
// This code is a remix of:
// http://www.openprocessing.org/sketch/116516
//Raven Kwok (aka Guo Ruiwen)
 
// We've decited to remix it using two invisible moving balls. The position of the balls will determine the look of the sketch. 
 
 
 
Hexagon hxg;
float strutF, strutFIncre, rRangeF, rRangeFIncre, rRange, rnRangeF, rnRangeFIncre, rnRange;
 
PVector [] initVs = new PVector[6];
 
float posX = 0;
float posY = 0;
float speedX = 12;
float speedY = 12;
float circlesize = 0 ;
float posX1 = 0;
float posY1 = 0;
float speedX1 = 6;
float speedY1 = 4;
 
void setup(){
  size(600,600);
  smooth();
  frameRate(30);
   
  strutF = random(100);
  rRangeF = posX*0.4;
  rnRangeF = random(20);
  strutFIncre = 0.015;
  rRangeFIncre = 0.015;
  rnRangeFIncre = 0.015;
  rRange = 300;
  rnRange = PI/3.5;
   
  hxg = new Hexagon(6, 0, 3);
   
  for(int i=0; i< initVs.length; i++){
    initVs[i] = new PVector(0, 0);
  }
}
 
void draw(){
 background(posX*0.5+posY1*0.4,0.3*posY1+0.5*posX1, ((posY1-posX)+25)*0.3);
  translate(width/2, height/2);
   
  updateInitVs();
  hxg.update(initVs, strutF);
  hxg.display();
   
  strutF += strutFIncre; 
 // We make twp moving balls because we want the colors to depend on the position of the balls:
 // We set the circlesize to 0, så the balls' course don't really matter as long theymove. 
 ellipse(posX, posY, circlesize, circlesize);
  posX = posX + speedX; 
  posY = posY + speedY; 
    if (posX >600 || posX < 0){
    speedX = -speedX;
    }
     if (posY >600 || posY < 0){
    speedY = -speedY;
     }
    
     ellipse(posX1, posY1, circlesize, circlesize);
  posX1 = posX1 + speedX1; 
  posY1 = posY1 + speedY1; 
    if (posX1 >600 || 0 > posX1){
    speedX1 = -speedX1;
      if (posY1 >600 || posY1 < 0){
    speedY1 = -speedY1;
     }
    }
    }    
void updateInitVs(){
  float rnIncre = PI/3.0;
  for(int i=0; i< initVs.length; i++){
    float radius = rRange+(noise(rRangeF+i*0.3)-0.6)*rRange;
    float radian = rnIncre*i+(noise(rnRangeF+i*0.1)-0.1)*rnRange;
     
    float x = cos(radian)*radius;
    float y = sin(radian)*radius;
     
    initVs[i].set(x, y);
  }
  rRangeF += rRangeFIncre;
  rnRangeF += rnRangeFIncre;
}
class Hexagon{
   
  Hexagon [] subHxgs;
   
  int index, lv, maxLv;
  float strutRatio;
   
  PVector [] outers, mids, quars, struts;
   
  Hexagon(int index, int lv, int maxLv){
    this.index = index;
    this.lv = lv;
    this.maxLv = maxLv;
     
    outers = new PVector[6];
    mids = new PVector[6];
    struts = new PVector[6];
    quars = new PVector[12];
     
    for(int i=0; i<outers.length; i++){
      outers[i] = new PVector(0, 0);
      mids[i] = new PVector(0, 0);
      struts[i] = new PVector(0, 0);
    }
     
    for(int i=0; i<quars.length; i++){
      quars[i] = new PVector(0, 0);
    }
     
    if(lv<maxLv){
      lv++;
      subHxgs = new Hexagon[7];
      for (int i=0;i<subHxgs.length;i++) {
        subHxgs[i] = new Hexagon(i, lv, maxLv);
      }
    }
  }
   
  void update(PVector [] outers, float strutF){
    this.outers = outers;
     
    for(int i=0;i<mids.length;i++){
      int j = (i+1)% mids.length;
      getInBetween(mids[i], outers[i], outers[j], 0.5);
    }
     
    for(int i=0;i<quars.length;i+=2){
      int j = (i/2+1)% mids.length;
      getInBetween(quars[i], mids[i/2], outers[j], 0.5);
      getInBetween(quars[i+1], outers[j], mids[j], 0.5);
    }
     
    for(int i=0;i<struts.length;i++){
      int j = (i+3)%6;
      strutRatio = 1-noise(strutF)*0.75;
      getInBetween(struts[i], mids[i], mids[j], strutRatio);
      strutF += 0.1;
    }
     
    if(lv<maxLv){
      strutF ++;
      subHxgs[6].update(struts, strutF);
      strutF += 0.1;
      for (int i=0;i<6;i++) {
        int j = (i+1)%6;
        int k = (i*2)%12;
        PVector [] group = {
          mids[i], quars[k], quars[k+1], mids[j], struts[j], struts[i]
        };
        subHxgs[i].update(group, strutF);
        strutF += 0.1;
      }
    }
  }
   
  void display(){
    drawHxg();
    drawSubHxgs();
  }
   
  private void getInBetween(PVector v, PVector v1, PVector v2, float ratio){
    v.set(v1.x * ratio +v2.x * (1-ratio), v1.y * ratio +v2.y * (1-ratio));
  }
   
  private void drawEdge(PVector v1, PVector v2){
    line(v1.x, v1.y, v2.x, v2.y);
  }
   
  private void drawHxg(){
  fill(((posX1+posY1)*0.33),(posX*0.3)+posY*0.1,(posX+(posY1-posY))*0.14);
    strokeWeight(1);
    stroke(0, 120);
    beginShape();
    for (int i=0;i<outers.length;i++) {
      vertex(outers[i].x, outers[i].y);
    }
    endShape(CLOSE);
  }
   
  private void drawSubHxgs(){
   noFill();
    strokeWeight(1);
    stroke(0, 120);
    for (int i=0;i<mids.length;i++) {
      drawEdge(mids[i], struts[i]);
    }
    for (int i=0;i<quars.length;i+=2) {
      drawEdge(quars[i], quars[i+1]);
    }
    for (int i=0;i<struts.length;i++) {
      int j = (i+1)% struts.length;
      drawEdge(struts[i], struts[j]);
    }
    if(lv<maxLv){
      for (int i=0;i<subHxgs.length;i++) {
        subHxgs[i].drawSubHxgs();
      }
    }
  }
}
 
 
 


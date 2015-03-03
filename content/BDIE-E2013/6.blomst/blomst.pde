
//Kode lånt af Raven Kwok (aka Guo Ruiwen)
// Vi har lavet en blomst!
//Camilla Olsen cbra@itu.dk & Tine Schultz tces@itu.dk


 
Hexagon hxg;
float strutF, strutFIncre, rRangeF, rRangeFIncre, rRange, rnRangeF, rnRangeFIncre, rnRange;
 
PVector [] initVs = new PVector[6];
 
void setup(){
  size(800,800);
  smooth();
  frameRate(30);
  background(249, 129, 181); 
  
  //droplet= loadImage("drop.png");
  //size(800, 800);
  
  
  strutF = random(100);
  rRangeF = random(100);
  rnRangeF = random(100);
  strutFIncre = 0.01;
  rRangeFIncre = 0.01;
  rnRangeFIncre = 0.01;
  rRange = 200;
  rnRange = PI/3.0;
   
  hxg = new Hexagon(6, 0, 3);
   
  for(int i=0; i< initVs.length; i++){
    initVs[i] = new PVector(0, 0);
  }
}
 
void draw(){
  background(249, 129, 181); //Gør baggrunden lyserød. 
  translate(width/2, height/2);
   
  updateInitVs();
  hxg.update(initVs, strutF);
  hxg.display();
   
  strutF += strutFIncre;
}
 
void updateInitVs(){
  float rnIncre = PI/3.0;
  for(int i=0; i< initVs.length; i++){
    float radius = rRange+(noise(rRangeF+i*0.2)-0.5)*rRange;
    float radian = rnIncre*i+(noise(rnRangeF+i*0.2)-0.5)*rnRange;
     
    float x = sin(radian)*radius;
    float y = cos(radian)*radius;
    float z = tan(radian)*radius; //Tilføjet z-aksen
     
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
    fill(153 , 194, 181); //Gør yderste hexagon grøn
    strokeWeight(5);
    stroke(103, 165, 153); //Gør yder-kanterne grønne
    beginShape();
    for (int i=0;i<outers.length;i++) {
      vertex(outers[i].x, outers[i].y);
    }
    endShape(CLOSE);
  }
   
  private void drawSubHxgs(){
    fill(126); 
    strokeWeight(1);
    stroke(240, 4, 127); //Gør inder-stregerne pink
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


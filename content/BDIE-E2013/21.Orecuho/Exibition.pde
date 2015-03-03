//OP = Orecuho
//http://studio.sketchpad.cc/sp/pad/view/ro.9ZxdPoa-PtQdn/rev.7

Bug[] orecuho = new Bug[200];
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
  fill(255);
  for(int i=0; i<orecuho.length; i++) {
    float x = width/2 + tan(i/10.0) * i;
    float y = height/2 + cos(i/10.0) * i;
    orecuho[i] = new Bug(x, y, 0.05 + i/1000.0);
  }
}
void mouseMoved() {
  float k1 = map(mouseX, 0, width, 1, 15);
  float k2 = map(mouseY, 0, height, 900, 1100);
  for(int i=0; i<orecuho.length; i++) {
    float x = width/2 + tan(i/k1) * i;
    float y = height/2 + cos(i/k1) * i;
    orecuho[i].change(x, y, 0.05 + i/k2);
  }
}
void draw() {
  background(150, 0, 0);
  
  for(int i=0; i<orecuho.length; i++) {
    orecuho[i].live();
  }
}
 
 
class Bug {
  float x;
  float y;
  
  float t;
  float speed;
   
  Bug(float tx, float ty, float tspeed) {
    x = tx;
    y = ty;
    t = 0;
    speed = tspeed;
  }
 
  void change(float tx, float ty, float tspeed) {
    x = tx;
    y = ty;
    speed = tspeed;
  }
 
  void live() {
    float sz = map(sin(t), -1, 1, 10, 20);
    ellipse(x, y, sz, sz);
    t = t + speed;
  }  
}

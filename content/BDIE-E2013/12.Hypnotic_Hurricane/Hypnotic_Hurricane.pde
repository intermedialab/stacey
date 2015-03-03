/*
Inspired by: Rayhan Hasan, 24-10-2011, https://github.com/rsh/Small-Generative-Art-Sketches/blob/master/crescentStudy_concentric/crescentStudy_concentric.pde

Modified by: Jonathan Jørgensen, 17-10-2013, http://oddchap.org/
*/

int bredde = 600;
int hoejde = 600;
int numCrescentsPerSide=5;
int numPixelsPerColumn= bredde/numCrescentsPerSide;
int numConcentricCircles=20;
color c1, c2;
float amt = 0.2;

void setup () {
  size(bredde,hoejde);
  frameRate(60);
  background(0);
  noStroke();
  smooth();
  c1 = color(255,0,0);
  c2 = color(0,0,255);
}

void draw () {
  
  
  
  //background(lerpColor(c1, c2, amt));
  background(0);  
  for(int i = 1; i <= numCrescentsPerSide; i++) {
   for(int j = 1; j <= numCrescentsPerSide; j++) {
     
    int x = i*numPixelsPerColumn-numPixelsPerColumn/2;
    int y = j*numPixelsPerColumn-numPixelsPerColumn/2;
    int size = (int)(numPixelsPerColumn/numConcentricCircles*.8);
    
    fill(255);
    int borderSize =(int)(numPixelsPerColumn*0.8);
    ellipse(x, y, borderSize, borderSize);
    
    for(int k=numConcentricCircles; k>=1;k--) {
      drawCrescentOrbiters(x, y, k*size, (j+i)*10, 0, k*1.2);
    }
    
   }
  }
  
}



void drawCrescentOrbiters(int x, int y, int cSize, int startingOffset, int differenceOffset, float speed) {

  fill(255);
  drawOrbitingCircle(x, y, cSize+10, 4, speed, startingOffset);
  
  fill(0);
  drawOrbitingCircle(x, y, cSize+9, 2, speed, startingOffset+differenceOffset);
}

void drawOrbitingCircle(int x, int y, int cSize,  int distance, float speed, int offset) {

  //Try to out-comment the rotate function for drastic change!
  rotate(sin(radians(frameCount+(x+=1)))/10); 
     ellipse(x+sin(radians(frameCount+offset)*speed)*distance, 
          y+cos(radians(frameCount+offset)*speed)*distance, cSize, cSize);
}


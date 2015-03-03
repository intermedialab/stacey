/*
Inspired by: Rayhan Hasan, 24-10-2011, https://github.com/rsh/Small-Generative-Art-Sketches/blob/master/crescentStudy_concentric/crescentStudy_concentric.pde

And: Wave Gradient by Ira Greenberg, http://processing.org/examples/wavegradient.html

Modified by: Jonathan Jørgensen, 17-10-2013, http://oddchap.org/
*/

int bredde = 600;
int hoejde = 600;
int numCrescentsPerSide=10;
int numPixelsPerColumn= bredde/numCrescentsPerSide;
int numConcentricCircles=10;
//color c1, c2;
//float amt = 0.2;
float angle = 0;
float px = 0, py = 0;
float amplitude = 30;
float frequency = 10;
float fillGap = 3;
color c;

void setup () {
  size(bredde,hoejde);
  frameRate(60);
  background(0);
  noStroke();
  smooth();
  //c1 = color(255,0,0);
  //c2 = color(0,0,255);
}

void draw () {
  
  for (int i =- 75; i < height+75; i++){
    // Reset angle to 0, so waves stack properly
    angle = 0;
    // Increasing frequency causes more gaps
    frequency+=.05;
    
    for (float j = 0; j < width+75; j++){
      py = i + sin(radians(angle)) * amplitude;
      angle += frequency;
      c =  color(abs(py-i)*5/amplitude, 255-abs(py-i)*255/amplitude, j*(5.0/(width+250)));
      // Hack to fill gaps. Raise value of fillGap if you increase frequency
      for (int filler = 0; filler < fillGap; filler++){
        set(int(j-filler), int(py)-filler, c);
        set(int(j), int(py), c);
        set(int(j+filler), int(py)+filler, c);
        
      }
    }
  }
  
  //background(lerpColor(c1, c2, amt));
  for(int i = 1; i <= numCrescentsPerSide; i++) {
   for(int j = 1; j <= numCrescentsPerSide; j++) {
     
    int x = i*numPixelsPerColumn-numPixelsPerColumn/2;
    int y = j*numPixelsPerColumn-numPixelsPerColumn/2;
    int size = (int)(numPixelsPerColumn/numConcentricCircles*.8);
    
    fill(0,200,20);
    int borderSize =(int)(numPixelsPerColumn*0.8);
    ellipse(x, y, borderSize, borderSize);
    
    for(int k=numConcentricCircles; k>=1;k--) {
      drawCrescentOrbiters(x, y, k*size, (j+i)*10, 0, k*1.2);
    }
    
   }
  }
  
}



void drawCrescentOrbiters(int x, int y, int cSize, int startingOffset, int differenceOffset, float speed) {

  fill(0,200,20);
  drawOrbitingCircle(x, y, cSize+10, 4, speed, startingOffset);
  
  fill(0);
  drawOrbitingCircle(x, y, cSize+9, 2, speed, startingOffset+differenceOffset);
}

void drawOrbitingCircle(int x, int y, int cSize,  int distance, float speed, int offset) {

  //rotate(sin(radians(frameCount+(x+=1)))/10); 
     ellipse(x+sin(radians(frameCount+offset)*speed)*distance, 
          y+cos(radians(frameCount+offset)*speed)*distance, cSize, cSize);
}


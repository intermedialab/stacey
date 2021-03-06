/*
Inspired by: Wave Gradient by Ira Greenberg, http://processing.org/examples/wavegradient.html

Modified by: Jonathan Jørgensen, 17-10-2013, http://oddchap.org/
*/

float angle = 0;
float px = 0, py = 0;
float amplitude = 30;
float frequency = 0;
float fillGap = 2;
color c;

void setup() {
  size(600, 600);
  background(200);
  //noLoop();
}

void draw() {
  for (int i =- 75; i < height+75; i++){
    // Reset angle to 0, so waves stack properly
    angle = 0;
    // Increasing frequency causes more gaps
    frequency+=.002;
    
    if (frequency > 5) {
      frequency -=20;
    }
    
    for (float j = 0; j < width+75; j++){
      py = i + sin(radians(angle)) * amplitude;
      angle += frequency;
      c =  color(abs(py-i)*255/amplitude, 255-abs(py-i)*255/amplitude, j*(255.0/(width+50)));
      // Hack to fill gaps. Raise value of fillGap if you increase frequency
      for (int filler = 0; filler < fillGap; filler++){
        set(int(j-filler), int(py)-filler, c);
        set(int(j), int(py), c);
        set(int(j+filler), int(py)+filler, c);
      }
    }
  }
}

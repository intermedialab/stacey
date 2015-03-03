//remix with P_2_0_03 from http://www.generative-gestaltung.de

boolean recordPDF = false;

color strokeColor = color(0, 50);
int totalTimeBG = 6000;
int savedTime;
color rectColor = color(185, 0, 46);
color strokeColoe = color(100, 30, 40);
float noiseScale=10.02;
boolean filled = false;
boolean freeze = false;
int mode = 0;




void setup(){
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noFill();
  fill(0, 0, 0);
  rect(0, 0, 720, 720);
  savedTime = millis();
  
}

void draw(){
 
    pushMatrix();
    translate(width/2,height/2);

    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;

    strokeWeight(0.5);
 for (int x=0; x < width; x++) {
    float noiseVal = noise((mouseX+x)*noiseScale, 
                            mouseY*noiseScale);
    stroke(noiseVal*255);
 
  }
    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    
     int passedTime = millis() - savedTime;
  if (passedTime > totalTimeBG) {
    fill(rectColor, 2);
    savedTime = millis(); 
  }
   
    endShape();
    
    popMatrix();
  
}

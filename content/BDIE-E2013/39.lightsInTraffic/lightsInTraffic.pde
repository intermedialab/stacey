// Lights in traffic - J Finne
// jfin@itu.dk
// Inspiration from:
// Noise1D - http://processing.org/examples/noise1d.html

// Variables
// First position for the first ellipse.
float xoff = 0.00001;
float yoff = 0.00001;

// Movement from existing position, to another with a step of 0.01.
float xincrement = 0.01;
// Movement from existing position, to another with a step of 0.01.
float yincrement = 0.01;
// Increment for the frameRate by 50.
float fincrement = 50;

// The count of the start at the code.
int counter = 0;

void setup() {
  size(800, 600);
  background(0);
  noStroke();
}

void draw()
{
  // Shows the count of mousepress.
  println(counter);
  
  // firkant størrelse
  fill(0);
  // rect(x, y, width, height)
  rect(width*0.02, height*0.044, width*0.07, height*0.05);
  // Skriver hvad count er
  // Text Color
  fill(255);
  
  // Caculate "speed"
  float speed = counter*8*counter/2;
  // 70 miles is about 112 km/t.
  textAlign(LEFT);
  text(speed+("mph"), height*0.05, width*0.05);
  textSize(15);
  
  
  // Creating a background with adopts the "old" ellipse so the new one is most white.
  fill(0, 10);
  rect(0,0,width,height);  

  // Scale it to the window's width and get a random value based on xoff.
  // By putting random instead of noise, the ghost-effect disapers and becomes more random.
  // Look more like car lights in a city now.
  float x = (random(noise(xoff)))*width*3;
  
  // With each cycle, increment xoff.
  xoff += xincrement+xincrement+xincrement;
  // With each cycle, increment yoff.
  float y = (random(noise(yoff)))*height*3;
  yoff += yincrement+yincrement+yincrement;
 
  // Activity when pressing mouse.
  // If mouse being pressed 5 or more, the if-statment will beging.
  if (counter >= 5) {
    // Makes the form red.
    fill(200, 0, 0);
    // Blue "police lights" at top.
    y = noise(width);
    
    // displayWidth/2 & 400 is the middel of a Macbook Pro screen.
    textAlign(CENTER);
    // By making the code with "width & height" the code becomes combatible with other computers than a Macbook Pro (1280x800).
    textSize(width*0.01953125);
    // Text under the triangles.
    text("Too fast!", width/2, height/2);
    
    // Warning triangle.
    // Red color.
    fill(200,0,0);
    // triangle(x1, y1, x2, y2, x3, y3)
    // By making the code with "width & height" the code becomes combatible with other computers than a Macbook Pro (1280x800).
    triangle(width/2, height*0.3125, width*0.4296875, height*0.46875, width*0.5703125, height*0.46875);
    // White color for the small triangle
    fill(255,255,255);
    // Small triangle 
    triangle(width/2, height*0.34375, width*0.453125, height*0.4525, width*0.546875, height*0.4525);
    // Black color for the "!" in the middle.
    fill(0,0,0);
    // Text in the middle of the triangle.
    textAlign(CENTER);
    textSize(60);
    text("!", width/2, height*0.4375);
    
    // Blue color for ellipses. - Police "lights".
    fill(0,0,200);
    
  }
    if (counter < 1) {
   // Draw the ellipse at the value produced by random perlin.
    fill(255);
    ellipse(x, y, 60, 60);
    
    // Infobox
    fill(200,0,0);
    rect(width/2.62, height/3.4, 300, 50);
    fill(255);
    textAlign(CENTER);
    text("Press the mouse and enjoy.", width/2, height/3);
    textSize(15);
}
   if (counter == 1) {
     // Speed of moving "lights".
     frameRate(25+fincrement);
     fill(255);
     ellipse(x, y, 60, 48);
}
   if (counter == 2) {
     // Speed of moving "lights".
     frameRate(0+fincrement);
     fill(255);
     ellipse(x, y, 60, 36);
}
   if (counter == 3) {
     // Speed of moving "lights".
     frameRate(25+fincrement);
     fill(255);
     ellipse(x, y, 60, 24);
}
   if (counter == 4) {
     // Speed of moving "lights".
     frameRate(25+fincrement);
     fill(255);
     ellipse(x, y, 60, 12);
}
   if (counter >= 5) {
     // Speed of moving "lights".
     frameRate(25+fincrement);
     ellipse(x, y, 60, 60);
     fill(0,0,200);
}
     
   {     
      // Size for the speed.
      textSize(15);
      }    
}

// Counts how many times the mouse have been pressed.
void mousePressed() {
  counter = counter + 1;
}

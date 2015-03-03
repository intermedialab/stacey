

/* built with Studio Sketchpad: 
 *   http://sketchpad.cc
 * 
 * observe the evolution of this sketch: 
 *   http://studio.sketchpad.cc/sp/pad/view/ro.IguyLiqWChx/rev.1
 * 
 * authors: 
 *   Nanna Ingegerd Hansen

 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */ 


//NANNA INGEGERD HANSEN (ning@itu.dk)
//Title: "Processing with a hint of aesthetic"
//Exhibition hand-in.

/*Description 

Complicated processing... a very basic code that illustrates
the (/my) process of processing:
 - Processing runs by itself. 
 - Press the mouse and a little hint of aesthetics appears. 
 - Hold the mouse and the processing runs away. 
 - Let go and it gets easier to follw processing.
 
 Inspired by Examples ->Demos ->Performance ->TextRendering
*/


//Sets the size, the color, and the speed
void setup(){
  size(800, 600, P2D);
  fill(0);
  frameRate(1);
  
}
  
void draw(){    
  background(255);
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    text("PROCESSING", x, y);
    }
   if (frameCount % 10 == 0) println(frameRate);

}


//The text goes faster when you press the mouse
void mousePressed(){
  frameRate(5);
  
  for (int i = 0; i < 100; i++) {
    //Here the color is set to random
    //Which means that a new color will show every mousepress
    fill(random(255), random(255), random(255), random(255));
    float x = random(width);
    float y = random(height);
  text("AESTHETIC", x, y);
  }
}


 //The speed and color returns to normal
void mouseReleased(){
  frameRate(1);
  fill(0);

}

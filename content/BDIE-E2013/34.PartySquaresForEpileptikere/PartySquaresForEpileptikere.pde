/* built with Studio Sketchpad: 
 *   http://sketchpad.cc
 * 
 * observe the evolution of this sketch: 
 *   http://studio.sketchpad.cc/sp/pad/view/ro.RbgiRUYj9qu/rev.1
 * 
 * authors: 
 *   Line
 *   Zoe

 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */ 


/* Zoe Zachariassen (zoza@itu.dk) and Line Jensen (lmij@itu.dk)
 * "PartySquaresForEpileptikere"
 * Based on code:
 *   Bouncy Bubbles (Keith Peters, example in Processing)  
 *   Hallo Farbe, P_1_0_01 (Generative Gestaltung)
 *   (http://www.generative-gestaltung.de/P_1_0_01) 
 * 
 * Multiple-object collision.
 *
 * Commentary with *** and references to Charlie, the Unicorn, is what       happens when you become frustrated after spending a lot of time writing nonsense commentary to code that confuses you. In short: We're not really too sure what's going on in those lines.
 */
 
int numRect = 60; // The Number of rects
float spring = 0.01; //***CHARLIE***
float friction = -1.; //*** YOU'RE THE BANANA KING ***
Rect[] rects = new Rect[numRect]; //*** CHARLIE! ***

void setup() {
  size(700, 700); // Size of the window
    noCursor(); //The cursor is invisible when in the window
  for (int i = 0; i < numRect; i++) { //Adding one element?
    rects[i] = new Rect(random(width), random(height), random(30, 70), i, rects); //Adding more
  }
}

void draw() {
  background(0);//The background is put in draw, so the squares isn't drawing as path.
//Now we set it up, so the background color changes when we move the mouse
  colorMode(HSB, 360, 100, 100);
  background(mouseY/2, 100, 100);
  fill(360-mouseY/2, 100, 100);

//As long as (you love me) i, which starts at 0, is smaller than numRect, which in this case is 60, a square will be added.
  for (int i = 0; i < numRect; i++) {
    rects[i].collide();
    rects[i].move();
    rects[i].display();  
  }
}

//Now we will define our class Rect
class Rect{
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Rect[] others;
  Rect(float xin, float yin, float din, int idin, Rect[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  //Here, we define what happens when the squares hit each other.
  void collide() {
    for (int i = id + 1; i < numRect; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  //*** IT'S THE CHOO CHOO SHOE, CHARLIE, THE CHOO CHOO SHOE ***
  void move() {
    x += vx;
    y += vy;
    if (x + diameter/0.5 > width) {
      x = width - diameter/0.5;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/0.5 > height) {
      y = height - diameter/0.5;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  //Now we define the color(s) of the squares, and the size of them
  void display() {
      noStroke();//No surrounding line
   fill(random(255), random(255), 255,80); //Color
    rect(x, y, diameter, diameter); //Size
  }
}

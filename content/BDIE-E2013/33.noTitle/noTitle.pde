/*
I have made the code myself, with the exception of the pdf function.
Its not advanced or anything. It creates a repeating pattern. 
As a child i found patterns, that
could repeat them selves over and over again fascinating.

The simple code is a contrast to my childish struggle to create 
these patterns on paper. It was impossible for me. With the help of a little
code, it is made into a simple taske.

Another reason why i chosed to do this, is the article 
"What is Generative Art" by Philip Galanter. I wish to do 
a journal entry about the inspiration from it, and my thoughts 
about it.
*/

import processing.pdf.*;
import java.util.Calendar;

boolean recordPDF = false; //To make a pdf press s or S

int window = 600; //Size of window
int penSize = 10; // strokesize of pen
int patternAmount = 4; // Amount of squares on each axes. Total amount = patternAmount^2
int patternSize = window/patternAmount; // Sets the size of the squares


void setup() {
  size(600, 600); 
  fill(255, 0, 0);
  background(255);
}

// changing the color of the pen
// r = red
// b = blue
// g = green
void palette() {
  noStroke();
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      fill(255, 0, 0);
    }
    if (key == 'g' || key ==  'G') {
      fill(0, 255, 0);
    }
    if (key == 'b' || key ==  'B') {
      fill(0, 0, 255);
    }
  }
}

// The pen drawing
void pen() {
  if (mousePressed) {
    for (int i = - window; i < window; i = i+patternSize) {
      for (int j = - window; j < window; j = j+patternSize) {
        ellipse(mouseX+i, mouseY + j, penSize, penSize);
      }
    }
  }
}

void reset(){
  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      background(255);
    }
  }
}


void draw() {
  
  palette();
  pen();
  reset();

}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}




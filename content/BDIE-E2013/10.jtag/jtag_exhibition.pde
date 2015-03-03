// DDAE Assignment "Exhibition" by Johann Tau Gundersen, jtag@itu.dk

// Credits
// This assignment is based on mechanisms programmed by Ole Kristensen
// , olek@itu.dk, during lectures in the course "Digital Aesthetics"
// as well as the introductory tutorials to 3D in Processing by Joseph Boston,
// contact@jaboston.com, found on http://www.jaboston.com/subject/ptutorials/.

// Notes
// I am definitely not a "code-native" student, so I have attempted to merely
// alter some of the work from the lectures and combine it with a basic 3D shape.
// While I have definitely stolen almost all the functionality, I have typed
// everything in from scratch and experimented with how different parameters
// affected eachother (changes in size, color, position and how they relate).

import processing.opengl.*; // Importing the Open GL library

// Defining variables
int i = 150; // Stores the cube size so that it can be changed in relation to the mouse position.
int oldMouseX = 0; // Stores the mouse position on the x-axis
int oldMouseY = 0; // Stores the mouse position on the y-axis

// The setup. I chose no stroke for the cube because I thought the 3D-effect worked better that way.
// The cursor was slightly annoying, so I removed that as well. When drawing 3D-shapes, I need to
// initiate the Open GL library in the screen, sort of like a third dimension after the width and height.
void setup() {
  noStroke();
  noCursor();
  size(800, 800, OPENGL);
}

// The actual drawing of stuff.
void draw() {
  
  // This is the first of the if-statements I stole from the class. This one checks if the mouse position
  // has changed, and if it has not, it shrinks the cube, exactly like the circle from the class example.
  if(mouseX == oldMouseX && mouseY == oldMouseY && i > 10){
  i = i-1;
  }

  // Checks if mouse position has changed, and if it has, it increases the size of the cube up to a
  // maximum of 250 (the last condition in the if statement).
  if(mouseX != oldMouseX && mouseY != oldMouseY && i < 250){
  i = i+1;
  }

  // Drawing the actual cube
  if(mouseX > 0 && mouseY > 0){
    background(i); // Background relates to the size of the cube
    lights(); // Makes it look cool. There are also other types of light supported. I preferred this.
    fill(360-mouseX/2, 360-mouseY/2, 0, 127); // Color of cube
    translate(mouseX, mouseY); // Cube position relation to mouse position
    rotateX(mouseX*0.01); // Rotates the cube on the x-axis
    rotateY(mouseY*0.01); // Rotates the cube on the y-axis
    box(i); // One parameter fits all! The box color changes with i.

    // In his tutorials, Joseph Boston uses the concept of a matrix stack, but since I had trouble
    // fully understanding the concept, and it worked fine without the use of pushMatrix(); and
    // popMatrix(); I chose to proceed without it..

    // The if-condition from the lectures that did something when the circle size exceeded 200
    // was also a cool mechanism, but I couldn't find a creative/inspiring use for it, so I left it out.

  }

oldMouseX = mouseX; // Writes mouse position to oldMouseX
oldMouseY = mouseY; // Writes mouse position to oldMouseY

}

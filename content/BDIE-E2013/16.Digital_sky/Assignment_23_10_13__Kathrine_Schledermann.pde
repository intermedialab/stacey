//Kathrine Schledermann (kmas@itu.dk)

//"Digital sky"

// I found an example and mixed it with different ideas from websites/examples. I'm not comepletely sure what is going on in every piece of code
// "Randomly placed, randomly colored ellipses that fade out over time" (Craig Kapp, Sample Processing Code) (http://python2011.globalblogs.org/2011/11/21/sample-processing-code/)
// "STAR" (Vanessa Wang) (http://openprocessing.org/sketch/8175)
//"Change cursor in processing" (Sérgio Passos Jr.) (http://stackoverflow.com/questions/12539840/change-mouse-cursor-in-processing)
// "Image or animation to follow mouse" (lilmynx and Chrisir) (http://forum.processing.org/one/topic/image-or-animation-to-follow-mouse.html

/***********************************************/
//pressing right and left mousebutton changes the backgroundcolor

//varibles
float x = 10;
float y = 10;
float angle1 = 0.0;
float segLength = 10;

PImage mouseCursor; 

// setup - runs one time

void setup(){
  
  size (600,600); // set a stage size of 600 x 600 pixels
  
  smooth(); // smooth all drawing
  
  mouseCursor = loadImage("Moon.png"); //loads the image "moon.png" and saves it as mouseCursor, which I'll use to change the cursor 
}
  
// draw - runs once a frame
void draw() {
  cursor(mouseCursor,20,20); // changes the cursor to a image instead of an arrow
  
  fill(50,50,50,10); // fill all shapes with a gray color with a very low opacity

  rect(0,0,width,height); // draw a rectangle that fills the whole screen, kind of the starting backgound
  
  fill(random(0,255), random(0,255), random(0,255)); // fill all shapes with a random color from this point forward
   
  
  
//STAR
  int xpos = int(random(width)); //random position x of the star
  int ypos = int(random(height));//random position y of the star
  float scalefactor = mouseX/100;//determine the size of the stars - when moving the mouse back and forth on the x-axis the stars become smaller and bigger depending on the position of the mouse
   
  fill(mouseX/600.0*random(255),mouseY/600.0*random(255),mouseX/600.0*random(255));//fill random color according to the mouse position
  drawStar(xpos,ypos,scalefactor);//draw the star using the xpos and ypos and the scalefactor
  }

//STAR  
void drawStar(float posx, float posy,float scalefactor){//the function used to draw star
   
     noStroke(); //It is used for the shapes/stars. When there is no stroke it lookslike a star but with the stroke it divide the star into two shapes
     
     //The shape of the star 
     quad(posx,posy,posx-8*scalefactor,posy+21*scalefactor,posx,posy+14*scalefactor,posx+8*scalefactor,posy+21*scalefactor); 
     //drawing a quad used to make up a star according to the given start posx and posy
     triangle(posx,posy+14*scalefactor,posx-14*scalefactor,posy+7*scalefactor,posx+14*scalefactor,posy+7*scalefactor); 
     //drawing a triangle to make up the rest of the star according to the given start point posx and posy    
   
//THE MOON FOLLOWING THE MOUSE
      float dx = mouseX - x;
      float dy = mouseY - y;
      angle1 = atan2(dy, dx);
      x = mouseX - (cos(angle1) * segLength);
      y = mouseY - (sin(angle1) * segLength);
      segment(x, y, angle1);
      //ellipse(x, y, 20, 20);     
}
//THE MOON FOLLOWING THE MOUSE
void segment(float x, float y, float a) {
      pushMatrix();
      translate(x, y);
      rotate(a);
      image(mouseCursor, 10, 10, 30, 30); // the size of the following moon
      //line(0, 0, segLength, 0);
      popMatrix();
    }
  
//When mouse pressed
void mousePressed() {
  if (mouseButton == LEFT){ 
    colorMode(HSB,100.50);
    //when you press the mousebutton 'left' the backgorund become lightblue
  }
 
  if (mouseButton == RIGHT){ 
     colorMode(HSB,65,75,75);
     //when you press the mousebutton 'right' the background becomes purple
  }
}



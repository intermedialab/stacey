/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/30.staring_frog/frog.jpg"; */
/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/30.staring_frog/fly.jpg"; */

/**--STARING FROG--**
TERESE BRANDSTRUP THOMSEN (tbth@itu.dk)

---Description---
The frogs eyes follow the cursor
The cursor is also followed by a fly (actually the cursor is the fly itself)
When you click the mouse, the frog send out his tongue to eat the fly

The eyes are an inspiration from one of the Processing examples called "Arctangent" 
  from the folder "Basics" -> "Math"

*/

PImage img, img2;
//img is "frog.jpg"
//img2 is "fly.png"

Eye e1, e2;

void setup(){
  size (337, 450); //size of the frame/sketch window (fits to the image size of the frog)
  img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/30.staring_frog/frog.jpg"); //image loading as background
  image (img, 0, 0); //(display image, x-coordinate, y-coordinate)
  stroke(0); //stroke set to black
  e1 = new Eye(208, 180, 45); //(x-position, y-position, size) 
                                //I used photoshop to figure out the eyes position in pixels
  e2 = new Eye(88, 176, 45); //(x-position, y-position, size)
                
  img2 = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/30.staring_frog/fly.png"); //Loading a picture of a fly (will be used later in draw)
                                //when the picture is loaded in setup it will be ready to use
                                  //the rest of the running program
}  

void draw(){
 image (img, 0, 0); //The image of the frog has to be loaded again and again, else the fly-image
                       //will be paint over by the frog and there will appear many pictures of flies
                          // instead of one) thats why it's in "void draw()"
 noCursor(); //don't want a cusor because the fly-image is used for that
  
  if(!mousePressed){ //the fly is only there when the mouse isn't pressed
    image(img2, mouseX-20, mouseY-20, 40, 40); //the fly is drawn below the mouse
  }
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  
  stroke(0); //set stroke back to black, else the eyes turn pink when mouse is pressed
  strokeWeight(2); //the eyes' outline don't have to be as large as the tongue (which code I set below to 10)
  
  e1.display(); 
  e2.display();
  
  if (mousePressed){
    stroke(224, 127, 127); //set the tongue to pint (stroke is used instead of fill() because its a line
                              //fill is a fill color (DK: udfyldningsfarve) and a line can't be filled
                                //insted we need to use stroke which is the outline (DK: omrids) of a line
    strokeWeight(10); //set the stroke weight of the tongue
    line(146, 225, mouseX, mouseY); //set the line to start at x-pixel, and y-pixel
  }                                   //and to the x and y position of the mouse
  
}  

class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
}

  void update(int mx, int my){
    angle = atan2(my-y, mx-x); //the atan2() function computes the angle from each eye to the cursor
  }  

  void display(){
    pushMatrix();
    translate(x, y);
    fill(255); //the eye ball is White
    ellipse(0, 0, size, size); //drawing the white ellipse/circle
    rotate(angle); //tell to rotate the eyes (black ellipses) depending on the mouse/fly's posistion
    fill(0, 0, 0); //the colour of the eye (black)
    ellipse(size/4, 0, size/2, size/2); //drawing the black ellipse/circle
    popMatrix();
  }  
 
}


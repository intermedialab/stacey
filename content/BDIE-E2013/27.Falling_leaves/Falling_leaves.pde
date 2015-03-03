/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/27.Falling_leaves/Tree.png"; */
//Tree loasing leaves

PImage tree;

int leaves = 0;  // here is a variable whole number called 'leaves'
int leafMax = 400; // here is a variable whole number for the maximum number of leaves. It starts at 200.

void setup () { //run once
  background(#FFFFFF); //set the backgrund to white
  size(710, 750); //set the screensize 
  smooth(); // smooth the lines
  noStroke(); 
  tree = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/27.Falling_leaves/Tree.png"); //load image
  image(tree, 80, 50, 550, 650); //set image size and placement
}

void draw () { // run repeatedly
  fill(random(150,250),random(150, 250),random(150,250),120);// set the fill to light colors, and a bit transparent
  
  if (leaves < leafMax) { // if there are fewer than the maximum number of leaves, run the following code
 
    float cx = 300 + random(-150,255); // here's a variable that is within a range from 150 to 255
    float cy = 300 + random(-200,135); // here's a variable that is within a range from 200 to 135
 
    translate(cx,cy); // move the position of the drawing as far as cx across and cy down
    rotate(random(TWO_PI)); // rotate the drawing in a random direction
    scale(random(0.2,0.8)); // scale the drawing to an extent between 20% and 80%
    drawLeaves(); // draw leaves
    leaves++; // add one to the leaf count
  }
}

void drawLeaves(){ // draw a leaf as follows
 
  float pointShift = random(-20,20); // variable between -20 and 20
  beginShape(); // start to draw a shape
  vertex(20, 45); // begin at this point x, y
  // bezierVertex(30,30,60,40,70 + random(-20,20),50); // moving only the pointy point meant that sometimes the leaf shape would turn into a heart shape, because the control points were not also moving. So I created a variable called pointShift
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); // make the pointy end of the leaf vary on the x axis (so the leaf gets longer or shorter) AND vary the y axis of the control points by the same amount. It should be possible to have 'normal' leaves, very short fat ones and very long thin ones.
    bezierVertex(60 + pointShift,55, 30,65, 20,45); // draw the other half of the shape
  endShape();

}



void keyPressed(){ // when key pressed, run the following code
  
    //reset the placement of the leaves
}

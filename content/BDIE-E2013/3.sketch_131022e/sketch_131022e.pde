
PImage img; //in order to get the picture
int value = 0; //defining value for mouseMoved

void setup(){
  size(1024,540); //window size
  img = loadImage("/content/BDIE-E2013/3.sketch_131022e/cat.jpg"); //loading the image
}

void draw()
{colorMode(HSB, 360, 260, 300); //set the background color
  rectMode(CENTER); 
  noStroke(); 
  background(mouseY/3, 50, 360); //background color changes when mous moves
  beginShape(TRIANGLES); //creating two  static triangles 
  ellipse(mouseX,mouseY,40,40); //creating dynamic circle
vertex(270, 375);
vertex(360, 140);
vertex(450, 375);
vertex(540, 140);
vertex(630, 375);
vertex(720, 140);
endShape();
fill(value); 
}

void mouseMoved() { //when the mouse moves, the color of the triangles and circle will change
  value = value + 3;
  if (value > 250) {
    value = 0;
  }
}

void mouseDragged(){ //when the mouse is dragged, the picture will appear
  image(img,0,0);
}



  

  


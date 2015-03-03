// DYNAMIC PROGRAM EXAMPLE

// a variable:
int CircleSize = 100;
int shapedefiner = 1;
float color1 = (int) random(0,255); 
float color2 = (int) random(0,255); 
float color3= (int) random(0,255); 
                          
// we need space to remember where the mouse was
int oldMouseX = 0;
int oldMouseY = 0;

void mouseClicked(){
  if(shapedefiner == 0){shapedefiner = 1;}
  else{shapedefiner=0;}
}

// SETUP RUNS ONLY ONCE
void setup(){
  // Let's make a window that fills quarter of the display: 
  size(800,600);
  
  
} 

// DRAW RUNS IDENFINITELY
void draw(){

  if(mousePressed && CircleSize > 10){ 
    // mouse has not changed and the circle needs shrinking
    CircleSize = CircleSize;
  }
  
  else if(mousePressed
    && CircleSize < 200){ 
    // mouse has changed and the circle needs to grow
    CircleSize = CircleSize+1;
                        }
 

if(mousePressed) 
  {
  if (shapedefiner == 1)
    {
    fill ((int) random(0,255),(int) random(0,255),(int) random(0,255));
    ellipse(mouseX, mouseY, CircleSize, CircleSize);
    //shapedefiner = 1;
    }
  else
    {       fill ((int) random(0,255),(int) random(0,255),(int) random(0,255));
    rect(mouseX, mouseY, CircleSize, CircleSize);
    //shapedefiner = 0;
    }
  }
}


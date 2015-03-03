color red = color(255, 0, 0, 10);
color green = color(0, 255, 0, 10);
color blue = color(0, 0, 255, 10);

int counter = 1;

void setup() {
    size(800, 600, P3D);
}

void draw()
{
    
    pushMatrix();
    translate(width/2, height/2);
    rotateX(-PI/6);
    rotateY(radians(frameCount));
    box(100);
    popMatrix();

 if(counter == 1) {
    fill(red);
  }  
  else if(counter == 2) {
    fill(green); 
  }
  else if(counter == 3) {
    fill(blue); 
  }
 }

void mouseReleased() {
 counter++; // increase the counter
 if(counter == 4) {
   counter = 1;  // loop after 3
 }
 println(counter);
} 

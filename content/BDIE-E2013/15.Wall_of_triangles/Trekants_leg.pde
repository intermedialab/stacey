// Title: Wall of triangles
// By: Julie Jegstrup (jstj) og Josephine Rasmussen (jslr)
// Remix of Daniel Shiffman's sketch "ArrayLisClass". URL:
    // https://code.google.com/p/processing/source/browse/trunk/processing/java/examples/Topics/Advanced+Data/ArrayListClass/ArrayListClass.pde?r=10780 


ArrayList<Triangle> tris;

void setup() {
  size(800, 600);
  noStroke();

  tris = new ArrayList<Triangle>();
}

void draw() {
  background(255);
  fill(235);
  rect(0,300,800,300);

  for (int i = tris.size()-1; i >= 0; i--) { 
    Triangle tri = tris.get(i);
    tri.move();
    tri.display();
    if (tri.finished()) {
      tris.remove(i);
    }
  }
}

void mousePressed() {
  tris.add(new Triangle(mouseX-20, mouseY+10, mouseX, mouseY, mouseX+20, mouseY-30));
}

class Triangle {
  
  float x;
  float y;
  float x2;
  float y2;
  float x3;
  float y3;
  float speed = 0;
  float gravity;
  float w;
  float life = 255;
  
  Triangle(float tempX1, float tempY1, float tempX2, float tempY2, float tempX3, float tempY3) {
    x = tempX1;
    y = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    x3 = tempX3;
    y3 = tempY3;
    gravity = random(0.1,1);
  }
  
    void move() {
    if(y < 300) {
      speed = speed + gravity;
      y = y + speed;
      y2 = y3 + speed;
    }
    
    if(y >= 300) {  
      speed = speed - gravity;
      y = y + speed;
      y2 = y3 + speed;
    }
    
    if (y == 300) {
      // Dampening
      speed = speed * -0.8;
      y = 300;
    }
  }
  
  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    fill(HSB, x, y, life);
    triangle(x, y, x2, y2, x3, y3);
  }
}  

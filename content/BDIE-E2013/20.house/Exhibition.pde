/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/20.house/house.jpg"; */
// EXHIBITION
// mnop@itu.dk

PImage img;

void setup() {
  size(527, 790);
  frameRate(30);
  img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/20.house/house.jpg");
  img.loadPixels();
  loadPixels();
}

void draw() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      
      int loc = x + y*img.width;
      
      float r,g,b;
      r = red (img.pixels[loc]);
      
      float maxdist = 50;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      
      r = constrain(r, 0, 255);
      
      color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}

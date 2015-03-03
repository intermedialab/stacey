/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/46.thriller/KT.png, http://intermedia.itu.dk/content/BDIE-E2013/46.thriller/gammelmichael.png, http://intermedia.itu.dk/content/BDIE-E2013/46.thriller/ungmichael.png"; */

// THRILLER

//Skitsen er udarbejdet som et remix af denne kode:
//http://forum.processing.org/one/topic/erasing-effect-from-one-image-to-another.html

// Vi har problemer med vores cursor der hakker, når den tegner og forsvinder når
// den ikke tegner. 

public static int SQUARE_WIDTH = 30;
public static int SQUARE_HEIGHT = 30;
PImage img1, img2;
PImage mouseCursor;


void setup() {
  size(990, 990);
  frameRate(60);
  img1 = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/46.thriller/ungmichael.png");
  img2 = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/46.thriller/gammelmichael.png");
  image(img1, 0, 0, width, height);
  noCursor();
  mouseCursor = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/46.thriller/KT.png");
  cursor(mouseCursor);
}

void draw() {

  if (mousePressed) {
    copy(img2, 
    constrain(mouseX-SQUARE_WIDTH/2, 0, width), 
    constrain(mouseY-SQUARE_HEIGHT/2, 0, height), 
    SQUARE_WIDTH, SQUARE_HEIGHT, 
    constrain(mouseX-SQUARE_WIDTH/2, 0, width), 
    constrain(mouseY-SQUARE_HEIGHT/2, 0, height), 
    SQUARE_WIDTH, SQUARE_HEIGHT);
  }
}


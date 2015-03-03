// Remix af Benjamin Legarth

// Original:
// P_4_3_2_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//

/**
 * pixel mapping. each pixel is translated into a new element (letter)
 * 
 * KEYS
 * 1                 : toogle font size mode (dynamic/static)
 * 2                 : toogle font color mode (color/b&w)
 * arrow up/down     : maximal fontsize +/-
 * arrow right/left  : minimal fontsize +/-
 * s                 : save png
 * p                 : save pdf
  */

// dette er en "tribute" til Ernest Hemingway og hans bog "A Farewell to arms" eller "Farvel til Våbnene" fra 1929
// Den indeholder en blanding af tekst og billede; for mig var det heri interessant at se hvordan billedets effekt blev mindsket, når teksten blev gjort tydeligere og vice versa. Tjek det ud!
import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;
// Inputtet er et citat fra Hemingways "Farvel til Våbnene". Det omhandler hovedpersonen, der ligger i sengen med sin forlovede og filosoferer. 
String inputText = "That night at the hotel, in our room with the long empty hall outside and our shoes outside the door, a thick carpet on the floor of the room, outside the windows the rain falling and in the room light and pleasant and cheerful, then the light out and it exciting with smooth sheets and the bed comfortable, feeling that we had come home, feeling no longer alone, waking in the night to find the other one there, and not gone away; all other things were unreal. We slept when we were tired and if we woke the other one woke too so one was not alone. Often a man wishes to be alone and a girl wishes to be alone too and if they love each other they are jealous of that in each other, but I can truly say we never felt that. We could feel alone when we were together, alone against the others ... But we were never lonely and never afraid when we were together. I know that the night is not the same as the day: that all things are different, that the things of the night cannot be explained in the day, because they do not then exist, and the night can be a dreadful time for lonely people once their loneliness has started. But with Catherine there was almost no difference in the night except that it was an even better time. If people bring so much courage to the world the world has to kill them to break them, so of course it kills them. The world breaks every one and afterward many are strong at the broken places. But those that will not break it kills. It kills the very good and the very gentle and the very brave impartially. If you are none of these you can be sure it will kill you too but there will be no special hurry.";
float fontSizeMax = 20;
float fontSizeMin = 10;
float spacing = 12; // Det hele er rimeligt tæt på originalen. Dog viste det sig, at den nye skrifttype ikke krævede helt så meget spacing og kerning
float kerning = 0; // between letters -
boolean fontSizeStatic = false;
boolean blackAndWhite = false;
float x = 0, y = 10;
int counter = 0;


PFont font;
PImage img;

void setup() {
  size(533,769);
  smooth(); 
  frameRate(30);
  font = createFont("VintageTypewriter Corona.ttf",8); // Dette er den originale Corona-skrifttype taget fra Hemmingways skrivemaskine!
  // Egentlig ville jeg gerne have at billedet skulle gøres klarere i takt med at teksten kom frem, men jeg kan ikke se hvordan man løbende ændrer tinten uden at lave et nyt billede hver gang.
  img = loadImage("Hemingway2.png");
  println(img.width+" x "+img.height);
  background(255);
  tint(255, 8);
  image(img,0,0);

  
}


void draw() {
  
  //if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  if (y<=768){  // draw-loopet stopper når y>billedets højde
  
    //img = loadImage("Hemingway2.png"); DET HAVDE VÆRET PISSEFEDT AT FÅ BILLEDET AF HEMMINGWAY TIL AT FADE IND, MEN SÅ SKAL BILLEDET LOADES I HVER ITERATION
    //tint(255, tint);
    //image(img,0,0);
    //tint+=1;

  textAlign(LEFT);
  //textAlign(LEFT,CENTER); //// Ser også fedt ud, men det bliver mere Blair Witch, og mindre skrivemaskine

///  float x = 0, y = 10;
///  int counter = 0;

// while (y < height) {
    // translate position (display) to position (image)
    int imgX = (int) map(x, 0,width, 0,img.width);
    int imgY = (int) map(y, 0,height, 0,img.height);
    // get current color
    color c = img.pixels[imgY*img.width+imgX];
    int greyscale = round(red(c)*0.222 + green(c)*0.707 + blue(c)*0.071);

    pushMatrix(); // Ved ikke helt hvad denne gør... Men har valgt at lade den blive fra originalen :)
    translate(x, y);

    if (fontSizeStatic) {
      textFont(font, fontSizeMax);
      if (blackAndWhite) fill(greyscale);
      else fill(c);
    } 
    else {
      // greyscale to fontsize
      float fontSize = map(greyscale, 0,255, fontSizeMax,fontSizeMin);
      fontSize = max(fontSize, 1);
      textFont(font, fontSize);
      if (blackAndWhite) fill(0);
      else fill(c);
    } 

    char letter = inputText.charAt(counter);
    text(letter, 0, 0);
    float letterWidth = textWidth(letter) + kerning;
    // for the next letter ... x + letter width
    x = x + letterWidth; // update x-coordinate
    popMatrix();

    // linebreaks
    if (x+letterWidth >= width) {
      x = 0;
      y = y + spacing; // add line height
    }

    counter++;
    if (counter > inputText.length()-1) counter = 0;
      
 
  }

  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
  // change render mode
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color stlye
  if (key == '2') blackAndWhite = !blackAndWhite;
  println("fontSizeMin: "+fontSizeMin+"  fontSizeMax: "+fontSizeMax+"   fontSizeStatic: "+fontSizeStatic+"   blackAndWhite: "+blackAndWhite);
}

void keyPressed() {
  // change fontSizeMax with arrowkeys up/down 
  if (keyCode == UP) fontSizeMax += 2; spacing +=5;
  if (keyCode == DOWN) fontSizeMax -= 2; spacing -=5;
  // change fontSizeMin with arrowkeys left/right
  if (keyCode == RIGHT) fontSizeMin += 2;
  if (keyCode == LEFT) fontSizeMin -= 2; 

  //fontSizeMin = max(fontSizeMin, 2);
  //fontSizeMax = max(fontSizeMax, 2);
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}































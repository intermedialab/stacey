//Signe Alstrup Bek
//sabe@itu.dk

// P_4_3_2_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// http://www.generative-gestaltung.de
// * pixel mapping. each pixel is translated into a new element (letter)

// I tried to do a paraphrase; I combined a sketch by Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni - with one of my own hand drawn croquis sketches of a woman sitting. I tried to unite a digital piece with a analogue one - to implement them in one another; and engage the expression in both works. Focus is on the relationship between the digital and analogue sketch. Is it possible to unite the pieces and forms and gain some kind of dynamic relationship.
// The original sketch was interactive - you could change the size of the letters and the spacing. To embrace the variability / the unpredictable - some of the variables are generated in randomly.
// The words are a poem by Michael Strunge.
/* 
 * KEYS
 * 1                 : toogle font size mode (dynamic/static)
 * 2                 : toogle font color mode (color/b&w)
 * arrow up/down     : maximal fontsize +/-
 * arrow right/left  : minimal fontsize +/-
 * s                 : save png
 * p                 : save pdf
 */



import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

String inputText = "Når vi sover er vore hjerter to fugle ude i mørket og byen Mellem husene finder de vej og har alle tider hele himlen De når vidt på sekunder breder vingerne ud og omspænder byen strejfer som lydløse lyn langt herfra med fjerenes yderste sansning af ilt skovene havet menneskenes hjerner spændte med afspændte drømme Derfor drømmer vi dit smil ved besked dine øjenlågs årer dine lyde af søvnsyn ssshh ssshh dit hjerte en fugl derude i mørket en lyd i mørket herinde Din hud er så hvid og igen kan jeg føle denne lykkelige angst for at dø";
float fontSizeMax = 8;
float fontSizeMin = 4;
float spacing = 5; // line height
float kerning = 0.3; // between letters

boolean fontSizeStatic = false;
boolean blackAndWhite = false;

PFont font;
PImage img;

void setup() {
  size(733,969);
  smooth(); 
  
  font = createFont("Helvetica",10);
  
  img = loadImage("Croquis.png");
  //println(img.width+" x "+img.height);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  
  fontSizeMax = random(1,12);
  kerning = random(0.3,1);
  spacing = random(5,10);

  //background(random(220,250));
   background(200);
  textAlign(CENTER);

  float x = 0, y = 10;
  int counter = 0;

  while (y < height) {
    // translate position (display) to position (image)
    int imgX = (int) map(x, 0,width, 0,img.width);
    int imgY = (int) map(y, 0,height, 0,img.height);
    // get current color
    color c = img.pixels[imgY*img.width+imgX];
    int greyscale = round(red(c)*0.222 + green(c)*0.707 + blue(c)*0.071);

    pushMatrix();
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

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

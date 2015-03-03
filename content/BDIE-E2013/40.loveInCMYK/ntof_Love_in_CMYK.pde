// LOVE IN CMYK
// nadja toft - ntof@itu.dk

// DESCRIPTION
// Paint your own love story in black or white and/or CMYK colors
// Inspired by a mix of songs, that also creates the rules of the artwork
// Feist' song '1,2,3,4 (tell me that you love me more)' = You can choose different brush sizes by pressing the number keys (a love that grows)
// James Blake/Feist' song 'Limit to your love' = You can choose colors, but are limited to CMYK colors (press CMYK keys to choose)
// Look, I found her red coat is a phrase that James Blake sampled from Kelis' song in his track 'CMYK'. Finding the other womans red coat means leaving
//  ..in processing, it means stepping outside the frame in which you are allowed to paint. You have to pick a number and color to continue.
// K (keycolor / black) lets you erase your painting
// The mirror effect of the brush is supposed to illustrate two people in love
// The artwork is meant to make you interpret, play around, create and learn by doing

  
  // Defining CMYK colors
  
  int cyan = color(0,158,224);
  int magenta = color(226,0,122);
  int yellow = color(255,237,0);
  int keycolor = color(26,23,27);
  int white = color(255,255,255);
  
  int brush = 0;
  boolean start = false;
 

void setup(){ // creates a scope
  // runs only once
  
  cursor(CROSS);
  background(keycolor);
  size(1000,700);
  noStroke();
  fill(magenta);
  text("1, 2, 3, 4, tell me that you love me more [always choose a size by pressing a number]", 20, 30);    // Feist '1234'. Choose a number, choose a brush.
  fill(cyan);
  text("There's a limit to your love [change color on CMYK keys]", 20, 50);         // James Blake & Feist 'Limit to your love'. You are limited by a selection of colors.
  fill(yellow);
  text("Look, I found her red coat [if you leave, you have to start from the top]", 20, 70);                    // James Blake 'CMYK' sample of Kelis 'Caught Out There'
  
} // ends scope



void keyReleased()                                // keyboard commands for painting with color and brush sizes
{
  if (key=='c')
  {
    fill(cyan,40);
  }
  if(key=='m')
  {
    fill(magenta,40);
  }
  if (key=='y')
  {
    fill(yellow,40);
  }
  if (key=='k')
  {
    fill(keycolor,90);                            // eraser, erases what you've drawn
    brush = 50;
  }
  if (key=='w')
  {
    fill(white,40);
  }
  if (key=='1')
  {
    brush = 5;
  }
  if (key=='2')
  {
    brush = 10;
  }
  if (key=='3')
  {
    brush = 20;
  }
  if ((key=='4') || (key=='5') || (key=='6') || (key=='7') || (key=='8') || (key=='9') || (key=='0'))
  {
    brush = 30;
  }
}





void draw(){                                                   // draw runs infinetely
 
 
  if((start == false) && (keyPressed == true)){                // program begins by pressing a key  
    start = true;
    textSize(32);
    fill(white);
    text("CMYK", 440, 660);                                    // title 'CMYK' appears in white
    fill(white,40);                                            // the brush is white until you choose a color
  }

    translate(500,500);
    smooth();                                                  // creates the brush (ellipse) and the mirror effect
    ellipse(mouseX-500,mouseY-500,brush,brush);
    ellipse(-mouseX+500,mouseY-500,brush,brush);

  
  
  if((mouseY < 600) && (mouseY > 100) && (mouseX < 700) && (mouseX > 100) && (start == true)){      // makes the brush stay inside the frame
    start = true;
  }
  else {
    brush = 0;
  }
  
   
}





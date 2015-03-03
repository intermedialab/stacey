/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/44.shapeAndColorToo/kat.jpg"; */

// Ea Lundbjerg Hansen, shape (and color too) sketch // eluh@itu.dk

//this is not entirely done as I wished to create psychedelic cat heads whenever mouse is pressed, but as I am currently hit bad by the flu, my head couldn't really focus on doing it sadly. 
// I will, however, make it work once I'm fresh again, but as the duedate was today, I had to hand it in before it was done

color c1= color(102, 255, 153, 10); // (x, x, x, x) = 1st=red, 2nd=green, 3rd=blue, 4th = transparency / see through 
color c2= color(0, 255, 255, 10); // RGB colors = red, green, blue. Set the value, and the colours will mix like with paint
color c3= color(255, 102, 255, 10); // I feel like I got a pretty good idea of how to make the colours like I want them.
color c4= color(153, 153, 255, 10); // I used hex-codes in the beginning, but this works much better
PImage cat;

int counter = 1; //click of the mouse.. When counter = 2 or 3 the colour is different. 
// int MycircleSize = 10;

void setup() { // { alt+shift+(
  // runs only once
  size(800, 600); // } alt+shift+)
  background(255); //background is now white
  cat = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/44.shapeAndColorToo/kat.jpg");
      image(cat, 0, 0, width, height);
}


void draw() { //like void loop, this goes on indefinitely

  noStroke();
  quad(mouseX, mouseY, 216, 18, 216, 360, 144, 360); // sets angles/degrees 
  quad(mouseY, mouseX, 216, 18, 216, 360, 144, 360);

  if (counter == 1) { //starting color
    fill(c1);
  }

  else if (counter == 2) { //if mouse is clicked, color changes
    fill(c2);
  }
  else if (counter ==3) { //again, if mouse is clicked color changes again
    fill(c3);
  }
  else if (counter ==4) { //again, if mouse is clicked color changes again
    fill(c4);
    
  }
  
   if (mousePressed == true) { //if mouse is clicked
  quad(mouseX, mouseY, 416, 418, 416, 360, 344, 460); //different degrees/angles.. This is where it gets hard. 
  quad(mouseY, mouseX, 416, 418, 416, 360, 344, 460); // I need to work some more with shapes, as it's really hard to know whats sizing, angles, etcetera. 
  triangle(288, 18, 351, 360, 288, 360); // I would like to make these triangles turn up in 'random' colors
  triangle(288, 18, 351, 360, 288, 360); // and not the same colors as used when the mouse is NOT clicked.
  triangle(288, 18, 351, 360, 288, 360); // I would like to change the transparency as well, but not 100% sure how
  }
}
  // I'm working on adding stars when 'mousePressed' in random colours, but its proving to be more difficult than what i thought. 
  // This is what I got so far! 

void mouseReleased() { 
  counter++; 
  if (counter == 5) { //when counter == 5 clicks (meaning when the mouse has been clicked 4 times
    counter = 1; // it start over to the first color again. 4 colors = 4 clicks and then == 5th start over
  }
  println(counter);
}


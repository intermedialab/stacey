// A PIXELATED SELF

// You don't look exact alike in the morning and in the evening. 
// Take a look in the mirror and see how you look in different lightning. 
// A self-portrait will be created depending on the light intensity in the room.

// N.B. this sketch requires a webcam. 
// Probably a MacBook or another laptop with a webcam build-in is required too.

// Credits:
//   Pierre Rossel - videoplugin

// Processing sketch by Mads Fors & Toke Fritzemeier

import processing.video.*; // Use video library

Capture video; // Define variable to store video in
int captureW = 640; // Display width
int captureH = 480; // Display height

void setup()
{
  rectMode(CENTER); // Draw rectangles from the center rather than from (left,top)
  colorMode(HSB,255); // Use HSB color mode to easily find brightness
  size(captureW, captureH); // Set sketch dimensions
  video = new Capture(this, captureW, captureH); // Instantiate capturing
  video.start(); // Start video stream
}

void draw()
{
  if (video.available()) { // If available, then...
    video.read(); // ... read webcam stream
  }
  set(0,0,video); // Display webcam image at (0,0)
  
  loadPixels(); // Load pixels from webcam image in order to perform color picking
  for(int i=0;i<=633;i=i+7){ // Loop over image width
    for(int j=0;j<=473;j=j+7){ // Loop over image height
      stroke(get(i,j),random(200,255)); // Set stroke color to image color at (i,j), set opacity randomly between 200-255
      strokeWeight(random(8,18)); // Set stroke thickness randomly between 8-18
      fill(get(i,j),random(200,255)); // Set fill color to image color at (i,j), set opacity randomly between 200-255
      float bright = brightness(get(i,j)); // Get color brightness at (i,j)
      if(bright <= 85){ // If brightness is between 0-85...
        line(i,j,i+random(-10,10),j+random(-10,10)); // ... then draw a line at (i,j) with a random length
      } else if(bright > 85 && bright <= 170){ // Else if brightness is between 85 and 170...
        rect(i,j,random(7,13),random(7,13)); // ... then draw a rectangle at (i,j) with a random size
      } else { // Else (if brightness is more than 170...
        ellipse(i,j,random(7,13),random(7,13)); // ... draw an ellipse at (i,j) with a random size
      }
    }
  }
}

// Vi har fundet et sjovt eksempel som vi har arbejdet med. 
// Vi har skiftet billedet, baggrundsfarve, og udvalgt en af manipulations-mulighederne.
// Vi har ryddet op i de resterende funktioner, så det kun er det udvalgte der skulle være tilbage. 
// Lavet af: Etienne (etol) & Johannes (jkaa)

// P_4_3_1_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.



/**
 * pixel mapping. each pixel is translated into a new element
  
 * MOUSE
 * position x/y        : various parameters (depending on draw mode)
 
 */



PImage img;
int drawMode = 6;


void setup() {
  size(603, 873); //size should be multiple of img width and height
  smooth();
  img = loadImage("lovejuice.jpg");
  println(img.width+" x "+img.height);
}


void draw() {
  background(255, 0, 222);
  float mouseXFactor = map(mouseX, 0,width, 0.05,1);
  float mouseYFactor = map(mouseY, 0,height, 0.05,1);

  for (int gridX = 0; gridX < img.width; gridX++) {
    for (int gridY = 0; gridY < img.height; gridY++) {
      // grid position + tile size
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      // get current color
      color c = img.pixels[gridY*img.width+gridX];
      // greyscale conversion
      int greyscale =round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);

      switch(drawMode) {
      case 6:
        float w6 = map(greyscale, 0,255, 25,0);
        noStroke();
        fill(c);
        ellipse(posX, posY, w6 * mouseXFactor, w6 * mouseXFactor); 
        break;
      
      }

    }
  }



    endRecord();
  }






// timestamp


































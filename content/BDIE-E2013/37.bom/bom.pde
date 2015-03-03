

/* built with Studio Sketchpad: 
 *   http://sketchpad.cc
 * 
 * observe the evolution of this sketch: 
 *   http://studio.sketchpad.cc/sp/pad/view/ro.uTnt9b6cy1R/rev.1986
 * 
 * authors: 
 *   Jakob

 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */ 


// Based on Ole's beautiful OOP circles example, bum. Click the mouse...

// Somehow made by Jakob Pedersen (jhep)

// Preloading of Log Lady faces
/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/37.bom/0.png"; */
/* @pjs preload="http://intermedia.itu.dk/content/BDIE-E2013/37.bom/1.png"; */

class LogLady {
    float posX = 0;
    float posY = 0;
    float speedX = 5;
    float speedY = 5;
    float logLadyWidth = 98;
    float logLadyHeight = 106;
    float randomLogLadyTintRed = 0;
    float randomLogLadyTintGreen = 0;
    float randomLogLadyTintBlue = 0;
  
    // The Log Lady has many faces, these are just two of them.
    PImage img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/37.bom/0.png"); 
    PImage img1 = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/37.bom/1.png");
  
    void move() {
        posX = posX + speedX; // move the position on the xAxis with the set speed
        posY = posY + speedY; // move the position on the xAxis with the set speed

        if (posX > width-(logLadyWidth) || posX < (logLadyWidth)) {
            // You should never ask a Log Lady of her... width, she will try to escape.
            speedX = -speedX;
            //speedX = speedX * 2;
        }

        if (posY > height - (logLadyHeight/2 - 20) || posY < (logLadyHeight/2)) { 
            // Our Log Lady seems to have moved beyond the boundaries of good behaviour, let's reverse her.
            speedY = -speedY;
            speedY = speedY * 1.85;
        }
    
        // Kill the Log Lady slowly
        speedX = speedX*0.99;
        speedY = speedY*0.99;

        // The gravity
        speedY = speedY - 0.09;
        speedX += random(-1., 1.);
    
        // Set color values based on where Log Lady is positioned horisontally on the screen
        if (posX > (width/2)) {
            randomLogLadyTintRed = random(200, 255);
            randomLogLadyTintGreen = 200;
            randomLogLadyTintBlue = random(200,255);
        } else {
            randomLogLadyTintRed = 140;
            randomLogLadyTintGreen = 40;
            randomLogLadyTintBlue = random(0, 200); 
        }
    
        // Function that tints the Log Lady and actually accomplish to make her even more creepy - performance in the browser is not too good.
        tint(randomLogLadyTintRed, randomLogLadyTintGreen, randomLogLadyTintBlue);
    }
  
    void draw(){    
        // Tried to make a PImage(s) array - but could not get it to work on Sketchpad - only worked on my local machine
    
        // This simply determines whether the Log Lady is positioned vertically before or after the center and chooses an preloaded image based on that 
        if (posY > (height/2)) {
            image(img1, posX, posY);   
        } else {
            image(img, posX, posY);
        }
    }
  
}

int numberOfLogLadies = 1;
ArrayList<LogLady> logLadies;

void setup() {  // this is run once.   
    size(640, 480);

    // The array where we will store all of our Log Ladies
    logLadies = new ArrayList<LogLady>();
    
    // This for loop will give birth to a certain number of Log Ladies
    for(int i = 0; i < numberOfLogLadies; i++) {
        logLadies.add(new LogLady());
    }
    
    // Sets some inital values
    for (int i = logLadies.size()-1; i >= 0; i--) { 
        LogLady loglady = logLadies.get(i);
        loglady.posX = random(110, width-110);
        loglady.posY = random(110, height-110);
        loglady.speedX = random(-1, 1);
        loglady.speedY = random(-3, 3);
    }  
} 

void mouseClicked() {
    // Listens for mouse click and adds new Log Lady based on mouse position
    LogLady newLogLady = new LogLady();
    logLadies.add(newLogLady);
    
    newLogLady.posX = mouseX;
    newLogLady.posY = mouseY;
    newLogLady.speedX = random(-1, 1);
    newLogLady.speedY = random(-2, 2);
    
    numberOfLogLadies++;
}

void draw() {
    // Sets a black background, The Log Lady likes them black.
    background(0);
    
    // Loops through the Log Ladies array and moves + draws her accordingly 
    for (int i = logLadies.size()-1; i >= 0; i--) { 
        LogLady logLady = logLadies.get(i);
        logLady.move();
        logLady.draw();
    }  
}

/*
Sketch by Jesper Fogh, jepster.dk

Circle Object inspired by OOP-Circles by Ole K. 

*/

import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer victor;
AudioPlayer soren;
AudioPlayer annie;
AudioPlayer anton;
AudioPlayer track;
AudioInput input;

PImage bg;

PImage right;
int rightX = 479;
int rightY = 213;
boolean moveRight = false;
boolean rightFree = false;
int headCount = 5;
int headOutcount = 5;

PImage center;
PImage top;
PImage top2;

PImage foot;
int footYPos = -794;
boolean footDown = false;

boolean showTop = true;
boolean showCenter = true;
boolean showRight = true;

PImage zeus;
int zeusYPos = 917;

boolean drawCircles = false;
int circlePosY = 42;
int circlePosX = 104;

PImage soldier;
int soldierYpos = 0;
int soldierXpos = 0;
boolean soldierMoving = false;

PImage eden;
PImage leafE;
PImage leafA;
PImage bird;
int birdX;
int alphaStop = 0;
boolean showLeaves = true;
int leafEpos = 406;
int leafApos = 461;
int EleafX = 0;
int AleafX = 0;
float randomEleafX = random(-2,1);
float randomAleafX = random(-1,2);

ArrayList<Circle> circles;

void setup() {
  size(732,917);
  bg = loadImage("bg.png");
  right = loadImage("right.png");
  center = loadImage("center.png");
  top = loadImage("top.png");
  top2 = loadImage("top2.png");
  foot = loadImage("foot.png");
  zeus = loadImage("zeus.png");
  soldier = loadImage("soldier.png");
  eden = loadImage("eden.jpg");
  leafE = loadImage("leafE.png");
  leafA = loadImage("leafA.png");
  bird = loadImage("bird.png");
  birdX = width;
  
  soldierYpos = 400;
  soldierXpos = width;
  soldierMoving = true;
  
    // Create an empty ArrayList (will store Ball objects)
  circles = new ArrayList<Circle>();
  
  // Start by adding one element to the application, and then 99 more
  for(int i = 0; i < 20; i++) {
    circles.add(new Circle());
  }
  
  //Audio minim
  minim = new Minim(this);
  track = minim.loadFile("track.mp3");
  player = minim.loadFile("ohno.mp3");
  victor = minim.loadFile("klammevictor.mp3");
  soren = minim.loadFile("sorenpsychopath.mp3");
  annie = minim.loadFile("annieedison.mp3");
  anton = minim.loadFile("underligeanton.mp3");
  input = minim.getLineIn();
  
}

void draw() {
 background(bg);  
 
 float soldierXeye1 = map(mouseX,0,width,soldierXpos+102,soldierXpos+109);
 float soldierYeye1 = map(mouseY,0,height,soldierYpos+165,soldierYpos+186);
 float soldierXeye2 = map(mouseX,0,width,soldierXpos+109,soldierXpos+115);
 float soldierYeye2 = map(mouseY,0,height,soldierYpos+219,soldierYpos+239);
 fill(255);
 noStroke(); 
 ellipse(soldierXeye1,soldierYeye1,5,5);
 ellipse(soldierXeye2,soldierYeye2,5,5);
    
 image(soldier,soldierXpos,soldierYpos,322,378);
 if(showRight){image(right, rightX, rightY);}
 if(showCenter){image(center, 276, 205);}
 if(showTop){image(top, 196, 106);}
 if(!showTop){image(top2,121,0);}
 image(foot, 150, footYPos);
 
 if(mousePressed){
   if(mouseY > height-200){
     footDown = true;
   }
   if(footDown){
     footYPos = -mouseY;
   }
   
   if(soldierMoving && soldierXpos > width-soldier.width+20){
     soldierXpos-=5;
     soren.play(); 
   }
   
   if(footYPos+foot.height > 106+top.height){
    showTop = false;
   } 
   if(footYPos+foot.height > 205+center.height){
    showCenter = false;
   }
   
   if(mouseX > rightX && mouseX < rightX + right.width){
    if(mouseY > rightY && mouseY < rightY + right.height){
      moveRight = true;
      player.play();
    }
   }
   if(rightFree){
        rightX = mouseX;
        rightY = mouseY;
   }
 }//if MousePressed ends here
 else{
  footYPos-=5;
 }
 
 if(moveRight && rightY < 473){
   rightY += 2.5;
 }
 if(rightY>=473){
    rightFree = true;
 }
 
 boolean zeusTop = false;
 if(rightFree && !showCenter){
   image(zeus,0,zeusYPos);
   if(zeusYPos > height-(zeus.height/2) && !zeusTop){
     zeusYPos -= 2;
     track.play();
   }
   else{
     drawCircles = true;
   }
 }
 if(zeusTop){
   zeusYPos-=2;  
}
 
 if(drawCircles){
   for(int i = 0; i < headCount; i++){
     Circle circle = circles.get(i);
     circle.draw(); 
     circle.move();
   if(circle.outOfscreen){
     headOutcount--;
     circle.outOfscreen = false;
     println(headOutcount);
   }
  }
  zeusTop = true;
 }
 
 if(headOutcount <= 0){
   background(eden);
   image(leafA,124-AleafX,leafApos);
   image(leafE,497-EleafX,leafEpos);
   if(!showLeaves && leafApos < height-100){
      leafApos++;
      AleafX -= int(randomAleafX);
      anton.loop(2);
      victor.loop(2);
   }
   if(!showLeaves && leafEpos < height-60){
      leafEpos++; 
      EleafX -= int(randomEleafX);
      anton.loop(2);
      victor.loop(2);
   }
   
   if(leafEpos >= height-60 || leafApos >= height-100){
      image(bird, birdX, 100); 
      birdX -= 3; 
   }
 }//headOutcount ends
 
 
 if(birdX < 0-bird.width){
  fill(217,144,81,alphaStop);
  rect(0,0,width,height);
  if(alphaStop < 255){
    alphaStop += 5;
    println(alphaStop);
  }
  if(alphaStop >= 255){
   track.shiftVolume(100,0,2000); 
  }
 }
}//DRAW Ends 

void mouseClicked(){
   if(headOutcount <= 0){
     if(mouseX > 124 && mouseX < 124 + leafA.width){
      if(mouseY > leafApos && mouseY < leafApos + leafA.height){
        showLeaves = false;
      }
     }
     else if(mouseX > 497 && mouseX < 497 + leafE.width){
      if(mouseY > leafEpos && mouseY < leafEpos + leafE.height){
        showLeaves = false;
      }
     }
   }
}

void stop() {
  player.close();  
  track.close();
  victor.close();
  annie.close();
  input.close();
  minim.stop();
  
  super.stop();
}

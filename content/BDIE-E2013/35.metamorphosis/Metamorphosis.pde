/* 

 
 --- Metamorphosis ---  
      
      
By Martin, Jonas and Frederik
*/


//First we import the media player, for our song.
import ddf.minim.*;

//We run an instance of the player, also setting the varaibles needed
Minim minim;
AudioPlayer player;
AudioInput input;

//Here we set the int counter for our mouseclicks
float mouseNumb = 0;
//We set the bgImg variable
PImage bgImg;
PImage code;
//And the y variable for our randomizer
float y; 
//The splitter for areas:
float splitter;
float colourNumb = 255;
PImage startImg;
PImage slutImg;
int y2;
float snipMap;

//Our variables for seeing where mouse is when clicked:

int musX = 0;
int musY = 0;

//This is our counter for snippets.
int snipCounter = 0;
float startTime1;


//We run the setup..
void setup(){
 
  //The size is set to 1024x768, the same as our images
  size(1024,768);
  startTime1 = random(0,352000);
int startTime = int(startTime1);
  //We setup the minim player.
  minim = new Minim(this);
  //Set the player variable, choosing which file to use
  player = minim.loadFile("bgsound.mp3");
  //We figure out where our input with the minim library
  input = minim.getLineIn();
  //We ask the player to start playing, as well as looping.
  
  player.play();

  player.loop() ;
   player.cue(startTime);
  
  //We set our first background image.
  float startNumb = random(1,15);
   String startimg;
   startimg = "start/" + int(startNumb) + ".png";
  bgImg = loadImage(startimg);

  splitter = height/3;
  mouseY = height/2;
  
  float slutNumb = random(1,15);
  String slutimg;
  slutimg = "slut/" + int(slutNumb) + ".png";
  slutImg = loadImage(slutimg);
  mouseX = width/2;
  mouseY = height/2;
  
}

//We start the drawing.
void draw(){
  /*
    Here we keep track of snippets.
    This is so we can control that the snippet flow works
    As we want to show start of code in start and end in end
  */
  println(snipMap);
  
  //We set the iitial colour of our "wave equalizer"
  stroke(0,colourNumb,0);
  
  

  //We set the background Image, which is changed with each click
  background(bgImg);
  
  //We check if snipCounter is an even number and not zero: We also make sure it is not the last image being shown
  if ((snipCounter & 1) != 0 && snipCounter != 0 && mouseNumb < 41) {
   //we then show our code snippet
   
   image(code, musX-100, musY-40);
  }
  
  //If the mouse is over the middle, we make it brighter, the further it goes up
  if (mouseY < height/2){
    int mouseOne = mouseY/10+5;
    fill(255, 500/mouseOne);
  }
  //And from the middle down, it because darker, the further it goes down.
  if(mouseY > height/2){
    fill(000, mouseY*0.1);
  }
  /*
  We draw the rectangle, which is filled with the fill from above.
  This gives us an overlay, which makes the brightness effect
  */
  rect(-1,-1, 1025, 769);
  
  //Here we say that if the mouse clicks are 41, which is the last one, then the EQ should flatline
  if (mouseNumb == 41 || mouseNumb > 41){
    stroke(0,40,0);
    strokeWeight(2);
    background(slutImg);
    line(0,height/2,width,height/2);
  }
  //Else we do the normal EQ
  else{
    //We make an for each, starting from zero, up until how big the player buffer is, adding 1 to i, for each time
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      //We set strokeweight to 2
      strokeWeight(2);
      /*
      Here we draw our line, this will make it look like an equalizer, by looking at the values of the player.
      We then multiply it, because we otherwise would be unable to see the lines.
      */
      line(i+1, height/2 + player.left.get(i)*20, i+1, height/2 + player.left.get(i+1)*20);
     }
  }
  
  
}

void mouseClicked(){
    if ((snipCounter & 1) != 0 && mouseNumb < 41){
    if (mouseNumb < 11){

       
       y = random(1,16);
      if(y2 == int(y)){
        y = random(1,16);
         if(y2 == int(y)){
            y = random(1,16);
            if(y2 == int(y)){
              y = random(1,16);
              if(y2 == int(y)){
                y = random(1,16);
                if(y2 == int(y)){
                  y = random(1,16);
                }
              }
            }
          }
      }
      String img;
      img = "life/" + int(y) + ".png";
      bgImg = loadImage(img);
    }
   if (mouseNumb > 10 && mouseNumb < 21){
     
       y = random(1,16);
      if(y2 == int(y)){
        y = random(1,16);
         if(y2 == int(y)){
            y = random(1,16);
            if(y2 == int(y)){
              y = random(1,16);
              if(y2 == int(y)){
                y = random(1,16);
                if(y2 == int(y)){
                  y = random(1,16);
                }
              }
            }
          }
      }
      String img;
      img = "limbolife/" + int(y) + ".png";
      bgImg = loadImage(img);
   }
   if (mouseNumb > 20 && mouseNumb < 31){
     
      y = random(1,16);
      if(y2 == int(y)){
        y = random(1,16);
         if(y2 == int(y)){
            y = random(1,16);
            if(y2 == int(y)){
              y = random(1,16);
              if(y2 == int(y)){
                y = random(1,16);
                if(y2 == int(y)){
                  y = random(1,16);
                }
              }
            }
          }
      }
      String img;
      y2 = int(y);
      img = "half-dead/" + int(y) + ".png";
      bgImg = loadImage(img);
   }
   if (mouseNumb > 30 && mouseNumb < 41){
     
      y = random(1,16);
      String img;
      img = "death/" + int(y) + ".png";
      bgImg = loadImage(img);
   }
    }
      musX = mouseX;
      musY = mouseY;
      
      //We count up on the snippet counter, for making sure its only displayed every second click
      snipCounter++;

     if(mouseY > splitter*2){
        mouseNumb = mouseNumb + 1.5;
        //This number decides what colour the EQ is, we remove som from it each time, to reduce the colour each time a click is made
      colourNumb = colourNumb -7;
        
      }
      if(mouseY > splitter && mouseY < splitter*2)
      {
        mouseNumb = mouseNumb + 1;
        //This number decides what colour the EQ is, we remove som from it each time, to reduce the colour each time a click is made
      colourNumb = colourNumb -5;
      }
      if(mouseY < splitter){
        mouseNumb = mouseNumb + 0.75;
        //This number decides what colour the EQ is, we remove som from it each time, to reduce the colour each time a click is made
      colourNumb = colourNumb -2;
      }
      
      if ((snipCounter & 1) != 0 && snipCounter != 0 && mouseNumb < 41) {
   //we then show our code snippet
   snipMap = map(mouseNumb, 0, 40, 1, 27);
   String img;
    img = "snips/" + int(snipMap) + ".png";
    code = loadImage(img);
  }
   
}
  

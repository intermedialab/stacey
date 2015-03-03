/*
WELCOME TO THE GAME OF: "ECCE HOMO SIMULATOR"
---
Created by Victor Permild (vbpe@itu.dk), 
with a little helping hand from the processing forum.

This is a restoration simulator based on the true events 
of the 2012 "Ecce Homo"/"Ecce Mono" Incident.
The fate of the painting is in your hands!
Are you going to restore it, or are you going to "restore" it?

----
CONTROLS
---
MOUSE (X/Y-axis)      Brush (inactive, unless button 1-3 is pressed)

KEYS
*1                    "Ecce Homo"-as-it-was-in-2012 brush. Imagine the paint is wet.
                      - May also be used as a kind of reset-tool.
*2                    Genuine restoration brush.
*3                    "Restoration"/"Ecce Mono" brush.
  
*"s"                  Screenshot.
---
*///CODE

PImage img1, img2, img3, img4, img5;
import java.util.Calendar;

/*
SETUP:   statements of screensize (size), images uploaded for brushed (img1-3). 
         image for background uploaded (img4), image uploaded for cursor (img5),
         cursor removed as good as possible (noCursor, frameRate, smooth).  
         */ 


void setup (){
  size(450, 686);
  img1 = loadImage("ecce2012.png");
  img2 = loadImage("ecceBefore2012.png");
  img3 = loadImage("ecceAfter2012.png");
  img4 = loadImage("ecce2012background.png");
  img5 = loadImage("paintbrush.png");
  image(img4, 0, 0, width, height);
  noCursor();
  frameRate(120);
  smooth();
}

/*  BRUSHES (1-3): 
    
    Warning: Wall of text! 
    Not necessarily important, only explanatory:

    1) The cursor is made to appear as a paintbrush (cursor + img5).
    
    2) The brushes are based on the copy() command, in which I've programmed my 
    brushes to copy pixels from the different images I've uploaded (img1-3) 
    which are actually full-size equivalents of the different alterations of the 
    preset background. I spent way too long, but succeeded as good as it gonna
    get in aligning the different alterations of the picture, in order to make
    the brushes appear like painting on top of a single canvas.
    
    3) I'm not enterily sure I understand the "constrain"-part of the code for the 
    brushes, as I had some help using them from the internet. I was interested
    in using the copy() command, but couldn't really figure out how. I looked it
    up and the found the constrain() command in some other guy's code. I do however,
    not feel that it's necessary to credit the other code, as it was only an eye-
    opener. I spend some time fiddling with the numbers, and found out the 
    mouseX/mouseY values reduced by 5 (-5), made the brushes match my background.
    I'm not entirely sure why, though I do have an idea.                      
    
    4) I've added some unpredictability via the random()-commands as to exactly where 
    the brushes are to be copied from. This dampens the feeling of absolute, rigid 
    machinery in the copy-process, which I feel resemebles the effect of wet paint
    on the brush.
    
    5) I've tried, and failed, to make the shape of the brushes anything other than
    squares. But hey, it's digital art - If not okay here, then where? 
    */


void draw(){
cursor(img5, 0, 0);


//BRUSH 1: actived by keeping the "1" button held down.  
  if (keyPressed){
  if (key == '1'){

copy(
  
  img1, 
  constrain(mouseX-5,0,width), 
  constrain(mouseY-5,0,height), 
  round(random(15,20)),
  round(random(15,20)), 
  constrain(mouseX-5,0,width), 
  constrain(mouseY-5,0,height), 
  round(random(12,17)),
  round(random(12,17)));}}

//BRUSH 2: actived by keeping the "2" button held down.    
  if (keyPressed){
  if (key == '2'){
 
copy(
  
  img2, 
  constrain(mouseX-5,0,width), 
  constrain(mouseY-5,0,height), 
  round(random(15,20)),
  round(random(15,20)),  
  constrain(mouseX-5,0,width), 
  constrain(mouseY-5,0,height), 
  round(random(12,17)),
  round(random(12,17)));}}

//BRUSH 3: actived by keeping the "3" button held down.    
  if (keyPressed){
  if (key == '3'){
  
copy(
  
  img3, 
  constrain(mouseX-5,0,width), 
  constrain(mouseY-5,0,height), 
  round(random(15,20)),
  round(random(15,20)), 
  constrain(mouseX-5,0,width), 
  constrain(mouseY-5,0,height), 
  round(random(12,17)),
  round(random(12,17)));
  }}}

//SCREENSHOT in .png format: actived by a single tap on the "s" button
void keyReleased(){
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

//TIMESTAMP: related to screenshot
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

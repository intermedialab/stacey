//dynamic program example 
//make space for a number without a comma = int
  //call it cirkelSize = name
    //set it to = =
      // fourty = 100
      
int cirkelSize = 100; // størrelsen af circlen
int oldMouseX = 0;
int oldMouseY = 0;

void setup(){ 
    size(800, 1000); // display størrelsen
    noCursor(); // usynlig cursor 
    
} 
void draw(){ 

colorMode(HSB, 260, 100, 100); // farvekoder. Når man bruger hue spektrum skan koderne ligge mellem 0 og 360. */
ellipseMode(CORNER); // hvor ellipsen starter
stroke(5); // farvekoden for omridset af ellipsen
background(mouseY/2, 100, 50); // baggrundsfarven skifter når man bevæger cursoren. 100 og 50 er farvekoder. 

{
// adding shapes
translate(0, 55, 55); //placering af ny shape
int circleResolution = ( int ) map(mouseY, 0,height, 2,80); // map konverterer musens position til at være mellem 2 og 80
float radius = mouseX-width/2 + 1.5; 
float angle = TWO_PI/circleResolution; 

strokeWeight(mouseY/100); // vidde på formen. Jo højere tal mouseY divideres med, jo mindre bliver den. 

beginShape();
for (int i=0; i<=circleResolution; i++){
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;
    line(100, 100, x, y);
    vertex(x, y);
    
  }
 }


fill(360-mouseY/2, 50, 50); //farvekoder for cirklen. 
ellipse(360, 360, mouseX+1, mouseX+1); // tilføjer endnu en ellipse

    if(mouseX == oldMouseX 
    && mouseY == oldMouseY 
    && cirkelSize > 10){  
    cirkelSize = cirkelSize-1; //cirklen formindskes 
  }
  
  if(mouseX != oldMouseX 
    || mouseY != oldMouseY // | = alt+i
    && cirkelSize < 200){ 
      //mouse has changed and the cirkel needs to grow 
    cirkelSize = cirkelSize+1;
  }
  
  if(mouseX > 0 && mouseY > 0){
      ellipse(mouseX, mouseY, cirkelSize, cirkelSize);

  }
  
    oldMouseX = mouseX;
    oldMouseY = mouseY;
}



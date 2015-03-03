//Remixed af Anton Flyvholm og Alexander Thomasen med udgangspunkt i Googles Doodle d.15/10 2013
//Remixed fra koder af: 
//Kode 1: Daniel Shiffmann - http://www.learningprocessing.com/examples/chapter-13/example-13-10/
//Kode 2: By Chrisir - http://forum.processing.org/one/topic/equilateral-triangle-grid-2d.html
//
                     ArrayList<TriangleClass> triangles;
//
// -------------------------------------------------------------------------------------
//
void setup(){ size(800, 600); int widthX= 20 ; int widthY= 20; int widthXhalf= widthX/2;
  int widthYhalf= widthY/2;triangles = new ArrayList<TriangleClass>(); /* Creates
    an empty ArrayList/* Draws triangle with the broad side up*/ for (int y1=0;  
      y1 < width+1; y1+=widthY) { for (int x1=0; x1 < width+1; x1+=widthX)
          { color  MyC1 = color (0); /* A new TriangleClass object is
             added to the ArrayList (by default to the end)//////*/ 
              triangles.add(new TriangleClass( x1-widthXhalf, y1,
                 x1+widthXhalf, y1, x1, y1+widthY, MyC1,/////
                   /*////*/random(0,255) )); }/*///////*/
                         //////////////////////////
                           /////////////////////
                             //////////////
                                  ////
                                    }
                                   for 
                                 (int y1=0;
                               y1 < width; y1
                             +=widthY) { for (int
                         x1=0; x1 < width; x1+=widthX)
                      { /* Draws triangles with the broad 
                    side down*//* Checks if it has to draw 
                 or not*/ int maaske = 0; maaske = round(random
              (0,5)); /* A new TriangleClass object is added to the 
            ArrayList (by default to the end).*/ if (maaske >1) {/**/
         triangles.add(new TriangleClass( x1+2*widthXhalf, y1+widthY,x1
       +widthXhalf, y1, x1-0, y1+widthY, 0, random(0,255) ));} }} noStroke();}
     void draw(){ /* runs again and again*/ background(255/1.5); TriangleClass/// 
    myCurrentTriangle ;for (int i=0; i < triangles.size(); i++) { /* get object from
  ArrayList*/myCurrentTriangle = triangles.get(i);myCurrentTriangle.fade();///////////
 myCurrentTriangle.display(); }}///////////////////////////////////////////////////////
//
//-------------------------------------------------------------------------------------



// Simple class
class TriangleClass {
  //
  float x1, y1, x2, y2, x3, y3;    // points
  color myColor;        // fill color
  float speed = 1;     // for fill transparency / opacity
  //
  // constructor
  TriangleClass(
  float tempX1, float tempY1,
  float tempX2, float tempY2,
  float tempX3, float tempY3,
  color tempmyColor1,
  float tempSpeed ) {
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    x3 = tempX3;
    y3 = tempY3;   
    myColor=tempmyColor1;
    speed= tempSpeed;
  
  }  

  // constructor
  // makes the triangles fade. Speed = fade speed
 void fade() {
  speed +=0.03;
} 
  
  
  void display() {
    // show triangle
    fill(127+127*sin(speed));
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
}

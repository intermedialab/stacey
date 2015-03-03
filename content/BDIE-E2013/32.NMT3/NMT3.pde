/*

Author: Christian Sivertsen
Runtime: Approx 1.5 min. 
b
CONTROLS: MOUSE

Remember to find the sweet spot. 

Sources:
- Text: Allgemeine Erklärung der Menschenrechte: http://www.un.org/depts/german/grunddok/ar217a3.html
- Easing: Proccesing.org - http://processing.org/examples/easing.html
- Text import: Generative Gestaltung - http://www.generative-gestaltung.de/P_2_3_3_01
- Grid & jitter: Generative Gestaltung - http://www.generative-gestaltung.de/P_2_1_2_01

*/

//Declares variables
PFont font;
String letters = "Alle Menschen sind frei und gleich an Würde und Rechten geboren. Sie sind mit Vernunft und Gewissen begabt und sollen einander im Geiste der Brüderlichkeit begegnen. Jeder hat Anspruch auf alle in dieser Erklärung verkündeten Rechte und Freiheiten, ohne irgendeinen Unterschied, etwa nach Rasse, Hautfarbe, Geschlecht, Sprache, Religion, politischer oder sonstiger Anschauung, nationaler oder sozialer Herkunft, Vermögen, Geburt oder sonstigem Stand. Des weiteren darf kein Unterschied gemacht werden auf Grund der politischen, rechtlichen oder internationalen Stellung des Landes oder Gebietes, dem eine Person angehört, gleichgültig ob dieses unabhängig ist, unter Treuhandschaft steht, keine Selbstregierung besitzt oder sonst in seiner Souveränität eingeschränkt ist.";
String end = "Alles verloren";
float tileCount = 20; 

float posX;
float posY;
float shiftX;
float shiftY;

int counter;

int numberOfChars; 

ArrayList<Char> chars;
boolean begin = false;
boolean runOnce2 = false;

void setup() {
  
  //Sets up screen size
  size(600, 600);
  
  //Sets up text font, size, alignment and anti-aliasing
  font = createFont("Arial", 20);
  textFont(font, 20);
  textAlign(CENTER, CENTER);
  smooth();
  
  //Creates a new object array
  chars = new ArrayList<Char>();
  
  int i = 0;
  
  //Makes a grid of letters
    for (int gridY=0; gridY<tileCount; gridY++) {      
      for (int gridX=0; gridX<tileCount; gridX++) {
        
        //Defines the values for position variables
        float posX = width/tileCount * gridX;
        float posY = height/tileCount * gridY;
        float targetOffX = random(-30,30);
        float targetOffY = random(-30,30);
        
        //Adds an object to the ArrayList
        chars.add(new Char());  
        //Gets the newly added object    
        Char c = chars.get(i);
        //Assigns values to the variables of that object
        c.posX = posX;
        c.posY = posY;
        c.targetOffX = targetOffX;
        c.targetOffY = targetOffY;
        c.easing = random(0.03,0.07);
        //Makes sure that we keep advancing through the array
        i++;
      }
     }         
      
}
  
void draw() {
  
  //Aligns the text in the center of the grid  
  translate(width/tileCount/2, height/tileCount/2);
  background(51);
  
  //Loops through all the objects in the list
  for (int i = chars.size()-1; i >= 0; i--) {
    
  Char c = chars.get(i);
  
  //Checks if a certain timespan has been met and sets the runOnce variable to true,
  //which makes us able to skip parts of the program we no longer need.
  if (millis() >= 15000) {runOnce2 = true;}
  
  //If the 30 seconds haven't passed the text is white and displayed in a grid
  if (runOnce2 == false) {
    fill(255);
    c.display();
  } 
  
  //If the 30 seconds have passed we move on to the next part
   else {
     //If the mouse is close to a character the follow() function is used
     if (abs(c.posX - mouseX) < 30 && abs(c.posY - mouseY) < 30 ) {
      c.following = true; 
      c.follow(c.posX, c.posY);
     }
     else {
       //If the character is already following the mouse it keeps doing that
       if (c.following == true) {
         c.follow(c.posX, c.posY);
       }
       //If not, we keep it in the grid
        else {
          c.display();
        }
      }
   }  
  }  
  
  //If 1 minute and 2 seconds have passed, the end text is shown
  if (millis() >= 35000) {
  text(end, width/2, height/2);
  }
  
}

        
      
     //Declares the Char class
class Char {
  
  //Declares all the variables used for the Char class
  float posX;
  float posY; 
  float gridX;
  float gridY;
  float shiftX;
  float shiftY;
  float easing;
  float newX;
  float newY;
  float targetOffX; 
  float targetOffY;
  float targetX;
  float targetY;
  boolean following;
  boolean runOnce;
  
    
Char(){
  //Ended up doing nothing, but let's keep it as a curiousity
}

//Prints the letters
void display() {
  
  float shiftX = random(-millis(), millis())/5000;
  float shiftY = random(-millis(), millis())/5000;
  
  char newLetter = letters.charAt(counter);
    text(newLetter, posX+shiftX, posY+shiftY);
    counter++;
    //Makes the generation of text end, when the end of the screen is reached.
    if (counter > letters.length()-1) counter = 0;
    if (posX == 570.0 && posY == 570.0) counter = 0;
}

//This method makes the letters follow the cursor 
//It receives values from another part of the program
void follow(float tempPosX, float tempPosY) {
  
  //The initial position of the letters is only used once
  if (runOnce == false) {
  newX = tempPosX;
  newY = tempPosY;
  runOnce = true;
  }
  
  //Defines where the letters should be heading on the X-axis
  targetX = mouseX+targetOffX;
  //After 60 seconds the letters drop to the floor
  if (millis() >= 35000) {
    targetX = random(0,600);
  }
  
  float dx = targetX - newX;
     
  if(abs(dx) > 1) {
    //The easing variable makes the movement smooth
    newX += dx * easing;
  }
  
  //Defines where the letters should be heading on the Y-axis
  targetY = mouseY+targetOffY;
  //After 60 seconds the letters drop to the floor
  if (millis() >= 35000) {
    targetY = 580;
  }
  float dy = targetY - newY;
  
  if(abs(dy) > 1) {
    //The easing variable makes the movement smooth
    newY += dy * easing;
  } 
  
  //Prints the letters
  char newLetter = letters.charAt(counter);
  text(newLetter, newX, newY);
  counter++;
  if (counter > letters.length()-1) counter = 0;
  
  //Colors the letters
  float color1 = map(counter, 0, 160, 0, 200);
  float color2 = map(newY, 0, 570, 150, 255);
  float color3 = map(newX, 0, 570, 230, 255);
  fill(color3, color2, color1);
}

}
           
        
        
      
 

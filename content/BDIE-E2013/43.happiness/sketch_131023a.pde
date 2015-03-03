// Based on original tekst by typcut( http://visual.ly/are-you-happy-0 )
// Remixed by:
// Mark R. Hjelmgaard(xxx@itu.dk) & Thomas S.Christensen(tsac@itu.dk)

//Declaring variables.
color backgroundColor = color(0,0,0);
color textColor = color(255,255,255);
int line = 20;
int lineHeight = 16;
int questionActive = 0;
char keyEntered;
cursorObject cursor;

// Do setup of awsome magic.
void setup() {
    // Set framerate to control cursor "blinking-speed".
    frameRate(2);
    
    // Define ms-dos-looking canvas.
    size(640, 300);
    background(backgroundColor);
    
    // Draw cursor.
    cursor = new cursorObject();
    
    // Print init text.
    printline("Happiness detection software [Version 1.0.0]");
    printline("<C> Copyright 2013 Tomak Corp. All rights reserved");
    printline("");
    
    // Print first question.
    printQuestion(1, "Are you happy <Y/N> ?");  
    
    
}

// Make it happend.
void draw() {
    cursor.blink();
    
    switch(questionActive) {
      case 1:
        if(keyEntered == 'y' || keyEntered == 'Y') {
          printline("Keep doing whatever you're doing");
          printline("");
          printline("Program terminated..");
          keyEntered = ' ';
        
        } else if(keyEntered == 'n' || keyEntered == 'N') {
          printQuestion(2, "Do you want to be happy <Y/N> ?");
          keyEntered = ' ';
        }
        break;
      
      case 2:
        if(keyEntered == 'y' || keyEntered == 'Y') {
          printline("Change something!");
          printline("");
          printline("Program terminated..");
          keyEntered = ' ';
        
        } else if(keyEntered == 'n' || keyEntered == 'N') {
          printline("Keep doing whatever you're doing");
          printline("");
          printline("Program terminated..");
          keyEntered = ' ';
        }
    }    
}

// Function to present a line. 
void printline(String t) {
    fill(textColor);
    textSize(14);
    
    // Print line.
    text(t, 10, line);
    
    // Move cursor .
    cursor.setCursor(textWidth(t) + 12, line);
    
    // Clear question, since were not at a question.
    questionActive = 0;
    
    // Update current line.
    line = line + lineHeight;
    
}

// Function to present a question. 
void printQuestion(int questionNumber, String t) {
    fill(textColor);
    textSize(14);
    text(t, 10, line);
    
   cursor.setCursor(textWidth(t) + 12, line);
   
   // Update line
   line = line + lineHeight;
   
   // Update question reached.
   questionActive = questionNumber;
    
}

// CursorObject.
class cursorObject {
    color cursorColor;
    float cursorX;
    float cursorY;
    
    // Constructor.
    cursorObject() {
        // Set color.
        cursorColor = textColor;
        fill(cursorColor);
        
        // Set position.
        cursorX = 16;
        cursorY = 20;
        
        // Draw it.
        text('_', cursorX, cursorY);
    }
    
    // Function to make cursor blink.
    void blink() {
      if (cursorColor == textColor) {
        cursorColor = backgroundColor;
      } else {
        cursorColor = textColor;
      }
      
      fill(cursorColor);
      text('_', cursorX, cursorY);
    }
    
    void setCursor(float x, float y) {
      // Erase old.
      fill(backgroundColor);
      text('_', cursorX, cursorY);
      
      // Make new.
      fill(cursorColor);
      cursorX = x;
      cursorY = y; 
      text('_', cursorX, cursorY);
    }
}

// Function called every time key is pressed.
void keyPressed() {
  keyEntered = key;
  
  if(keyEntered != 'y' && keyEntered != 'Y' && keyEntered != 'n' && keyEntered != 'N') {
    switch(questionActive) {
      case 1:
        printline("Wrong key!.. press Y for YES .. or N for NO!");
        printline("");
        printQuestion(1, "Are you happy <Y/N> ?");
        break;
      
      case 2:
        printline("Wrong key!.. press Y for YES .. or N for NO!");
        printline("");
        printQuestion(2, "Do you want to be happy <Y/N> ?");
        break;
    }  
  }  
}

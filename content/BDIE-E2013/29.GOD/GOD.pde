/**
 * Code help from Java Examples - Directional. 
 */

// In the beginning when God created the heavens and the earth, 
// the earth was a formless void and darkness covered the face of the deep, 
// while a wind from God swept over the face of the waters.

void setup() {
// God created a more manageable space to work in.
  size(600,800, P3D);
// He saw that it was good.
  noStroke();
// Then God said, "Let there be light"; and there was light.
  fill(255);
// And God saw that the light was good; and God separated the light from the darkness.
}

void draw() {
// God hid his inner workings, for there was no one there to behold Him.
  noStroke(); 
  
// And God said, "Let there be a dome in the midst of the waters, 
// and let it separate the waters from the waters." 

//So God made the dome
  fill(117, 118, 117, 65);
  rect(0,200,600,200);
  
//and separated the waters that were under the dome from the waters that were 
//above the dome. And it was so.
  
// the water above the dome
  fill(163, 198, 252, 100);
  rect(0,0,600,200);
 
// the waters under the dome
  fill(36, 65, 222, 150);
  rect(0,400,600,200);
  
// And God said, “Let the water under the sky be gathered to one place, 
// and let dry ground appear.” God called the dry ground “land,” 
// and the gathered waters he called “seas.”
  fill(25, 100, 26);
  rect(0,600,600,200);
  
//God saw that it was good.
  fill(255);

// Then the LORD God formed man from the dust of the ground, 
// and breathed into his nostrils the breath of life; 
// and the man became a living being.
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
// "Can a man hide himself in secret places so that I cannot see him?" 
// the LORD asked his creation.
  directionalLight(204, 204, 204, -dirX, -dirY, -1); 
// "Do I not fill heaven and earth?" declared the Lord.
  translate(width/2 - 100, height/2, 0); 
  sphere(95); 
// “The eyes of the LORD are everywhere. 
//They watch those who are evil and those who are good” said God.
  translate(200, 0, 0); 
  sphere(95); 
}

// God the LORD was pleased with his creations. He categoried it all as Good.
// Yet
// God could not help but think
// In all His might and glory
// If there was no one to watch over?
// Where would He look to?
// Would there even be 
// Me?



//Variables used for the images for the the background
PImage background_img;

//Variables used for the images for the refrigerator
PImage kooleskab_img;
PImage open_kooleskab_img;
boolean overKooleskab = false;
boolean overKooleskab2 = false;
boolean kooleskab_open = false;
boolean kooleskab_in = false;
boolean peppernutKooleskab = false;
boolean kooleskab_peppernut = false;

//Variables used for the images for the mobilephone
PImage light_phone_img;
PImage phone_light_img;
PImage phone_open_img;
boolean phone_has_opened = false;
boolean phone_light_on = false;
boolean phone_peppernut = false;
boolean phone_pressed = false;
boolean click_p_peppernuts = false;

//Variables used for the images for the hall/stairs
PImage open_door_img;
PImage hall_img;
PImage stairs_img;
boolean door_has_opened = false;
boolean stair_has_opened = false;
boolean overDoor = false;
boolean door_open = false;
boolean stairs = false;
boolean hall_open = false;
boolean stairs_open = false;
boolean click_s_peppernuts = false;
boolean stairs_peppernut = false;
boolean hall_peppernuts = false;
boolean hall_peppernut = false;

//Variables used for the images for the microwave
PImage microwave_light_img;
PImage microwave_open_img;
boolean light_microwave_on = false;
boolean microwave_has_opened = false;
boolean microwave_peppernut = false;
boolean buttons_pressed = false;
boolean microwave_pressed = false;
boolean click_m_peppernuts = false;

//Variables used for the images for the board
PImage board_img;
boolean board_pressed = false;
boolean board_opened = false;
boolean note_pressed = false;

//Variables used for the images for the finish screen
PImage lolcat_gratz_img;


//variable for the peppernut counter
int peppernuts = 0;

//variable for the door counter
int door_count = 0;
//variable for the hall peppernut counter
int hall_peppernuts_count = 0;

void setup(){
  //the screensize is set
  size (800, 600);
  
  //all of the images is being loaded
  background_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/background.jpg");
  kooleskab_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/kooleskab.jpg");
  open_kooleskab_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/open_kooleskab.jpg");
  light_phone_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/light_phone.jpg");
  open_door_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/open_door.jpg");
  hall_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/hall.jpg");
  microwave_light_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/microwave_light.jpg");
  microwave_open_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/microwave_open.jpg");
  phone_light_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/phone_light.jpg");
  phone_open_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/phone_open.jpg");
  board_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/board.jpg");
  stairs_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/stairs_img.jpg");
  lolcat_gratz_img = loadImage("http://intermedia.itu.dk/content/BDIE-E2013/8.pebernoddejagten/data/lolcat_gratz.jpg");
  
  //the background image is being drawed
  image(background_img, 0, 0);
}

void draw(){
  //defines the area for when the variable "board_pressed" is true, which means that the mouse is over the board
  if (mouseX > 370 && mouseX < 452 && 
      mouseY > 139 && mouseY < 309) {
    board_pressed = true;  
  } else {
    board_pressed = false;
  }
  
  //defines the area for when the variable "note_pressed" is true, which means that the mouse is over the note on the board
  if (mouseX > 404 && mouseX < 474 && 
      mouseY > 53 && mouseY < 184) {
    note_pressed = true;  
  } else {
    note_pressed = false;
  }
  
  //defines the area for when the variable "overKooleskab" is true, which means that the mouse is over the door of the refrigerator
  if (mouseX > 230 && mouseX < 264 && 
      mouseY > 190 && mouseY < 600) {
    overKooleskab = true;  
  } else {
    overKooleskab = false;
  }
  //defines the area for when the variable "overKooleskab2" is true, which means that the mouse is over the inside of the refrigerator
  if (mouseX > 184 && mouseX < 230 && 
      mouseY > 190 && mouseY < 600) {
    overKooleskab2 = true;  
  } else {
    overKooleskab2 = false;
  }
  //defines the area for when the variable "peppernutKooleskab" is true,  which means that the mouse is over the peppernuts in the refrigerator
  if (mouseX > 239 && mouseX < 286 && 
      mouseY > 324 && mouseY < 356) {
    peppernutKooleskab = true;  
  } else {
    peppernutKooleskab = false;
  }
  
  
  //defines the area for when the variable "overDoor" is true, which means that the mouse is over the door in the kitchen
  if (mouseX > 290 && mouseX < 340 && 
      mouseY > 208 && mouseY < 306) {
    overDoor = true;  
  } else {
    overDoor = false;
  }
  
  //defines the area for when the variable "hall_peppernuts" is true, which means that the mouse is over the peppernuts in the hall
  if (mouseX > 613 && mouseX < 651 && 
      mouseY > 481 && mouseY < 516) {
    hall_peppernuts = true;  
  } else {
    hall_peppernuts = false;
  }
  
  //defines the area for when the variable "stairs" is true, which means that the mouse is on the stairs
  if (mouseX > 584 && mouseX < 671 && 
      mouseY > 112 && mouseY < 262) {
    stairs = true;  
  } else {
    stairs = false;
  }
  
  //defines the area for when the variable "click_s_peppernuts" is true, which means that the mouse is over the peppernuts on the stairs
  if (mouseX > 624 && mouseX < 698 && 
      mouseY > 462 && mouseY < 491) {
    click_s_peppernuts = true;  
  } else {
    click_s_peppernuts = false;
  }
  
  
  //defines the area for when the variable "buttons_pressed" is true, which means that the mouse is over the buttons on the microwave
  if (mouseX > 630 && mouseX < 643 && 
      mouseY > 262 && mouseY < 312) {
    buttons_pressed = true;  
  } else {
    buttons_pressed = false;
  }
  
  //defines the area for when the variable "microwave_pressed" is true, which means that the mouse is over the door of the microwave
  if (mouseX > 567 && mouseX < 626 && 
      mouseY > 256 && mouseY < 311) {
    microwave_pressed = true;  
  } else {
    microwave_pressed = false;
  }
  
  //defines the area for when the variable "click_m_peppernuts" is true, which means that the mouse is over the peppernuts in the microwave
  if (mouseX > 572 && mouseX < 681 && 
      mouseY > 177 && mouseY < 238) {
    click_m_peppernuts = true;  
  } else {
    click_m_peppernuts = false;
  }
  
  
  //defines the area for when the variable "phone_pressed" is true, which means that the mouse is over the mobilephone
  if (mouseX > 582 && mouseX < 620 && 
      mouseY > 386 && mouseY < 402) {
    phone_pressed = true;  
  } else {
    phone_pressed = false;
  }
  
  //defines the area for when the variable "hall_peppernuts" is true, which means that the mouse is over the peppernuts at the mobilephone
  if (mouseX > 372 && mouseX < 444 && 
      mouseY > 420 && mouseY < 470) {
    click_p_peppernuts = true;  
  } else {
    click_p_peppernuts = false;
  }
  
  
  //this shows the final screen, if all of the peppernuts is found
  if(kooleskab_peppernut == true && stairs_peppernut == true && microwave_peppernut == true && phone_peppernut == true && hall_peppernut == true) {
    fill(0, 0, 0);
    rect(0, 0, 800, 600);
    image(lolcat_gratz_img, 0, 0);
  }
  
  //this prints the "peppernut-score" (the amount of peppernuts found)
  fill(0);
  rect(15, 7, 15, 15);
  fill(255, 255, 255);
  text(peppernuts, 20, 20);
}

void mousePressed() {
  
  //this defines that whenever you press on the board, the board_img will apear
  if(board_pressed == true && note_pressed == false) {
    fill(0, 0, 0);
    rect(0, 0, 800, 600);
    image(board_img, (width/2)-(board_img.width/2), 0);
    board_opened = true;
  }
  //This means that if both booleans have been pressed, the background image will appear
  if(note_pressed == true && board_opened == true) {
    image(background_img, 0, 0);
    board_opened = false;
  }
    
  //This section defines that whenever you press on the refrigerator, its door will open
  if(kooleskab_peppernut == false){
    if(overKooleskab == true) { 
      image(open_kooleskab_img, 0, 0);
      kooleskab_open = true;
    } 
    //This section defines that if both overKooleskab2 and kooleskab_open have been pressed, the kooleskab_img will appear, and if kooleskab_in have been activated youll get 1 point 
    if(overKooleskab2 == true && kooleskab_open == true) {
      fill(0, 0, 0);
      rect(0, 0, 800, 600);
      image(kooleskab_img, 150, 150);
      kooleskab_in = true;
      peppernuts = peppernuts + 1;
    }
    //This section defines that if all three booleans have been activated, then the background image will appear
    if(peppernutKooleskab == true && kooleskab_open == true && kooleskab_in == true) {
      image(background_img, 0, 0);
      kooleskab_peppernut = true;
    } 
  }
  //This section defines that whenever you press on the door, it will open
  if(stairs_peppernut == false) {
    if(overDoor == true) { 
        image(open_door_img, 0, 0);
        door_open = true;
        door_count = door_count + 1;
     }
    //This section defines that if both overDoor and door_count have been pressed, the hall_img will appear
      if(overDoor == true && door_count == 2) {
        fill(0, 0, 0);
        rect(0, 0, 800, 600);
        image(hall_img, width-hall_img.width, 0);
        hall_open = true;
      }
     //this means that you only can collect the hall_peppernuts once
      if(hall_peppernuts == true && hall_peppernuts_count == 0) {
          peppernuts = peppernuts + 1;
          hall_peppernuts_count = hall_peppernuts_count + 1;
          hall_peppernut = true;
      }
    }
    //This section says that if the hall_open and stairs are activated, and the peppernuts in the hall is collected, the stairs_img should appear
    if(stairs == true && hall_open == true && hall_peppernut == true) {
      fill(0, 0, 0);
      rect(0, 0, 800, 600);
      image(stairs_img, width-stairs_img.width, height-stairs_img.height);
      stairs_open = true;
    }
    //This defines that if youve pressed the click_s_peppernuts, then the background_img should appear + that youll recieve 1 point
    if(click_s_peppernuts == true && hall_open == true && stairs_open == true) {
        image(background_img, 0, 0);
        stairs_peppernut = true;
        peppernuts = peppernuts + 1;
      }
      //This defines that when the buttons on the microwave has been pressed, the image micro_light_img should appear
  if (microwave_peppernut == false) {
    if(buttons_pressed == true) {
        image(microwave_light_img, 0, 0);
        light_microwave_on = true;
    }
    //This section shows that if both are true, then the microwave_open_img should appear
    if(microwave_pressed == true && light_microwave_on == true) {
        fill(0, 0, 0);
        rect(0, 0, 800, 600);
        image(microwave_open_img, 440, 61);
        microwave_has_opened = true;
    }
    //This one shows that if all booleans have been activated, then youll recieve 1 point when pressing the microwave_peppernut
    if(light_microwave_on == true && microwave_has_opened == true && click_m_peppernuts == true) {
      image(phone_light_img, 0, 0); //this line tells us that if the peppernuts have been collected in the microwave, the phone_light_img should appear
      microwave_peppernut = true;
      phone_light_on = true; 
      peppernuts = peppernuts + 1;
    }
  }
  //this section defines that if the phone is pressed the phone_open_img should appear
  if (phone_peppernut == false) {
    if(phone_pressed == true && phone_light_on == true) {
        fill(0, 0, 0);
        rect(0, 0, 800, 600);
        image(phone_open_img, (width/2)-(phone_open_img.width/2), height-phone_open_img.height);
        phone_has_opened = true;
    }
    //this one shows that if the phone_light_on and click_p_peppernuts is pressed, the background_img will appear and that youll get +1 point
    if(phone_light_on == true && click_p_peppernuts == true) {
      image(background_img, 0, 0);
      phone_peppernut = true;
      peppernuts = peppernuts + 1;
    }
  }
}

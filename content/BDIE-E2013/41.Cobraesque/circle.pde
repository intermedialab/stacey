class Circle {

  float posX = 42;
  float posY = 717;
  float speedX = int(random(1,4)); // speed does not change
  float speedY = int(random(1,4)); // therefore it is linear
  float circleWidth = 45;
  float circleHeight = 60;
  boolean outOfscreen = false;
  boolean outOfscreenLimit = false;

//This function can be called in oopCirlces to allow the circles to move. 
//Without it they can still be drawn, but would not move.
  void move() {
      posX += speedX;
      posY -= speedY;
      
      if(posX < 0){
        speedX = -speedX+random(0,1);
      }
      else if(posX > width-circleWidth){
        speedX = -speedX-random(0,1);
      }
      
      if(posY < 0){
        speedY = -speedY+random(0,1);
      }
      else if(posY > height-circleHeight){
        speedY = -speedY-random(0,1);
      }
  }
  
  
    
  void draw(){
   if(!outOfscreen && !outOfscreenLimit){
     image(top2,posX, posY, circleWidth, circleHeight);
   } 
   //I ended up playing a bit around with the colors of the circles. It seemed like a fun experiment.
   noStroke();
   fill(zeusYPos,footYPos,circleWidth,120);
   
   if(posX > width+circleWidth || posX < 0-circleWidth){
       if(!outOfscreenLimit){
         outOfscreen = true;
         outOfscreenLimit = true;
       }
   }
   else if(posY > height+circleHeight || posY < 0-circleHeight){
       if(!outOfscreenLimit){
         outOfscreen = true;
         outOfscreenLimit = true;
       }
   }
   if(posY > footYPos && footYPos + foot.height > 0){
     if(headOutcount <= 3){
    speedY=-3;
     }
   }
  }
}

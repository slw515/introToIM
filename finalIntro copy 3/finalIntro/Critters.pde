class Critter {
  float x;
  float y;
  float xMove;
  int randomMove;
  PImage horseBig = loadImage("horse.png");
  PImage[] horseLeft = {horseBig.get(0, 55, 60, 60), horseBig.get(65, 55, 60, 60), horseBig.get(130, 55, 60, 60), horseBig.get(190, 55, 60, 60)};
  PImage[] horseRight = {horseBig.get(0, 115, 60, 60), horseBig.get(70, 115, 60, 60), horseBig.get(140, 115, 55, 60), horseBig.get(190, 115, 60, 50)};
  PImage beetleBig = loadImage("beetle.png");
  PImage[] beetleRight = {beetleBig.get(0, 80, 35, 30), beetleBig.get(40, 80, 35, 30), beetleBig.get(75, 80, 35, 30), beetleBig.get(110, 80, 35, 30)};
  PImage[] beetleLeft = {beetleBig.get(0, 120, 34, 30), beetleBig.get(44, 120, 34, 30), beetleBig.get(79, 120, 34, 30), beetleBig.get(113, 120, 34, 30)};
  PImage bearBig = loadImage("bear.png");
  PImage[] bearLeft = {bearBig.get(143, 58, 49, 34), bearBig.get(189, 58, 49, 34), bearBig.get(240, 58, 49, 34)};
  PImage[] bearRight = {bearBig.get(143, 110, 49, 34), bearBig.get(189, 110, 49, 34), bearBig.get(240, 110, 49, 34)};  
  PImage dead = loadImage("dead.png");
  PImage[] horseStatic = {horseBig.get(70, 0, 55, 55)};
  int leftMove = 0;
  int rightMove = 0;
  int bearLeftMove = 0;
  int bearRightMove = 0;
  // ^ added bear arrays not working others for some reason.
  PImage exclaim = loadImage("exclaim.png");
  PImage heart = loadImage("heart.png");
  boolean deadState = false;

  //frogs 
  PImage frog = loadImage("frog.png");
  PImage[] frogLeft = {frog.get(0, 56, 48, 48), frog.get(50, 56, 48, 51), frog.get(101, 56, 48, 51), frog.get(150, 56, 48, 48)};
  PImage[] frogRight = {frog.get(0, 100, 48, 48), frog.get(49, 100, 48, 48), frog.get(99, 100, 48, 48), frog.get(148, 100, 48, 48)};

  Critter() {
    xMove = random(0.2, 2);
    x = random(100, width);
    y = random(150, height - 200);
  }  
  void engage() {
    if (gameState == 1 && deadState == false) {
            //player hits hammer and is within y and x coordinates of the animal 

      if (playerX > x - 30 && playerX < x + 30 && playerY > y - 30 && playerY < y +30 && damageCount < 50 && button > 4) {
        image(horseStatic[0], x, y);
        damageCount++;
        image(heart, x, y);
        coin.play();
        coin.rewind();
        critterCount++;
      } else if (playerX > x && playerX < x + 30 && playerY > y && playerY < y +30 && damageCount >= 250 && button > 4) {
        image(dead, x, y);
        damageCount++;
        deadState = true;
        //if damage count is greater > 200, animal dies, set deadstate to true.
      } else {
        //randomy move animal when randomly generated number is equal to 5 (multiply xMove by -1)
        randomMove = (int) random(0, 100);
        if (randomMove == 5) {
          xMove *= -1;
          x+=xMove;
        } else if (randomMove == 10) {
          xMove *= -1;      
          x+=xMove;
        } else {
          x += xMove;
        }  
        if (xMove < 0) {
          image(horseLeft[leftMove], x, y);
          leftMove++;
          if (leftMove >= horseLeft.length) {
            leftMove = 0;
          }
        } else if (xMove > 0) {
          image(horseRight[rightMove], x, y);
          rightMove++;
          if (rightMove >= horseRight.length) {
            rightMove = 0;
          }
        }
      }
    } else if (gameState == 2 && deadState == false) {
      if (playerX > x - 30 && playerX < x + 40 && playerY > y - 50  && playerY < y + 40 && damageCount < 250 && button > 4) {
        image(beetleLeft[0], x, y);
        damageCount++;
        image(heart, playerX, playerY);
        critterCount++;
        coin.play();
        coin.rewind();
      } else if (playerX > x - 30 && playerX < x + 40 && playerY > y - 50 && playerY < y + 40 && damageCount >= 250 && button >= 4) {
        image(dead, playerX, playerY);
        damageCount++;
        deadState = true;
        die.play();
        die.rewind();
      } else {
        randomMove = (int) random(0, 100);
        if (randomMove == 5) {
          xMove *= -1;
          x+=xMove;
        } else if (randomMove == 10) {
          xMove *= -1;      
          x+=xMove;
        } else {
          x += xMove;
        }  
        if (xMove < 0) {
          image(beetleLeft[leftMove], x, y);
          leftMove++;
          if (leftMove >= beetleLeft.length) {
            leftMove = 0;
          }
        } else if (xMove > 0) {
          image(beetleRight[rightMove], x, y);
          rightMove++;
          if (rightMove >= beetleRight.length) {
            rightMove = 0;
          }
        }
      }
    } else if (gameState == 4 && deadState == false) {
      int moveLeft = 0;
      int moveRight = 0;
      //debug this v
      if (playerX > x - 20 && playerX < x + 40 && playerY > y - 10 && playerY < y + 40 && damageCount < 200 && button > 4) {
        image(bearRight[0], x, y);
        damageCount++;
        image(heart, playerX, playerY);
        critterCount++;
        coin.play();
        coin.rewind();
      } else if (playerX > x - 40 && playerX < x + 50 && playerY > y - 20 && playerY < y + 50 && damageCount >= 200 && button > 4) {
        image(dead, playerX, playerY);
        damageCount++;
        deadState = true;
        critterCount++;
        die.play();
        die.rewind();
      } else {
        randomMove = (int) random(0, 100);
        if (randomMove == 5) {
          xMove *= -1;
          x+=xMove;
        } else if (randomMove == 10) {
          xMove *= -1;      
          x+=xMove;
        } else {
          x += xMove;
        }  
        if (xMove < 0) {
          image(bearLeft[moveLeft], x, y);
          moveLeft++;
          if (moveLeft >= bearLeft.length) {
            moveLeft = 0;
          }
        } else if (xMove > 0) {
          image(bearRight[moveRight], x, y);
          moveRight++;
          if (moveRight == bearRight.length) {
            moveRight = 0;
          }
        }
      }
    } else if (gameState == 5 && deadState == false) {
      //debug this v =0;
      //player hits hammer and is within y and x coordinates of the animal 
      if (playerX > x - 20 && playerX < x + 40 && playerY > y - 20 && playerY < y + 40 && damageCount < 200 && button > 4) {
        image(frogLeft[0], x, y);
        damageCount++;
        image(heart, playerX, playerY);
        coin.play();
        coin.rewind();
        //if damage count is greater > 200, animal dies, set deadstate to true.
      } else if (playerX > x - 40 && playerX < x + 50 && playerY > y - 40 && playerY < y + 50 && damageCount >= 200 && button > 4) {
        image(dead, playerX, playerY);
        damageCount++;
        deadState = true;
        die.play();
        die.rewind();
      } else {
        randomMove = (int) random(0, 100);
        if (randomMove == 5) {
          xMove *= -1;
          x+=xMove;
        } else if (randomMove == 10) {
          xMove *= -1;      
          x+=xMove;
        } else {
          x += xMove;
        }  
        if (xMove < 0) {
          image(frogLeft[leftMove], x, y);
          leftMove++;
          if (leftMove >= frogLeft.length) {
            leftMove = 0;
          }
        } else if (xMove > 0) {
          image(frogRight[rightMove], x, y);
          rightMove++;
          if (rightMove >= frogRight.length) {
            rightMove = 0;
          }
        }
      }
    }
  }

  //flee function for levels 3 & 4, can also be activated from a lot of engagement with animals in first stages.
  void flee() {
    if (damageCount > 150) {
      //animals getting scared from left
      if (playerX <  x && playerX > x - 200 && deadState == false) {
        xMove = 3;
        x += xMove;
        image(exclaim, x, y);
      } else if (playerX > x && playerX < x + 200 && deadState == false) {
        xMove = -3;
        x+= xMove;
        image(exclaim, x, y);
      }
    }
  }  
  //make sure animals for not randomly go off to sides
  void checkSides () {
    if (x >= width) {
      xMove = -3;
    } else if (x <= 0) {
      xMove = 3;
    }
  }  
  // move all functions into one
  void run() {
    engage();
    flee();
    checkSides();
  }
  //make all animals alive again, reset it. to call in final screen for reset.
  void reset() {
    deadState = false;
  }
}

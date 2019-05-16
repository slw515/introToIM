class Tree {
  //float planeX = width / 2;
  //float planeY = 20;
  float xMoveOne;
  float yMoveOne;
  float xMoveTwo;
  float yMoveTwo;
  PImage fire = loadImage("fire.png");
  PImage[] fires = {fire.get(7, 41, 51, 81), fire.get(7, 189, 51, 81), fire.get(7, 288, 51, 81)};
  PImage[] phones = {loadImage("phoneoutline.png"), loadImage("phone2.png"), loadImage("phone3.png"), loadImage("phone4.png"), loadImage("phone5.png"), loadImage("phone6.png")};
  boolean isDead1 = false;
  boolean isDead2 = false;
  boolean oilUsed = false;
  boolean isGlass = true;
  boolean isWatch = true;
  int watchCount = 0;
  PImage[] fan = {loadImage("fan1.png"), loadImage("fan2.png"), loadImage("fan3.png"), loadImage("fan4.png"), loadImage("fan5.png"), loadImage("fan6.png"), loadImage("fan7.png")};
  PImage oilBig = loadImage("oil.png");
  boolean watchUsed = false;
  PImage silver = oilBig.get(522, 190, 42, 32);
  boolean glassUsed = false;
  PImage globe = loadImage("earth.png");
  int treeAmount = 10;
  boolean isTree1 = true;
  boolean isTree2 = true;
  boolean isCoal = true;
  PImage tree = loadImage("tree2.png"); 
  PImage firstTree = tree.get(462, 100, 200, 200);
  PImage secondTree = tree.get(132, 132, 70, 240);
  PVector planeOrigin;
  float displace = random(-100, 100);
  PImage[] planes = {loadImage("plane1.png"), loadImage("plane2.png"), loadImage("plane3.png"), loadImage("plane4.png"), loadImage("plane5.png"), loadImage("plane6.png"), loadImage("plane7.png")};
  PImage[] trains = {loadImage("train1.png"), loadImage("train2.png"), loadImage("train3.png"), loadImage("train4.png"), loadImage("train5.png")};
  PImage[] pickaxes = {loadImage("pickaxe1.png"), loadImage("pickaxe2.png"), loadImage("pickaxe3.png"), loadImage("pickaxe4.png")};
  PImage[] chariot = {loadImage("chariot1.png"), loadImage("chariot2.png"), loadImage("chariot3.png"), loadImage("chariot4.png"), loadImage("chariot5.png")};
  PImage oil = oilBig.get(190, 0, 38, 38);
  PImage glass = oilBig.get(261, 38, 38, 38);
  PImage axe = loadImage("axesc.png");
  PImage[] axes = {axe.get(0, 0, 200, 200), axe.get(0, 240, 200, 200), axe.get(0, 500, 200, 200), axe.get(0, 740, 200, 200)};
  float deadTime = 200;
  //continue debugging tree grid 
  Tree() {
    xMoveOne = random(100, width - 200);
    yMoveOne = random(100, height - 200);
    xMoveTwo = random(0, width);
    yMoveTwo = random(100, height - 200);
    planeOrigin = new PVector(planeX, planeY);
    //image(planes[imgCounter % 7], width / 2, 20);    //println("y is " + yMoveOne);
  }  

  void show() {
    if (gameState == 1) {
      if (isTree1 == true) {
        for (int i = 0; i < treeCount; i++) {
          if (isDead1 == true) {
            float timePosition = millis()/deadTime % 0.1;
            yMoveOne = lerp(yMoveOne, -100, timePosition);
            xMoveOne = lerp(xMoveOne, -100, timePosition);
            if (xMoveOne >= -80) {
              image(axes[frameCount % 4], playerX, playerY);
            }
          }
          image(firstTree, xMoveOne, yMoveOne);
        }
      }
      if (isTree2 == true) {
        for (int i = 0; i <treeCount; i++) {
          if (isDead2 == true) {
            float timePosition = millis()/deadTime % 0.1;
            yMoveTwo = lerp(yMoveTwo, -100, timePosition);
            xMoveTwo = lerp(xMoveTwo, -100, timePosition);
            if (xMoveTwo >= -80) {
              //imageMode(CENTER);
              //axe[frameCount % 3].resize(0, 5);
              image(axes[frameCount % 4], playerX, playerY);
            }
          }
          image(secondTree, xMoveTwo, yMoveTwo);
        }
      }
    }
    if (gameState == 2) {
      if (isCoal == true) {
        for (int i = 0; i < 23; i++) {
          if (oilUsed == true) {
            float timePosition = millis()/deadTime % 0.1;
            yMoveOne = lerp(yMoveOne, -100, timePosition);
            xMoveOne = lerp(xMoveOne, -100, timePosition);
            //PImage[] axe = {loadImage("axeChop.png"), loadImage("axeChop2.png"), loadImage("axeChop3.png"), loadImage("axeChop4.png")};
            if (xMoveOne >= -80) {
              image(pickaxes[frameCount % 4], playerX, playerY);
            }
          }
          image(oil, xMoveOne, yMoveOne);
        }
      }
      //image(oil, xMoveOne, xMoveTwo);
      //image(oil, xMoveTwo, yMoveTwo);
      planeX = 50;
      planeY = 50;
      //image(trains[4], planeX, planeY);
    }
    if (gameState == 4) {
      if (isGlass == true) {
        for (int i = 0; i < 23; i++) {
          if (glassUsed == true) {
            float timePosition = millis()/deadTime % 0.1;
            yMoveOne = lerp(yMoveOne, -100, timePosition);
            xMoveOne = lerp(xMoveOne, -100, timePosition);
            //PImage[] axe = {loadImage("axeChop.png"), loadImage("axeChop2.png"), loadImage("axeChop3.png"), loadImage("axeChop4.png")};
            if (xMoveOne  >= -80) {
              image(pickaxes[frameCount % 4], playerX, playerY);
            }
          }
          image(glass, xMoveOne, yMoveOne);
        }
      }
    }
    if (gameState == 5) {
      if (isWatch == true) {
        for (int i = 0; i < 23; i++) {
          if (watchUsed == true) {
            float timePosition = millis()/deadTime % 0.1;
            yMoveOne = lerp(yMoveOne, -100, timePosition);
            xMoveOne = lerp(xMoveOne, -100, timePosition);
            //PImage[] axe = {loadImage("axeChop.png"), loadImage("axeChop2.png"), loadImage("axeChop3.png"), loadImage("axeChop4.png")};
            if (xMoveOne  >= -80) {
              image(pickaxes[frameCount % 4], playerX, playerY);
            }
          }
          image(silver, xMoveOne, yMoveOne);
        }
      }
    }
  }

  void treeDead() {
    if (gameState == 1) {
      if (chariotCount < 6) {
        if (playerX > xMoveOne - 40 && playerX < xMoveOne + 130 && playerY > yMoveOne - 40 && playerY < yMoveOne + 110 && hammer > 4) {
          mine.play();
          resourceTally++;
          mine.rewind();
          isDead1 = true;
          chariotCount++;
          damageCount++;
        }
        if (playerX > xMoveTwo -40 && playerX < xMoveTwo + 70 && playerY > yMoveTwo - 40 && playerY < yMoveTwo + 120 && hammer > 4) {
          resourceTally++;
          mine.play();
          mine.rewind();
          isDead2 = true;
          chariotCount++;
          damageCount++;
        }
      }
    }
    if (gameState == 2) {
      if (playerX > xMoveOne - 40 && playerX < xMoveOne + 30 && playerY > yMoveOne - 40 && playerY < yMoveOne + 40 && hammer > 4) {
        resourceTally++;

        mine.play();
        mine.rewind();
        oilUsed = true;
        chariotCount++;
        damageCount++;
      }
      if (playerX > xMoveTwo - 40 && playerX < xMoveTwo + 30 && playerY > yMoveTwo - 40 && playerY < yMoveTwo + 40 && hammer > 4) {
        resourceTally++;
        mine.play();
        mine.rewind();
        oilUsed = true;
        chariotCount++;
        damageCount++;
      }
    }
    if (gameState == 4) {
      if (phoneCount < 6) {
        if (playerX > xMoveOne - 40 && playerX < xMoveOne + 150 && playerY > yMoveOne - 50 && playerY < yMoveOne + 120 && hammer > 4) {
          resourceTally++;

          mine.play();
          mine.rewind();
          glassUsed = true;
          phoneCount++;
          damageCount++;
        }
      }
    }
    if (gameState == 5) {
      if (watchCount < 6) {
        if (playerX > xMoveOne - 40 && playerX < xMoveOne + 150 && playerY > yMoveOne - 40 && playerY < yMoveOne + 120 && hammer > 4) {
          resourceTally++;
          mine.play();
          mine.rewind();
          watchUsed = true;
          fanCount++; 
          damageCount++;
        }
      }
    }
  }

  void planeMove() {
    if (gameState == 1) {
      playerX = (int) planeX;
      playerY = (int) planeY;
      int planeTicker = 0; 
      planeTicker+= 3;
      planeX = planeX + planeTicker;

      if (playerX > width + 200) {
        playerX = 20;
      }
    } else if (gameState == 2) {
      playerX = (int) aircraftX;
      playerY = (int) aircraftY;
      int planeTicker2 = 0; 
      planeTicker2 += 2;
      aircraftX = aircraftX + planeTicker2;
      if (aircraftX > width + 200) {
        playerX =300;
      }
    }
  }
  void fireMove() {
    if (damageCount > 200 & stage5Hit == true) {
      image(fires[frameCount % 3], xMoveOne - random(-200, 200), yMoveOne - random(-200, 200));
      image(fires[frameCount % 3], xMoveTwo, yMoveTwo);
    }

    if (damageCount > 250) {
      image(fires[frameCount % 3], random(0, width), random(0, height- 300));
      image(fires[frameCount % 3], random(0, width), random(0, height - 300));
    }
  }

  void reset() {
    isDead1 = false;
    isDead2 = false;
    oilUsed = false;
    glassUsed = false;
    watchUsed = false; 
    xMoveOne = random(100, width - 200);
    yMoveOne = random(100, height - 200);
    xMoveTwo = random(0, width);
    yMoveTwo = random(100, height - 200);
  }
}

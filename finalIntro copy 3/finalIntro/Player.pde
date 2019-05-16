class Player {
  int frameCounter = 0;
  PImage caveManBig = loadImage("caveman.png");
  PImage[] caveManDown = {caveManBig.get(0, 0, 35, 32), caveManBig.get(32, 0, 35, 32), caveManBig.get(63, 0, 35, 31)};
  PImage[] caveManUp = {caveManBig.get(0, 96, 35, 32), caveManBig.get(32, 93, 35, 32), caveManBig.get(63, 93, 35, 31)};
  PImage[] caveManLeft = {caveManBig.get(0, 32, 35, 32), caveManBig.get(32, 32, 35, 32), caveManBig.get(63, 32, 35, 31)};
  PImage[] caveManRight = {caveManBig.get(0, 64, 35, 32), caveManBig.get(33, 64, 35, 32), caveManBig.get(64, 64, 35, 31)};
  //PImage[] caveManStatic = {caveManBig.get(30, 0, 35, 32), caveManBig.get(30, 0, 35, 32), caveManBig.get(60, 0, 35, 31)};

  float up, down, left, right;

  void display() {
    if (gameState == 1 || gameState == 2 || gameState == 4 || gameState == 5) {
      if (yMove >0) {
        image(caveManDown[frameCount % 3], playerX, playerY);
      } else if (yMove < 0) {
        image(caveManUp[frameCount % 3], playerX, playerY);
      } else if (yMove == 0) {
        image(caveManDown[0], playerX, playerY);
      }
      if (xMove < 0) {
        image(caveManLeft[frameCount % 3], playerX, playerY);
      } else if (xMove > 0) {
        image(caveManRight[frameCount % 3], playerX, playerY);
      }
    }
  }
  void update() {
    playerX += xMove;
    playerY += yMove;
    
    if (playerX >= 1910) {
      playerX = 1910;
    } 
    if (playerX <= 0) {
      playerX = 0;
    }  
    if (playerY >= 950) {
      playerY = 950;
    }  
    if (playerY <= 0) {
      playerY = 0;
    }
  }
}  

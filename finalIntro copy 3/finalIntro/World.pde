class World { 
  float sandLocX = 200; 
  float sandLocY = 400; 
  float grassLocX = 400; 
  float grassLocY = 700; 
  float forestLocX = 300; 
  float forestLocY = 600;       
  PImage bgMap = loadImage("map.png");
  PImage plane = loadImage("plane6.png");
  PImage train = loadImage("train5.png");

  void display() { 
    image(bgMap, 0, 0);
    ellipse(sandLocX, sandLocY, 60, 60);
    ellipse(grassLocX, grassLocY, 60, 60);
    ellipse(forestLocX, forestLocY, 60, 60);

    if (isFirstDone == true) {
      image(plane, playerX, playerY);
      playerX = playerX + xMove;
      playerY = playerY + yMove;
    }
  }

  void checkLoc() {
    if (playerX > grassLocX - 60 && playerX < grassLocX && playerY > grassLocY - 60 && playerY < grassLocY && buttonCount == 1) {
      gameState = 2;
    }  
    if (playerX > sandLocX - 60 && playerX < sandLocX && playerY > sandLocY - 60 && playerY < sandLocY && buttonCount == 1) {
      gameState = 1;
      chariotCount = 0;
      isFirstDone = false;
    }
  }
}

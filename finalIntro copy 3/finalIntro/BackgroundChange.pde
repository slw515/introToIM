class BackgroundChange {
  float y, x;
  float imgCount = 0;
  BackgroundChange(float _y, float _x) {
    x = _x;
    y = _y;
  }  
  void createGrass() {
    PImage grass= loadImage("grass.png");
    PImage[] patches = {grass.get(64, 128, 128, 192), grass.get(320, 0, 384, 64), grass.get(0, 0, 64, 64)};
    for (int i = 0; i < width; i += 64) {
      for (int x = 0; x < height; x += 63) {
        //tint(255, 0, 0, damageCount);
        image(patches[2], i, x);
      }
    }
  }

  void createSand() {
    PImage sand = loadImage("sand.png");
    PImage blockOfSand = sand.get(60, 355, 220, 220);
    for (int i = 0; i < width; i += 220) {
      for (int x = 0; x < height; x +=220) {
        image(blockOfSand, i, x);
      }
    }
  }

  void createIce() {
    PImage ice = loadImage("ice.png");
    PImage iceBlock = ice.get(161, 80, 80, 80);
    for (int i = 0; i < width; i += 80) {
      for (int x = 0; x < height; x += 80) {
        image(iceBlock, i, x);
      }
    }
  }

  void createWood() {
    PImage wood = loadImage("ice.png");
    PImage woodBlock = wood.get(0, 160, 80, 80);
    for (int i = 0; i < width; i += 80) {
      for (int x = 0; x < height; x += 80) {
        image(woodBlock, i, x);
      }
    }
  }
}

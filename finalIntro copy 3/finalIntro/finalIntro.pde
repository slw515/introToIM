//fourth copy
import processing.serial.*;
import processing.sound.*; 
//import minim library for audio playback
import ddf.minim.*;
Minim minim; 
AudioPlayer moon;
AudioPlayer desert, coin, ice, death, die, mine;
//SoundFile moon;
int game5Counter = 0;
// ^ used to create counter for screen between stage 3 and 4
int titleCounter = 0;
Serial myPort;
BackgroundChange bg1 = new BackgroundChange(0, 0);
Critter critters[];
Tree trees[];
Player myPlayer;
World myWorld;
//tally interactions with animals and environment damage v-
float damageCount = 0;
//global variables for player movement
int xMove, yMove, hammer;
int xGlobe = width / 2;
int yGlobe = 40;
int button;
int counter = 0;
int resourceTally = 0; 
boolean stage5Hit = false;
boolean isFirstDone = false;
boolean isSecondDone = false;
boolean isThirdDone = false;
// v used for title sequence. 
boolean bothTrue = false; 
boolean petTrue = false; 
//all counts below used in each stage to
int chariotCount = 0;
int phoneCount = 0;
int critterCount = 0;
int fanCount = 0;
int resourceUsed = 0;

// game state initialization, created beginner title "tutorial" last so unitial state is 7
int gameState = 7;
// number of trees created down below
int treeCount = 15;
int playerX = width / 2;
int playerY = height / 2;
int buttonCount = 0;
//various variables for positioning of assets
float planeX = width / 2;
float planeY = 30;
float aircraftX = width - 100;
float aircraftY = 30;
int centerPhoneX;
int centerPhoneY;
int centerFanX;
int centerFanY;
void setup() {
  fullScreen();
  //size(700, 700);
  critters = new Critter[treeCount];
  trees = new Tree[treeCount];
  for (int i = 0; i < treeCount; i++) {
    critters[i] = new Critter();
    trees[i] = new Tree();
  }
  myPlayer = new Player();
  myWorld = new World();
  printArray(Serial.list());  
  String portname=Serial.list()[77];
  myPort = new Serial(this, portname, 9600);
  centerPhoneX = width/ 2;
  centerPhoneY = height / 2;
  centerFanX = width/ 2;
  centerFanY = height / 2;
  frameRate(15);

  minim = new Minim(this);
  moon = minim.loadFile("moon.mp3");
  desert = minim.loadFile("desert.mp3");
  coin = minim.loadFile("mariocoin.wav");
  ice = minim.loadFile("ice.mp3");
  death = minim.loadFile("destruction.mp3");
  die = minim.loadFile("die.mp3");
  mine = minim.loadFile("mine.wav");
  moon.play();
}

void draw() {
  //println("mouse x is "+ mouseX);
  //println("mouse y is "+ mouseY);
  println("hammer value is " + hammer);
  if (gameState == 7) {
    //background(nature);
    rectMode(CENTER);
    fill(0);
    rect(width / 2, height / 2, width, height);
    fill(255);
    textAlign(CENTER);
    if (button < 5 && petTrue == false) {
      textSize(60);      
      text("Welcome to the game!", width / 2, height / 2 - 50);
      textSize(32);      
      text("Pet the dogs head to interact with animals during the game!", width / 2, height / 2 + 50);
    } 
    if (button >= 5 && petTrue == false) {
      textSize(32);      
      text("Great! Now hit the padded wood with the hammer to harvest resources in the game!", width / 2, height / 2 - 50);
      text("", width / 2, height / 2);
      petTrue = true;
      coin.play();
    }
    if (petTrue == true && hammer <= 4 && bothTrue == false) {
      text("Great! Now hit the padded wood with the hammer to harvest resources in the game!", width / 2, height / 2 - 50);
    }
    if (hammer > 4 && petTrue == true && bothTrue == false) {
      coin.pause();
      coin.rewind();
      bothTrue = true;
      mine.play();
    }  
    if (petTrue == true && bothTrue == true) {
      titleCounter++;
      println("the counter is " + titleCounter);
      text("You have mined the resource! Onto the game!", width / 2, height / 2 - 50);
      if (titleCounter >= 70) {
        gameState = 1;
        mine.rewind();
      }
    }
  }  
  if (gameState == 1) {
    bg1.createGrass();
    //create trees of number treeCount
    for (int i = 0; i < treeCount; i++) {
      critters[i].run();
      trees[i].show();
      trees[i].treeDead();
      trees[i].fireMove();
      //println(trees[i].xMoveOne);
      if (chariotCount < 4) {
        image(trees[i].trains[chariotCount % 4], planeX, planeY);
      }
      myPlayer.display();
      myPlayer.update();
      message();
      //display imageas long as count not greater than four, go through array according to number of resources harvested. 
      if (chariotCount >= 4) {        
        trees[i].planeMove();
        image(trees[i].trains[4], planeX, planeY);
      }
      //change game state when plane gets off screen, reset some variables and move player back to upper left corner. 
      if (planeX > width) {
        gameState = 2;
        chariotCount = 0;
        isFirstDone = true;
        //playerX = (int)myWorld.sandLocX;
        //playerY = (int)myWorld.sandLocY;
        critterCount = 10;
        playerX = 100;
        playerY = 100;
        moon.pause();
        moon.rewind();
        desert.play();
      }
    }
  }
  if (gameState == 2) {
    bg1.createSand();
    for (int i = 0; i < treeCount; i++) {
      critters[i].run();
      trees[i].show();
      trees[i].treeDead();
      trees[i].fireMove();
      myPlayer.display();
      myPlayer.update();
      message();
      if (chariotCount < 6) {
        image(trees[i].planes[chariotCount % 6], aircraftX + 30, aircraftY + 30);
      }
      if (chariotCount >= 6) {        
        trees[i].planeMove();
        image(trees[i].planes[6], aircraftX, aircraftY);
        //println(chariotCount);
      }
      if (aircraftX > width) {
        gameState = 4;
        chariotCount = 0;
        damageCount = 200;
        critterCount = 0;
        playerX = 50;
        playerY = 50;
        desert.pause();
        desert.rewind();
        ice.play();
      }
    }
  }
  if (gameState == 3) {
    myWorld.display();
    myWorld.checkLoc();
    //image(plane, planeX, planeY);
  }
  if (gameState == 4) {

    bg1.createIce();
    for (int i = 0; i < treeCount; i++) {
      critters[i].run();
      trees[i].show();
      trees[i].treeDead();    
      trees[i].fireMove();
      message();
      if (phoneCount < 5) {
        image(trees[i].phones[phoneCount % 6], 20, 20);
        if (phoneCount >= 1) {
          stage5Hit = true;
        }
      }
      myPlayer.display();
      myPlayer.update();
      if (phoneCount >= 5) {
        counter++;
        if (counter < 1900) {
          centerPhoneX += 20;
          centerPhoneY += 20;
          message();
        } else if (counter >= 1900) {
          gameState = 5;
          damageCount = 250;
          playerX = 20;
          playerY = 20;
          ice.pause();
          ice.rewind();
          death.play();
        }
      }
    }
  }
  if (gameState == 5) {
    ice.pause();
    bg1.createWood();
    message();
    game5Counter++;
    for (int i = 0; i < treeCount; i++) {
      if (game5Counter < 200) {
        critters[i].run();
        trees[i].show();
        trees[i].treeDead();    
        trees[i].fireMove();
        image(trees[i].fan[fanCount % 6], 20, 20);
        myPlayer.display();
        myPlayer.update();
        println("glass used is "+ trees[i].glassUsed);
        if (fanCount >= 6) {
          gameState = 6;
        }
      }
    }
  }
  if (gameState == 6) {
    //reset all boolean and necessary int variables for the game and counteers. 
    fanCount = 0;
    phoneCount = 0;
    chariotCount = 0;
    damageCount = 0;
    bothTrue = false;
    petTrue = false; 
    critterCount = 0;
    counter = 0;
    message();
    game5Counter = 0;
    titleCounter = 0;
    planeX = 20;
    aircraftX = 20;
    playerX = 100;
    playerY = 100;
    stage5Hit = false;
    for (int i = 0; i < treeCount; i++) {
      trees[i].reset();
      critters[i].reset();
    }
    if (hammer > 5) {
      gameState = 7;
      moon.play();
      death.pause();
      death.rewind();
    }
  }
}
void serialEvent(Serial myPort) {
  String temp=myPort.readStringUntil('\n');
  temp=trim(temp);
  if (temp != null) {
    int values[]=int(split(temp, ','));
    //split string of inputs by commas and end at line break "/n"
    //int y, x, button;
    if (values.length == 4) {
      xMove =(int)(values[0]);
      yMove =(int)(values[1]);
      hammer = (int)(values[2]);
      button =(int)(values[3]);

      xMove =(int) map(xMove, 0, 1023, -1, 1);
      yMove =(int) map(yMove, 0, 1023, 1, -1);
    }
  }
}
//function with different messages/prompts to be displayed to player.
void message() {
  if (chariotCount < 6 && gameState == 1) {
    if (critterCount < 3) {
      rectCreate();
      text("Pet the horses and enjoy nature!", width / 2, height - 60);
    } else if (critterCount <= 5) {
      rectCreateWhite();
      text("See how much they love you?", width / 2, height - 60);
    } else if (critterCount >= 5) {
      rectCreate();
      text("Pick up the hammer and chop down 6 trees to build the train!", width / 2, height - 60);
    }
  }

  if (gameState == 2) {
    if (chariotCount < 6) {
      if (critterCount < 14) {
        rectCreate();
        text("You find yourself in the desert, pet the beautiful blue scarabs!", width / 2, height - 60);
      } else if (critterCount >= 14) {
        rectCreateWhite();
        text("You have grown tired of the old ways of commuting, mine 6 pieces of coal to build a plane!", width / 2, height - 60);
      }
    } else if (chariotCount >= 6) {
      rectCreate();
      text("Onwards to Antarctica!", width / 2, height - 60);
    }
  }
  if (gameState == 4) {
    if (phoneCount < 5) {
      if (critterCount < 2) {
        rectCreate();
        text("The animals fear you! Try to pet them!", width / 2, height - 60);
      } else if (critterCount >= 2 && stage5Hit == false) {
        rectCreateWhite();        
        text("You crave the newest phone! Mine 6 silver ingots to make it!", width / 2, height - 60);
      } else if (critterCount >= 2 && stage5Hit == true) {
        rectCreateWhite();        
        text("Ignore the fires! Keep on mining the silver!", width / 2, height - 60);
      }
    }  
    if (phoneCount >= 5) {
      rectMode(CENTER);
      fill(0);
      rect(width / 2, height / 2, width, height);
      fill(255);
      textAlign(CENTER);
      textSize(32);      
      text("Congratulations you have the newest phone!", width / 2, height / 2 - 50);
      text("To cool you off from the heat, make a fan that plugs into your phone!", width / 2, height / 2);
    }
  }
//use the counter to display information until 200 is reached
  if (gameState == 5) {
    if (game5Counter < 200) {
      rectCreate();
      text("The world around you is burning!", width / 2, height - 60);
      text("Mine the resources needed for a fan that conveniently plugs into your phone to help cool you off!", width / 2, height - 20);
    } else if (game5Counter >= 200) {
      gameState = 6;
    }
  }

  if (gameState == 6) {
    rectMode(CENTER);
    fill(0);
    rect(width / 2, height / 2, width, height);
    fill(255);
    textAlign(CENTER);
    textSize(32);      
    text("You lack the resources to create the newest device...", width / 2, height / 2);
    text("Hit the resource with the hammer to play again", width / 2, height / 2 + 100);
    text("Take care of the world and what it gives you...", width / 2, height / 2 - 50);
  }
}
//function to create text on bottom of page.
void rectCreate() {
  rectMode(CORNER);
  fill(0);
  rect(0, height - 120, width, 120);
  fill(255);
  textAlign(CENTER);
  textSize(32);
  textAlign(CENTER);
  textSize(32);
}  
//alternate this text with a different color (white)
void rectCreateWhite() {
  rectMode(CORNER);
  fill(255);
  rect(0, height - 120, width, 120);
  fill(0);
  textAlign(CENTER);
  textSize(32);
  textAlign(CENTER);
  textSize(32);
}  

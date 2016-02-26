class Player {
  int playerLoc, plaSize;
  float plaX, plaY;
  int speed = 2;
  float plaVY = 0;


  Player(int playerLocIn) {
    playerLoc = playerLocIn;    
    plaSize = brickSize;
    plaX = 150;
    plaY = height/4;
    if (playerLocIn == 2) {
      plaY = height/4*3;
    }
  }

  void draw() {
    rect(plaX, plaY, plaSize, plaSize);
  }
  void cycle() {
    if(map.isBlockUnder(plaX,plaY)){
      plaVY = 0;
    }
    else{
      plaVY ++;
    }
    plaY += plaVY;
    
    if (playerLoc == 1) {
      if (keys[0]) {
        plaX-=speed;
      }
      if (keys[1]) {
        plaX+=speed;
      }
      if (keys[2]) {
        plaVY-=speed;
      }
      if (keys[3]) {
        plaY+=speed;
      }
    } else if (playerLoc == 2) {
      if (keys[10]) {
        plaX-=speed;
      }
      if (keys[11]) {
        plaX+=speed;
      }
      if (keys[12]) {
        plaY-=speed;
      }
      if (keys[13]) {
        plaY+=speed;
      }
    }
  }
}
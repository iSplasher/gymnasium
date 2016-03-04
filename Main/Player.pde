class Player extends Man {
  char[] playerKeys;

  Player(Game g, Map m) {
    super(g, m);
    pos.x = map.blockSize.x + size.x;
    pos.y = map.maxY - map.blockSize.y - marieImgSize.y;
    startingPos.x = pos.x;
    startingPos.y = pos.y;
    type = ObjectType.PLAYER;
    // husk! 0 = op, 1 = venstre, 2 = højre
    if (game.id == 1) {
      this.playerKeys = new char[] {'f', 'r', 'y'};
    } else {
      this.playerKeys = new char[] {',', 'n', 'o'};
    }
    m.movingObjects.add(this);
    jumpHeight = 12f;
  }

  void draw() {
    fill(255,255,0);
    image(marieImg, pos.x-(marieImgSize.x)/4, pos.y-marieImgSize.y+size.y);
  }
  
  void keyPressListener(char k) {
    if (k == playerKeys[0]) { // op
       jump();
       //direction = Direction.UP_D;
    } else if (k == playerKeys[1]) { // venstre
       direction = Direction.LEFT_D;
    } else if (k == playerKeys[2]) { // højre
       direction = Direction.RIGHT_D;
    }
  }
  
  void keyReleaseListener(char k) {
    for (char c : playerKeys) {
      if (k == c && k != playerKeys[0]) {
        direction = Direction.NO_D;
      }
   }
  }
}
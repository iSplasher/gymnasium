class Player extends Man {
  char[] playerKeys;

  Player(Game g, Map m) {
    super(g, m);
    pos.x = width/2;
    type = ObjectType.PLAYER;
    // husk! 0 = op, 1 = venstre, 2 = højre
    if (game.id == 1) {
      this.playerKeys = new char[] {'w', 'a', 'd'};
    } else {
      this.playerKeys = new char[] {'i', 'j', 'l'};
    }
  }

  void draw() {
    fill(255,255,0);
    handleMovement();
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  void keyPressListener(char k) {
    if (k == playerKeys[0]) { // op
       jump();
       direction = Direction.UP_D;
    } else if (k == playerKeys[1]) { // venstre
       direction = Direction.LEFT_D;
    // } else if (k == playerKeys[2]) { // ned
    //   state = ManState.DUCKING;
    //   direction = Direction.NO_D;
    } else if (k == playerKeys[2]) { // højre
       direction = Direction.RIGHT_D;
    }
  }
  
  void keyReleaseListener(char k) {
    for (char c : playerKeys) {
      if (k == c) {
        direction = Direction.NO_D;
      }
   }
  }
}
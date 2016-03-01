

class Player extends Man {
  char[] playerKeys;

  Player(Game g, Map m) {
    super(g, m);
    pos.x = width/2;
    
    // husk! 0 = op, 1 = venstre, 2 = ned, 3 = højre
    if (game.id == 1) {
      this.playerKeys = new char[] {'w', 'a', 's', 'd'};
    } else {
      this.playerKeys = new char[] {'i', 'j', 'k', 'l'};
    }
  }

  void draw() {
    fill(255,255,0);
    
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  void keyPressListener(char k) {
    if (k == playerKeys[0]) { // op
       state = ManState.JUMPING;
    } else if (k == playerKeys[1]) { // venstre
      if (state != ManState.JUMPING) {
        state = ManState.WALKING;
      }
       direction = Direction.LEFT_D;
    } else if (k == playerKeys[2]) { // ned
       state = ManState.DUCKING;
       direction = Direction.NO_D;
    } else if (k == playerKeys[3]) { // højre
       if (state != ManState.JUMPING) {
        state = ManState.WALKING;
      }
       direction = Direction.RIGHT_D;
    }
  }
  
  void keyReleaseListener(char k) {
    if (state != ManState.JUMPING) {
      for (char c : playerKeys) {
      if (k == c) {
        state = ManState.STANDING;
        direction = Direction.NO_D;
      }
      }
  }
}
}
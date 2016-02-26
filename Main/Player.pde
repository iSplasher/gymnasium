enum PlayerState {
    JUMPING,
    STANDING,
    WALKING,
    DUCKING
  }
  
enum Direction {
  LEFT_D,
  RIGHT_D,
  MIDDLE
}

class Player {
  int playerId;
  PlayerState state;
  Direction direction;
  char[] playerKeys;
  int minY;
  int maxY;
  Map playerMap;
  int plaHeight = 50;
  int plaWidth = 50;
  float plaX, plaY;
  int speed = 2;
  int jumpSpeed = 10;
  float jumpHeight = 100;
  float jumpFrame;

  Player(int id, int mY, int maY, Map map) {
    this.playerId = id;
    this.minY = mY;
    this.maxY = maY;
    this.playerMap = map;
    this.state = PlayerState.STANDING;
    this.jumpFrame = 0.0;
    this.plaX = width/2;
    this.plaY = maxY - plaHeight - map.blockHeight;
    
    // husk! 0 = op, 1 = venstre, 2 = ned, 3 = højre
    if (id == 1) {
      this.playerKeys = new char[] {'w', 'a', 's', 'd'};
    } else {
      this.playerKeys = new char[] {'i', 'j', 'k', 'l'};
    }
  }
  
  void checkOutOfBounds() {
    if (this.plaX < 0) {
      this.plaX = 0;
    } else if (this.plaX > width) {
      this.plaX = width - plaWidth;
    }
    
    if (this.plaY < this.minY) {
      this.plaY = this.minY;
    } else if (this.plaY > this.maxY) {
      this.plaY = this.maxY - plaHeight;
    }
  }
  
  void playerWalk(Direction d, float realY) {
    float newX;
    switch(d) {
      case LEFT_D:
        newX = this.plaX - speed;
        break;
      case RIGHT_D:
        newX = this.plaX + speed;
        break;
      default:
        newX = this.plaX;
        break;
    }
    if (!playerMap.isTouchingBlock(newX, realY, '1')) {
      this.plaX = newX;
    }
  }

  void draw() {
    checkOutOfBounds();
    fill(255,255,0);
    float realY = this.plaY;
    switch(state) {
      case WALKING:
        playerWalk(direction, realY);
        break;
      case JUMPING:
         float newY = realY - sin(radians(this.jumpFrame)) * jumpHeight;
         if (playerMap.isTouchingBlock(this.plaX, realY, '1')) {
           this.jumpFrame = this.jumpFrame < 91 ? 91 : this.jumpFrame;
         } else {
           realY = newY;
         }
         this.jumpFrame += jumpSpeed;
         if (this.jumpFrame > 180) {
           this.jumpFrame = 0;
           state = PlayerState.STANDING;
         }
         playerWalk(direction, realY);
         break;
      default:
        break;
    }
    
  rect(plaX, realY, plaHeight, plaWidth);
  }
  
  void keyPressListener(char k) {
    if (k == playerKeys[0]) { // op
       state = PlayerState.JUMPING;
    } else if (k == playerKeys[1]) { // venstre
      if (state != PlayerState.JUMPING) {
        state = PlayerState.WALKING;
      }
       direction = Direction.LEFT_D;
    } else if (k == playerKeys[2]) { // ned
       state = PlayerState.DUCKING;
       direction = Direction.MIDDLE;
    } else if (k == playerKeys[3]) { // højre
       if (state != PlayerState.JUMPING) {
        state = PlayerState.WALKING;
      }
       direction = Direction.RIGHT_D;
    }
  }
  
  void keyReleaseListener(char k) {
    if (state != PlayerState.JUMPING) {
      for (char c : playerKeys) {
      if (k == c) {
        state = PlayerState.STANDING;
        direction = Direction.MIDDLE;
      }
    }
    }
  }
}
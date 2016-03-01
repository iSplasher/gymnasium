abstract class Man {
  Game game;
  ManState state;
  Direction direction;
  Map map;
  PVector size = new PVector(30, 30);
  PVector pos;
  PVector velocity = new PVector(5, 5);
  PVector acceleration = new PVector(1.2, 1.1);
  float jumpHeight = 5;
  float jumpFrame;
  
  Man(Game g, Map m) {
    game = g;
    map = m;
    pos = new PVector(0, g.maxY-map.blockSize.y);
    state = ManState.STANDING;
    direction = Direction.NO_D;
  }
  
  void move(Direction d) {
    float newX = pos.x;
    switch(d) {
      case LEFT_D:
        newX -= velocity.x * acceleration.x;
        break;
      case RIGHT_D:
        newX += velocity.x * acceleration.x;
      break;
    }
    
    if (!map.isTouchingBlock(newX, pos.y)) {
      pos.x = newX;
    }
  }
  
  Direction collision() {
    // left
    if (map.isTouching(pos.x, pos.y+(size.y/2))) {
      return Direction.LEFT_D;
    }
    // top
    if (map.isTouching(pos.x+(size.x/2), pos.y)) {
      return Direction.TOP_D;
    }
    // right
    if (map.isTouching(pos.x+size.x, pos.y+(size.y/2))) {
      return Direction.RIGHT_D;
    }
    // bottom
    if (map.isTouching(pos.x+(size.x/2), pos.y+size.y)) {
      return Direction.BOTTOM_D;
    }
    
    return Direction.NO_D;
  }
  
  void handleState(){
    float realY = pos.y;
    switch(state) {
      case WALKING:
        move(direction);
        break;
      case JUMPING:
         float newY = realY - sin(radians(this.jumpFrame)) * jumpHeight;
         if (map.isTouchingBlock(pos.x, realY)) {
           this.jumpFrame = this.jumpFrame < 90 ? 91 : this.jumpFrame;
         } else {
           realY = newY;
         }
         this.jumpFrame += velocity.y;
         if (this.jumpFrame > 180) {
           this.jumpFrame = 0;
           state = ManState.STANDING;
         }
         move(direction);
         break;
      default:
        break;
    }
    pos.y = realY;
  }
  
  abstract void draw();
  
}
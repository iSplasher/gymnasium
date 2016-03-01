abstract class Man {
  Game game;
  Direction direction;
  Map map;
  PVector size = new PVector(30, 30);
  PVector pos;
  PVector velocity = new PVector(0, 0);
  float gravity = 0.5f;
  boolean isJumping = false;
  float jumpHeight = 10f;
  
  Man(Game g, Map m) {
    game = g;
    map = m;
    pos = new PVector(0, g.maxY-map.blockSize.y-size.y);
    direction = Direction.NO_D;
  }
  
  void move() {
    
    velocity.y += gravity;
    float newX = pos.x;
    float newY = pos.y;
    newX += velocity.x;
    newY += velocity.y;
    
    println(newX, pos.x, velocity.x, isJumping);
    if (!map.isTouchingBlock(new PVector(pos.x, newY), size)) {
      pos.y = newY;
    } else {
      velocity.y = 0;
      isJumping = false;
    }
    
    if (!map.isTouchingBlock(new PVector(newX, pos.y), size)) {
      pos.x = newX;
    }
    
  }
  
  void jump() {
    if (!isJumping) {
          isJumping = true;
          velocity.y = -jumpHeight;
     }
  }
  
  void handleMovement(){
    switch(direction) {
      case RIGHT_D:
        velocity.x = 10;
        break;
      case LEFT_D:
        velocity.x = -10;
        break;
      case NO_D:
        velocity.x = 0;
        break;
    }
   move();
  }
  
  abstract void draw();
  
}
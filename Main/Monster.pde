enum MonsterType {
  WALKING,
  JUMPING
}

class Monster extends Man {
  MonsterType mType;
  
  Monster(float x, float y, MonsterType t, Game g, Map m) {
    super(g, m);
    type = ObjectType.MONSTER;
    pos.x = x;
    pos.y = y;
    mType = t;
    if (mType == MonsterType.WALKING) {
      direction = Direction.LEFT_D;
    }
    jumpHeight = 7;
  }
  
  void handleMovement() {
    switch(mType){
      case WALKING:
        if (map.isTouchingBlock(new PVector(pos.x-10, pos.y), size)) {
          direction = Direction.RIGHT_D;
        } else if (map.isTouchingBlock(new PVector(pos.x+10, pos.y), size)) {
          direction = Direction.LEFT_D;
        }
        break;
      case JUMPING:
        jump();
        break;
    }
    
    super.handleMovement();
  }
  
  void draw() {
    fill(0, 255, 0);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
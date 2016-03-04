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
    size = monsterImgSize;
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
    
    Man m = map.isTouchingPlayer(this);
    if (m != null) {
      m.pos.x = m.startingPos.x;
      m.pos.y = m.startingPos.y;
    }
  }
  
  void draw() {
    fill(0, 255, 0);
    image(monsterImg, pos.x, pos.y);
  }
}
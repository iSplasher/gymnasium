enum ObjectiveType {
  POLONIUM,
  THORIUM
}

class Objective extends Man {
  ObjectiveType oType;
  
  Objective(float x, float y,ObjectiveType ot, Game g, Map m) {
    super(g, m);
    pos.x = x;
    pos.y = y;
    oType = ot;
    type = ObjectType.OBJECTIVE;
  }
  
  void handleMovement() {
    super.handleMovement();
    Man m = map.isTouchingPlayer(this);
    if (m != null) {
      switch(oType) {
        case THORIUM:
            game.drawTextLabel("Thorium er et grundstof med symbolet Th og atomnummer 90 i det periodiske system. Thorium er et radioaktivt metal, hvilket Marie Curie fandt ud af.", 7);
            break;
        case POLONIUM:
            game.drawTextLabel("Polonium er et grundstof med atomnummer 84 i det periodiske system, og har det kemiske symbol Po. Polonium er opkaldt efter Marie Curies oprindelsesland (Polen).", 7);
            break;
      }
      game.nobelsAcquired += 1;
      map.removeMan(this);
    }
  }
  
  void draw() {
    fill(0, 0, 255);
    switch(oType) {
      case POLONIUM:
        image(uranImg, pos.x, pos.y);
        break;
      case THORIUM:
      image(thoriumImg, pos.x, pos.y);
        break;
    }
  }
}
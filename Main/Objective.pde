enum ObjectiveType {
  URAN,
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
  
  void draw() {
    fill(0, 0, 255);
    rect(pos.x, pos.y, size.x, size.y);
    fill(255, 255, 255);
    String txt = "";
    switch(oType) {
      case URAN:
        txt = "Uran";
        break;
      case THORIUM:
        txt = "Thorium";
        break;
    }
    text(txt, pos.x+2, pos.y+(size.y/2));
  }
}
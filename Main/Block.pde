class Block {
  PVector pos;
  PVector size;
  Block(Map m, float x, float y) {
    pos = new PVector(x, y);
    size = m.blockSize;
  }
  
  boolean collision(float x, float y) {
    if (x > pos.x && x <pos.x+size.x && y > pos.y && y < pos.y+size.y) {
       return true;
         }
    return false;
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
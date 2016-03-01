class Block {
  PVector pos;
  PVector size;
  Block(Map m, float x, float y) {
    pos = new PVector(x, y);
    size = m.blockSize;
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
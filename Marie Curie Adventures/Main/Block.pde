class Block {
  PVector pos;
  PVector size;
  Block(Map m, float x, float y) {
    pos = new PVector(x, y);
    size = m.blockSize;
  }
  
  void draw() {
    fill(255, 0, 0);
    image(blockImg, pos.x, pos.y);
  }
}
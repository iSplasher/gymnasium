class Map {
  color background = color(5, 86, 255);
  ArrayList<Man> movingObjects = new ArrayList<Man>();
  ArrayList<Block> blocks = new ArrayList<Block>();
  int minY;
  int maxY;
  PVector mapSize;
  PVector blockSize;
  PVector blockCount = new PVector(30, 15);
  
  Map(int mY, int maY) {
   minY = mY;
   maxY = maY;
   mapSize = new PVector(width, maxY - minY);
   blockSize = new PVector(mapSize.x/blockCount.x, mapSize.y/blockCount.y);
   
   fromFile("map.txt");
  }
  
  void fromFile(String filename) {
    BufferedReader reader;
    String line;
    reader = createReader(filename);
    boolean read = true;
    int cY = 0;
    while(read) {
      try {
        line = reader.readLine();
      } catch (IOException e) {
        e.printStackTrace();
        line = null;
    }
    if (line == null) {
      read = false;
    } else {
      int cX = 0;
      for (char ch : line.toCharArray()) {
        float x = cX*blockSize.x;
        float y = cY*blockSize.y;
        switch(ch) {
          case '1':
            blocks.add(new Block(this, x, minY+y));
            break;
          case '2':
            // monster her
            break;
        }
        ++cX;
      }
      ++cY;
    }
  }
  }
  
  boolean isTouching(float x, float y) {
    for (Man m : movingObjects) {
      if (x > m.pos.x && x < m.pos.x+m.size.x && y > m.pos.y && y < m.pos.y+m.size.y) {
           return true;
         }
    }
    return false;
  }
  
  boolean isTouchingBlock(float x, float y){
    
    for (Block b : blocks) {
      if (b.collision(x,y)) {
        return true;
      }
    }
    return false;
  }
  
  void draw() {
    fill(background);
    rect(0, minY, width, maxY-minY);
    for (Block b : blocks) {
      b.draw();
    }
    for (Man m : movingObjects) {
      m.handleState();
      m.draw();
    }
  }
  
  int[] getBrickPos(int brickX, int brickY) {
    int x, y;
    
    x = brickX * (int)this.blockSize.x;
    y = brickY * (int)this.blockSize.y;
    if (this.minY != 0) {
      y += minY;
    }
    int[] pos = {x, y};
    return pos;
  }
}
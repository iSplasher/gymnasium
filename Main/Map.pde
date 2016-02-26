class Map {
  color background = color(5, 86, 255);
  int minY;
  int maxY;
  int mapHeight;
  int mapWidth = width;
  int blockCountX = 20;
  int blockCountY = 10;
  float blockWidth;
  float blockHeight;
  char[][] bricks = new char[blockCountX][blockCountY];
  
  Map(int mY, int maY) {
   this.minY = mY;
   this.maxY = maY;
   this.mapHeight = maxY - minY;
   this.blockWidth = this.mapWidth/blockCountX;
   this.blockHeight = this.mapHeight/blockCountY;
   
   blocksFromFile("map.txt");
  }
  
  void blocksFromFile(String filename) {
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
        bricks[cX][cY] = ch;
        ++cX;
      }
      ++cY;
    }
  }
  }
  
  boolean isTouchingBlock(float x, float y, char c){
    
    for (int i = 0; i < bricks.length; ++i) {
      for (int j = 0; j < bricks[i].length; ++j) {
        char ch = bricks[i][j];
        if (ch == c) {
         int[] blockPos = getBrickPos(i, j);
         int bX = blockPos[0];
         int bY = blockPos[1];
         if (x > bX && x < bX+blockWidth && y > bY && y < bY+blockHeight) {
           return true;
         }
      }
      }
    }
    return false;
  }
  
  void draw() {
    fill(background);
    rect(0, minY, width, maxY-minY);
    drawBlocks();
  }
  
  int[] getBrickPos(int brickX, int brickY) {
    int x, y;
    
    x = brickX * (int)this.blockWidth;
    y = brickY * (int)this.blockHeight;
    if (this.minY != 0) {
      y += minY;
    }
    int[] pos = {x, y};
    return pos;
  }
  
  void drawBlocks() {
    fill(255, 0, 0);
    for (int i = 0; i < bricks.length; ++i) {
      for (int j = 0; j < bricks[i].length; ++j) {
         char ch = bricks[i][j];
         if (ch == '1') {
           int[] blockPos = getBrickPos(i, j);
           rect(blockPos[0], blockPos[1], this.blockWidth, this.blockHeight);
         }
      }
    }
  }
}
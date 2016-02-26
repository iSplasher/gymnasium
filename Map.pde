class Map {
  color background = color(5, 86, 255);
  int mapHeight = 16;
  int mapLength = 128;
  int[][] bricks = new int[mapLength][mapHeight];
  Map() {
    for (int x = 0; x < mapLength; x++) {
      for (int y = 0; y < mapHeight; y++) {
        bricks[x][y] = 0;
        if (y == 15) {
          bricks[x][y] = 1;
        }
      }
    }
  }
  boolean isBlockUnder(float x, float y){
    return true; 
  }
  void draw(int topBottom) {
    int minY = 0;
    int maxY = height/2;

    if (topBottom == 2) {
      minY = height/2;
      maxY = height;
    }
    
    fill(background);
    rect(0, minY, width, maxY-minY);
    drawBlocks(minY);
  }
  void drawBlocks(int minY) {

    fill(255, 255, 0);
    for (int x = 0; x < mapLength; x++) {
      for (int y = 0; y < mapHeight; y++) {
        if (bricks[x][y] == 1) {
          int posx = brickSize*x;
          int posy = brickSize*y+minY;
          rect(posx, posy, brickSize, brickSize);
        }
      }
    }
  }
}
class Game {
  int id;
  Map map;u
  Player player;
  int minY;
  int maxY;
  int nobelsAcquired = 0;
  
  // helper variables
  float left = 0;
  float right;
  float top;
  float bottom;
  float middleX;
  float middleY;
  PVector size;
  
  boolean playerWinOn = false;
  boolean textLabelOn = false;
  String currentText = "";
  int labelTimeElapsed = 0;
  int labelTimeSeconds = 0;
  int oldLabelSecs = 0;
  

  Game(int gid) {
    id = gid;
    if (gid == 1) {
      minY = 0;
      maxY = height/2;
    } else {
      minY = height/2;
      maxY = height;
    }
    
    right = width;
    top = minY;
    bottom = maxY;
    middleX = width/2;
    middleY = minY + (maxY-minY)/2;
    size = new PVector(width, maxY-minY);
    
    map = new Map(this, minY, maxY);
    player = new Player(this, map);
  }

  void draw() {
    map.draw();
    map.syncRemovedObjects();
    
    drawNobelPrizes();
    
    if (textLabelOn) {
      labelTimeElapsed = second() - oldLabelSecs;
      if (labelTimeElapsed > labelTimeSeconds) {
        textLabelOn = false;
        if (playerWinOn) {
          gameRunning = false;
          playerWinOn = false;
          resetGame();
          playerWon = 0;
        }
         if (nobelsAcquired >= 2 && !playerWinOn) {
            playerWinOn = true;
            playerWon = id;
            drawTextLabel("Du vandt!", 3);
          }
      }
      drawLabel();
    }
  }
  
  private void drawNobelPrizes() {
    float w = 55;
    float h = 30;
    int fMargin = 5;
    fill(255,207,64);
    PVector nobelPos = new PVector(middleX-fMargin, top+fMargin);
    rect(nobelPos.x, nobelPos.y, w, h);
    float xOffset = 0;
    for (int x = 0; x < nobelsAcquired; ++x) {
      image(nobelImg, nobelPos.x+fMargin+xOffset, nobelPos.y+fMargin);
      xOffset += nobelImgSize.x + fMargin;
    }
  }
  
  private void drawLabel() {
    drawLabel(false);
  }
  
 private void drawLabel(boolean win) {
    int lMargin = 2;
    float w = 500;
    float h = size.y - lMargin;
    PVector labelPos = new PVector(middleX-(w/2), top+lMargin);
    fill(0, 0, 0, 200);
    rect(labelPos.x, labelPos.y, w, h);
    fill(255);
    text(currentText, labelPos.x+5, labelPos.y+5, w, h);
 }
  
  void drawTextLabel(String txt, int secs) {
    oldLabelSecs = second();
    labelTimeSeconds = 2;
    textLabelOn = true;
    currentText = txt;
  }
  
}
  
enum Direction {
  LEFT_D,
  RIGHT_D,
  NO_D,
  UP_D,
  DOWN_D
}

enum ObjectType {
  MONSTER,
  PLAYER,
  OBJECTIVE
}
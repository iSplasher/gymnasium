class Map {
  Game game;
  color background = color(5, 86, 255, 150);
  ArrayList<Man> movingObjects = new ArrayList<Man>();
  ArrayList<Man> objectsToRemove = new ArrayList<Man>();
  ArrayList<Block> blocks = new ArrayList<Block>();
  int minY;
  int maxY;
  PVector mapSize;
  PVector blockSize;
  PVector blockCount = new PVector(30, 15);
  
  Map(Game g, int mY, int maY) {
   game = g;
   minY = mY;
   maxY = maY;
   mapSize = new PVector(width, maxY - minY);
   blockSize = new PVector(mapSize.x/blockCount.x, mapSize.y/blockCount.y);
   if (!initedBlockSize) {
     blockImg.resize((int)blockSize.x, (int)blockSize.y);
     initedBlockSize = true;
   }
   
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
            movingObjects.add(new Monster(x, minY+y-blockSize.y, MonsterType.WALKING, game, this));
            break;
          case '3':
            movingObjects.add(new Monster(x, minY+y-blockSize.y, MonsterType.JUMPING, game, this));
            break;
          case '4':
            movingObjects.add(new Objective(x, minY+y-blockSize.y, ObjectiveType.POLONIUM, game, this));
            break;
          case '5':
            movingObjects.add(new Objective(x, minY+y-blockSize.y, ObjectiveType.THORIUM, game, this));
            break;
        }
        ++cX;
      }
      ++cY;
    }
  }
  }
  
  boolean intersect(PVector pos1, PVector size1, PVector pos2, PVector size2) {
  return (pos1.x <= pos2.x + size2.x &&
          pos2.x <= pos1.x + size1.x &&
          pos1.y <= pos2.y + size2.y &&
          pos2.y <= pos1.y + size1.y);
  }
  
  Man isTouchingPlayer(Man man) {
    for (Man m : movingObjects) {
      if (intersect(man.pos, man.size, m.pos, m.size)) {
          if (m.type == ObjectType.PLAYER) {
            return m;
          }
         }
    }
    return null;
  }
  
  void removeMan(Man m) {
    objectsToRemove.add(m);
  }
  
  void syncRemovedObjects() {
    for (Man m : objectsToRemove) {
      movingObjects.remove(m);
    }
  }
  
  boolean isTouchingBlock(PVector pos, PVector size){
    
    for (Block b : blocks) {
      if (intersect(pos, size, b.pos, b.size)) {
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
      if (!game.textLabelOn) {
        m.handleMovement();
      }
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
class Game {
  int id;
  Map map;
  Player player;
  int minY;
  int maxY;

  Game(int gid) {
    id = gid;
    if (gid == 1) {
      minY = 0;
      maxY = height/2;
    } else {
      minY = height/2;
      maxY = height;
    }
    map = new Map(this, minY, maxY);
    player = new Player(this, map);
  }

  void draw() {
    map.draw();
    player.draw();
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
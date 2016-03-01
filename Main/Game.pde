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
    map = new Map(minY, maxY);
    player = new Player(this, map);
  }

  void draw() {
    map.draw();
    player.handleState();
    player.draw();
  }
}

enum ManState {
    JUMPING,
    STANDING,
    WALKING,
    DUCKING
  }
  
enum Direction {
  LEFT_D,
  RIGHT_D,
  NO_D,
  TOP_D,
  BOTTOM_D
}
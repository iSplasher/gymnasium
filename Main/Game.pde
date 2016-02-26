class Game {
  Map map;
  Player player;

  Game(int playerId) {
    int minY;
    int maxY;
    if (playerId == 1) {
      minY = 0;
      maxY = height/2;
    } else {
      minY = height/2;
      maxY = height;
    }
    map = new Map(minY, maxY);
    player = new Player(playerId, minY, maxY, map);
  }

  void draw() {
    map.draw();
    player.draw();
  }
}
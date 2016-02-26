class Game {
  int playerPos;
  Player player;

  Game(int playerId) {
    playerPos = playerId;
    player = new Player(playerPos);
  }

  void draw() {
    map.draw(playerPos);
    player.cycle();
    player.draw();
  }
}
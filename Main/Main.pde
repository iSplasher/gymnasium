int brickSize = 32;
Game game1, game2;
void setup(){
  //fullScreen(2);
  size(800, 600); //size(1280,1024);
  game1 = new Game(1);
  game2 = new Game(2);
}

void draw(){
    background(0);
    game1.draw();
    game2.draw();
}

void keyPressed()
{
  game1.player.keyPressListener(key);
  game2.player.keyPressListener(key);
}

void keyReleased()
{
  game1.player.keyReleaseListener(key);
  game2.player.keyReleaseListener(key);
} 
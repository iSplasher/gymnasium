int keyNr = 20;
boolean keys[] = new boolean[keyNr];

Map map;
int brickSize = 32;
Game game1,game2;
void setup(){
  //fullScreen(2);
  size(1280,1024);
  map = new Map();
  game1 = new Game(1);
  game2 = new Game(2);
  
  for(int i = 0; i < keyNr; i++){
    keys[i] = false;
  }
}

void draw(){
    background(0);
    game1.draw();
    game2.draw();
}
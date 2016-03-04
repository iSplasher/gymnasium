PImage mariecurie;
PImage nobelImg;
PVector nobelImgSize = new PVector(20, 20);
PImage blockImg;
PVector blockImgSize;
boolean initedBlockSize = false;
PImage monsterImg;
PVector monsterImgSize = new PVector(30, 30);
PImage marieImg;
PVector marieImgSize = new PVector(60, 60);

PImage uranImg;
PImage thoriumImg;
PVector objSize = new PVector(30, 30);
int playerWon = 0;
boolean gameRunning = false;

Game game1, game2;

void setup(){
  fullScreen();
  frameRate(60);
  //size(1000, 600); //size(1280,1024);
  mariecurie = loadImage("mariecurie.jpg");
  blockImg = loadImage("block.jpg");
  nobelImg = loadImage("nobel.png");
  nobelImg.resize((int)nobelImgSize.x, (int)nobelImgSize.y);
  monsterImg = loadImage("monster.png");
  monsterImg.resize((int)monsterImgSize.x, (int)monsterImgSize.y);
  marieImg = loadImage("marie.png");
  marieImg.resize((int)marieImgSize.x, (int)marieImgSize.y);
  uranImg = loadImage("uran.png");
  thoriumImg = loadImage("thorium.png");
  uranImg.resize((int)objSize.x, (int)objSize.y);
  thoriumImg.resize((int)objSize.x, (int)objSize.y);
}

void draw(){
    background(255);
    textAlign(LEFT,LEFT);
    if (gameRunning) {
      runGame();
      if(playerWon != 0){
         fill(0);
         rect(0,0,width,height);
         textAlign(CENTER,CENTER);
         fill(255);
         textSize(50);
         text("Player "+playerWon+" has won the game! Gratz!",width/2,height/2);
      }
      textAlign(CENTER,CENTER);
      fill(255);
      textSize(20);
      //text("HINT: Marie Curie er ninja, og hvis du spampresser hop knappen, kan du hoppe på væggene!",width/2,height/2);
    } else {
      playerWon = 0;
      fill(5, 86, 255, 150);
      stroke(255);
      strokeWeight(10);
      rect(0,0, width, height);
      noStroke();
      fill(255, 255, 0);
      textSize(32);
      text("Marie Curie Adventures", (width/2)-(200/2), 50, 200, 100);
      fill(255);
      textSize(12);
      text("Marie Curie, (født 7. november 1867 i Warszawa og død 4. juli 1934) er en polskfødt fransk kemiker og fysiker. Hun nåede gennem sit liv at blive 66 år og er især kendt for sit arbejde med radioaktivitet, polonium og radium, hvor hun blandt andet fandt ud af at thorium var radioaktivt. På trods af alt det modstrid hun fik, formodede Marie Curie imod alle odds at vinde hele to nobelpriser.",
      (width/2)-(260/2), 200, 300, 500);
      fill(255, 255, 0);
      textSize(24);
      text("Jeres mission er at hjælpe Marie Curie med at vinde to nobelpriser! Undgå de radioaktive monstre og få fat i objektiverne først!",
      (width/2)-(900/2), 400, 900, 300);
      text("Tryk på en vilkårlig tast for at starte!", (width/2)-(500/2), height - 50);
      
      image(mariecurie, 50, 50);
      image(mariecurie, width-mariecurie.width-50, 50);
    }
}

void runGame() {
    game1.draw();
    game2.draw();
}

void resetGame() {
  game1 = new Game(1);
  game2 = new Game(2);
}

void keyPressed()
{
  if (game1 != null && game2 != null) {
      game2.player.keyPressListener(key);
  }
  if (key != ' ' && !gameRunning) {
    resetGame();
    gameRunning = true;
  }
}

void keyReleased()
{
  if (game1 != null && game2 != null) {
      game1.player.keyReleaseListener(key);
      game2.player.keyReleaseListener(key);
  }
} 
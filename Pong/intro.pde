int oneX = 100;
int oneY = 600;
int oneW = 200;
int oneH = 100;
int twoX = 500;
int twoY = 600;
int twoW = 200;
int twoH = 100;

void intro() {
  background(blue);
  gameover.pause();
  theme.play();

  //text
  fill(tan);
  textSize(100);
  text("PONG", width/2, height/2);

  //1 player button
  rectTactile(100, 600, 200, 100);
  fill(orange);
  textSize(25);
  text("Singleplayer", oneX + oneW/2, oneY + oneH/2);

  //2 player button
  rectTactile(twoX, twoY, twoW, twoH);
  fill(orange);
  textSize(25);
  text("Multiplayer", twoX + twoW/2, twoY + twoH/2);
}

void introClicks() {
    if (clickedRect(oneX, oneY, oneW, oneH)) {
    mode = GAME;
    leftScore = 0;
    rightScore = 0;
    timer = 100;
    showTextOne = true;
    AI = true;
  }
  
    if(clickedRect(twoX, twoY, twoW, twoH)) {
    mode = GAME;
    leftScore = 0;
    rightScore = 0;
    timer = 100;
    showTextTwo = true;
    AI = false;
  }
}

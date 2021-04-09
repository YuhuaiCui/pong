void gameover() {
  fill(lime);
  if (AI == false) {
    if (rightScore > leftScore) {
      rightScore = 3;
      text("RIGHT WINS!", width/2, height/2);
    }
    if (leftScore > rightScore) {
      leftScore = 3;
      text("LEFT WINS!", width/2, height/2);
    }
  } else if (AI == true) {
    if (rightScore > leftScore) {
      rightScore = 3;
      text("Computer WINS!", width/2, height/2);
    }
    if (leftScore > rightScore) {
      leftScore = 3;
      text("YOU WIN!", width/2, height/2);
    }
  }
}

void gameoverClicks() {
  mode = INTRO;
  leftScore = 0;
  rightScore = 0;
  leftY = height/2;
  rightY = height/2;
  ballX = width/2;
  ballY = height/2;
  showTextOne = showTextTwo = AI = false;
  rng = random (0, 4);
  if (rng < 1) {
    vx = 5;
    vy = 5;
  } else if (rng >= 1 && rng < 2) {
    vx = 5;
    vy = -5;
  } else if (rng >= 2 && rng < 3) {
    vx = -5;
    vy = 5;
  } else if (rng >= 3 && rng <= 4) {
    vx = -5;
    vy = -5;
  }
  theme.rewind();
  theme.play();
}

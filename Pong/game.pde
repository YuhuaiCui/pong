void game() {
  background(marroon);

  //center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);

  //scores
  if (leftScore == 3 || rightScore == 3) {
    mode = GAMEOVER;
    theme.pause();
    gameover.rewind();
    gameover.play();
  }

  //scoreboard
  textSize(50);
  strokeWeight(0);
  fill(gray);
  text(leftScore, width/4, 100);
  fill(sand);
  text(rightScore, 3*width/4, 100);

  //scoring
  if (ballX < 0) {
    rightScore++;
    if (AI == false) {
     coin.rewind();
     coin.play(); 
    } else if (AI == true) {
     bump.rewind();
     bump.play(); 
    }
    ballX = width/2;
    ballY = height/2;
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
    timer = 50;
  }

  if (ballX > width) {
    leftScore++;
    coin.rewind();
    coin.play();
    ballX = width/2;
    ballY = height/2;
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
    timer = 50;
  }

  //paddles
  strokeWeight(5);
  stroke(white);
  fill(gray);
  circle(leftX, leftY, leftD);
  fill(sand);
  circle(rightX, rightY, rightD);

  //ball
  circle(ballX, ballY, ballD);

  //ball movement
  if (timer < 0) {
    ballX = ballX + vx;
    ballY = ballY + vy;
  }

  //ball collision
  if (dist(leftX, leftY, ballX, ballY) <= (leftD + ballD)/2) {
    vx = vx * - 1;
    vx = (ballX - leftX)/15;
    vy = (ballY - leftY)/15;
  }
  if (dist(rightX, rightY, ballX, ballY) <= (rightD + ballD)/2) {
    vx = vx * - 1;
    vx = (ballX - rightX)/15;
    vy = (ballY - rightY)/15;
  }

  if (ballY < ballD/2 || ballY > height-ballD/2) {
    vy = vy * - 1;
  }

  //time and text
  fill(red);
  if (showTextOne == true && timer > 10) {
    text("Win by getting 3 points!", width/2, height/2);
  } else {
    showTextOne = false;
  }
  if (showTextTwo == true && timer > 10) {
    text("First to 3 WINS!", width/2, height/2);
  } else {
    showTextTwo = false;
  }
  timer = timer - 1;

  //move paddles
  if (wKey == true && leftY >= leftD/2) leftY = leftY - 3;
  if (sKey == true && leftY <= height-leftD/2) leftY = leftY + 3;
  if (AI == false) {
    if (upKey == true && rightY >= rightD/2) rightY = rightY - 3;
    if (downKey == true && rightY <= height-rightD/2) rightY = rightY + 3;
  } else if (AI == true) {
    if (rightY > ballY) {
      rightY = rightY - 3;
    } else if (rightY < ballY) {
      rightY = rightY + 3;
    }
  }
}

void gameClicks() {
  mode = PAUSE;
}

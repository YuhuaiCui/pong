void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}

void rectTactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(lightGray);
  } else {
    stroke(darkGray);
  }
  strokeWeight(5);
  fill(sea);
  rect(x, y, w, h);
}

boolean clickedRect (int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}


//button object testing
//class Button {
//  float xInt, yInt, wInt, hInt;
//  String whatActions;
//  Button (float x, float y, float w, float h) {
//    xInt = x;
//    yInt = y;
//    wInt = w;
//    hInt = h;
//    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
//      stroke(lightGray);
//    } else {
//      stroke(darkGray);
//    }
//  }
//  boolean clickedRectTest (float x, float y, float w, float h) {
//    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
//  }
//  void clicks() {
//    if (clickedRectTest(xInt, yInt, wInt, hInt)) {
//      //if (mouseX > xInt && mouseX < xInt + wInt && mouseY > yInt && mouseY < yInt + hInt) {
//    }
//  }
//}

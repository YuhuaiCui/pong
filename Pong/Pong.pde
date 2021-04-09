//Pong!
//Yuhuai (Daniel) Cui
//boing~ boing~

//minim stuff - dont touch
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
float leftX, leftY, leftD, rightX, rightY, rightD; //paddles
float ballX, ballY, ballD; //ball
float vx, vy; //ball movement
float rng;
boolean AI;

//keyboard variables
boolean wKey, sKey, upKey, downKey;

//score variables
int leftScore, rightScore, timer;
boolean showTextOne, showTextTwo = false;

//pallette
color marroon = #4A1726;
color sand = #CDB37A;
color gray = #525854;
color white = #EEEBE6;
color red = #E04735;
color lime = #CFF09E;
color darkGray = #4C4C4C;
color lightGray = #EFEFEF;
color sea = #A7DBD8;
color blue = #69D2E7;
color orange = #F38630;
color tan = #FA6900;

void setup() {
  size(800, 800);
  mode = INTRO;

  //minim
  minim = new Minim(this);
  theme = minim.loadFile("mario bros theme.mp3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");

  //initialize paddles
  leftX = 0;
  leftY = height/2;
  leftD = 200;

  rightX = width;
  rightY = height/2;
  rightD = 200;

  //initialize ball
  ballX = width/2;
  ballY = height/2;
  ballD = 100;
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

  //initialize keyboard variables
  wKey = sKey = upKey = downKey = false;
  
  textAlign(CENTER, CENTER);
} //end of setup

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
} //end of draw

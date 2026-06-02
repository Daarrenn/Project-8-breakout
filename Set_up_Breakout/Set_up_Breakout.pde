int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int DIFFICULTY = 4;

//font
PFont airStrike;

//pad
float leftx, lefty, leftd;

//ball
float ballx, bally, balld, bx, by;

//ball speed increase
float m;

void setup() {
  size(600, 800);
  //text stuff
  airStrike = createFont("airstrike.ttf", 100);
  textAlign(CENTER, CENTER);
  
  //paddles
  leftx = width/2;
  lefty = height-50;
  leftd = 150;
  
  //ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  bx = 4;
  by = 0;
  m = 1;
  
  
  
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE){
    pause();
  } else if (mode == GAMEOVER){
    gameover();
  } else if (mode == DIFFICULTY){
    difficulty();
  } else {
    println("oh no" + mode);
  }
}

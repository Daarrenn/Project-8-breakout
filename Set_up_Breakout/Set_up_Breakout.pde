int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int DIFFICULTY = 4;

//font
PFont airStrike;

//count
int countdown = 180;

//pad
float leftx, lefty, leftd;

//ball
float ballx, bally, balld, bx, by;

//ball speed increase
float m;

//bricked declaration
int i = 0; //while loop
int[] x;
int[] y;
boolean[] alive;
float brickd;
int n; //number of bricks
int tempX;
int tempY;
//key move
boolean akey, dkey;

//score and life
int score = 0;
int life = 3;

//pause
int countdownPause;
int counting;

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
  bally = 600;
  balld = 20;
  bx = 4;
  by = 5;
  m = 1;
  
  //bricks instantiatiom
  brickd = 50;
  n = 18;
  
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempX = 50;
  tempY = 100;
  int i = 0;
  while(i < n) {
    x[i] = tempX;
    y[i] = tempY;
    alive[i] = true;
    i = i + 1;
    tempX = tempX + 100;
    if(tempX > width) {
      tempX = 50;
      tempY = tempY + 100;
    }
  }

  
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

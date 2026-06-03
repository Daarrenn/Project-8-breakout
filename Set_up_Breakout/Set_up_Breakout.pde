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
float brickd;
int n; //number of bricks
int tempX;
int tempY;
//key move
boolean akey, dkey;

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
  by = 4;
  m = 1;
  
  //bricks instantiatiom
  brickd = 50;
  n = 30;
  
  x = new int[n];
  y = new int[n];
  tempX = 50;
  tempY = 50;
  i = 0;
  while(1 < n) {
    x[i] = tempX;
    y[i] = tempY;
    tempX = tempX + 100;
    if(tempX == width) {
      tempX = 100;
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

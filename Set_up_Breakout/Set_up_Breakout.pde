import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer FAILURE, MUSIC, SUCCESS;


int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int DIFFICULTY = 4;

//font
PFont airStrike;

//ok
color tactileColour = #FF0000;

//gif
PImage[] gif;
int frames;
int g;

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
  
  //minim
  minim = new Minim(this);
  FAILURE = minim.loadFile("FAILURE (1).wav");
  MUSIC = minim.loadFile("MUSIC (1).mp3");
  SUCCESS = minim.loadFile("SUCCESS (1).wav");
  
  
  //gif
  frames = 19;
  gif = new PImage[frames];
  
  int f = 0;
  while(f < frames) {
    gif[f] = loadImage("frame_"+f+"_delay-0.1s.gif");
    f = f + 1;
  }
  
  //paddles
  leftx = width/2;
  lefty = height-50;
  leftd = 150;
  
  //ball
  ballx = width/2;
  bally = 500;
  balld = 20;
  bx = 0;
  by = -3;
  m = 1;
  
  //bricks instantiatiom
  brickd = 45;
  n = 24;
  
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempX = 90;
  tempY = 100;
  int i = 0;
  while(i < n) {
    x[i] = tempX;
    y[i] = tempY;
    alive[i] = true;
    i = i + 1;
    tempX = tempX + 85;
    if(tempX > width-70) {
      tempX = 90;
      tempY = tempY + 70;
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

void squareTactile(int x, int x2, int y, int y2) {
  if(mouseX > x && mouseX < x2 && mouseY > y && mouseY < y2) {
    stroke(tactileColour);
  } else {
    stroke(0);
  }
}

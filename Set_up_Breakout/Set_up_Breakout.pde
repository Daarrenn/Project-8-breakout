int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int DIFFICULTY = 4;

//font
PFont airStrike;



void setup() {
  size(600, 800);
  //text stuff
  airStrike = createFont("airstrike.ttf", 100);
  textAlign(CENTER, CENTER);
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

void gameover() {
  background(0);
  fill(255);
  if (score == n) {
    textSize(75);
    text("YOU WIN!", width/2, 100);
  }
  if (life == 0) {
    textSize(75);
    text("YOU LOSE", width/2, 100);
  }
  strokeWeight(5);
  stroke(255);
  rect(50, 500, 225, 150);
  rect(325, 500, 225, 150);
  textSize(50);
  fill(0);
  text("play", 162, 550);//button one
  text("again", 162, 600);
  text("quit", 437, 575);

  int i = 0;
  i = i + 1;
  alive[i] = true;
}

void gameoverClicks() {
  if (mouseX > 50 && mouseX < 275 && mouseY > 500 && mouseY < 650) {
    mode = INTRO;
    ballx = width/2;
    bally = 500;
    balld = 20;
    bx = 0;
    by = -3;
    m = 1;
    score = 0;
    life = 3;
    x = new int[n];
    y = new int[n];
    alive = new boolean[n];
    tempX = 90;
    tempY = 100;
    int i = 0;
    while (i < n) {
      x[i] = tempX;
      y[i] = tempY;
      alive[i] = true;
      i = i + 1;
      tempX = tempX + 85;
      if (tempX > width-70) {
        tempX = 90;
        tempY = tempY + 70;
      }
    }
  }

  if (mouseX > 325 && mouseX < 550 && mouseY > 500 && mouseY < 650) {
    exit();
  }
}

void game() {
  background(0);
  MUSIC.play();

  //paddle
  fill(255);
  circle(leftx, lefty, leftd);

  //debug
  if (by == 0) {
    by = 1;
  }

  //pad move
  if (leftx>=0) {
    if (akey == true) leftx = leftx - 10;
  }
  if (leftx<=width) {
    if (dkey == true) leftx = leftx + 10;
  }


  //counter
  countdown = countdown - 1;

  //ui
  textSize(50);
  text("Score: " + score, width/2, 40);
  textSize(30);
  text("Lives: " + life, 500, 40);
  noFill();//pause
  stroke(255);
  strokeWeight(4);
  circle(40, 40, 40);
  fill(255);
  rect(30, 30, 6, 18, 50);
  rect(44, 30, 6, 18, 50);

  //ball move
  fill(255);
  if (countdown < 0) {
    ballx = ballx-bx;
    bally = bally-by;
  }

  //BRICKSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
  i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBricks(i);
    }
    i = i + 1;
  }
  //broken bricks

  //top bottom walls restrictions
  if (bally < balld/2) {
    by = by * -1;
  }
  if (bally > height-balld/2) {
    ballx = width/2;
    bally = 500;
    bx = 0;
    by = -3;
    m = 1;
    countdown = 180;
    life = life - 1;
    FAILURE.rewind();
    FAILURE.play();
  }

  //left right
  if (ballx < balld/2) {
    bx = bx * -1;
    ballx = balld/2;
  }

  if (ballx > width-balld/2) {
    bx = bx * -1;
    ballx = width-balld/2;
  }
  //ball
  fill(255);
  circle(ballx, bally, balld);

  //boing ball pad
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    bx = ((leftx-ballx)/10)*m;
    by = ((lefty-bally)/10)*m;
  }

  //counter
  fill(255);
  textSize(50);
  if (countdown < 181 && countdown > 120) {
    text("3", width/2, height/2);
  }
  if (countdown < 121 && countdown > 60) {
    text("2", width/2, height/2);
  }
  if (countdown < 61 && countdown > 0) {
    text("1", width/2, height/2);
  }
  //winningggggggggggggggg
  if (score == n) {
    mode=GAMEOVER;
    SUCCESS.rewind();
    SUCCESS.play();
  }
  if (life == 0) {
    mode=GAMEOVER;
    FAILURE.rewind();
    FAILURE.play();
  }
}

void gameClicks() {
  if (dist(mouseX, mouseY, 40, 40) < 20) {
    mode = PAUSE;
  }
}

void manageBricks(int i) {
  noStroke();
  if (y[i] == 100) fill(255, 0, 0);
  if (y[i] == 170) fill(255, 255, 0);
  if (y[i] == 240) fill(0, 255, 0);
  if (y[i] == 310) fill(0, 0, 255);
  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    bx = ((x[i]-ballx)/5)*m;
    by = ((y[i]-bally)/5)*m;
    m = m + 0.1;
    alive[i] = false;
    score = score + 1;
    SUCCESS.rewind();
    SUCCESS.play();
    
  }
}

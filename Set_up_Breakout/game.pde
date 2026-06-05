void game() {
  background(0);

  //paddle
  fill(255);
  circle(leftx, lefty, leftd);

  //pad move
  if (leftx>=0) {
    if (akey == true) leftx = leftx - 10;
  }
  if (leftx<=width) {
    if (dkey == true) leftx = leftx + 10;
  }


  //counter
  countdown = countdown - 1;

  //ball move
  fill(255);
  if (countdown < 0) {
    ballx = ballx-bx;
    bally = bally-by;
  }

  //BRICKSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
  i = 0;
  while (i < n) {
    circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    bx = ((x[i]-ballx)/10)*m;
    by = ((y[i]-bally)/10)*m;
    alive[i] = false;
  }
  i = i + 1;
  }
  
  //broken bricks
  
  //top bottom walls restrictions
  if (bally < balld/2 || bally > height-balld/2) {
    by = by * -1;
  }

  //left right
  if (ballx < balld/2 || ballx > width-balld/2)
    bx = bx * -1;

  //ball
  circle(ballx, bally, balld);

  //boing ball pad
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    bx = ((leftx-ballx)/10)*m;
    by = ((lefty-bally)/10)*m;
  }

  //counter
  fill(0);
  if (countdown < 181 && countdown > 120) {
    text("3", width/2, height/2);
  }
  if (countdown < 121 && countdown > 60) {
    text("2", width/2, height/2);
  }
  if (countdown < 61 && countdown > 0) {
    text("1", width/2, height/2);
  }
}

void gameClicks() {
}

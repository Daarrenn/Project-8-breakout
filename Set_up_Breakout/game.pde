void game() {
  background(0);

  //paddle
  fill(255);
  circle(leftx, lefty, leftd);
  
  //debug
  if(bx == 0){
    bx = 1;
  }
  if(by == 0){
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
  if(bally > height-balld/2){
    ballx = width/2;
    bally = 600;
    bx = 4;
    by = 5;
    countdown = 180;
    life = life - 1;
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
  fill(255);
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
  if(score == n){
    mode=GAMEOVER;
  }
  if(life == 0){
    mode=GAMEOVER;
  }
  
}

void gameClicks() {
  if(dist(mouseX, mouseY, 40, 40) < 20){
    mode = PAUSE;
  }
}

void manageBricks(int i) {
  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    bx = ((x[i]-ballx)/5)*m;
    by = ((y[i]-bally)/5)*m;
    alive[i] = false;
    score = score + 1;
  }
}

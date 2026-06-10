void pause() {
  MUSIC.pause();
    
  fill(255);
  textSize(60);
  text("PAUSED", width/2, 450);
  textSize(30);
  text("click anywhere to unpause", width/2, 500);
  
  countdownPause = countdownPause + counting;
  
  textSize(50);
  if(countdownPause > 0 && countdownPause < 61) {
     noStroke();
    fill(0);
    circle(width/2, height/2, 50);
    fill(255);
    text("3", width/2, height/2);
  } else if(countdownPause > 60 && countdownPause < 121) {
    noStroke();
    fill(0);
    circle(width/2, height/2, 50);
    fill(255);
    text("2", width/2, height/2);
  } else if(countdownPause > 120 && countdownPause < 181) {
    noStroke();
    fill(0);
    circle(width/2, height/2, 50);
    fill(255);
    text("1", width/2, height/2);
  }
  
  if(countdownPause > 180) {
    mode = GAME;
    countdownPause = 0;
    counting = 0;
  }
}

void pauseClicks() {
  counting = 1;
}

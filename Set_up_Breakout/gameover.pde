void gameover() {
  background(0);
  if(score == n){
    textSize(75);
    text("YOU WIN!", width/2, 100);
  }
  if(life == 0){
    textSize(75);
  }
}

void gameoverClicks() {
  
}

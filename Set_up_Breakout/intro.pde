void intro (){
  MUSIC.pause();

  image(gif[g], 0, 0, width, height);
  g = g + 1;
  if(g == frames) g = 0;
  fill(255);
  textSize(75);
  textFont(airStrike);
  text("BREAKOUT", width/2, 100);

  squareTactile(175, 425, 500, 650);
  strokeWeight(5);
  rect(175, 500, 250, 150); 
  noStroke();
  fill(0);
  textSize(70);
  text("play", 300, 575);
}

void introClicks() {
  if(mouseX > 175 && mouseX < 425 && mouseY > 500 && mouseY < 650){
    mode = GAME;
  }
}

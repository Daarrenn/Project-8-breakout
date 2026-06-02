void intro (){
  background(0);
  fill(255);
  textSize(75);
  textFont(airStrike);
  text("BREAKOUT", width/2, 100);
  
  rect(50, 500, 225, 150); 
  rect(325, 500, 225, 150);
  fill(0);
  textSize(70);
  text("play", 162, 575);
  textSize(50);
  text("options", 433, 575);
}

void introClicks() {
  if(mouseX > 50 && mouseX < 275 && mouseY > 500 && mouseY < 650){
    mode = GAME;
  }
}

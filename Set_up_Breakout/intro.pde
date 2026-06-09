void intro (){
  background(0);
  fill(255);
  textSize(75);
  textFont(airStrike);
  text("BREAKOUT", width/2, 100);
  
  rect(175, 500, 250, 150); 
  fill(0);
  textSize(70);
  text("play", 300, 575);
}

void introClicks() {
  if(mouseX > 175 && mouseX < 425 && mouseY > 500 && mouseY < 650){
    mode = GAME;
  }
}

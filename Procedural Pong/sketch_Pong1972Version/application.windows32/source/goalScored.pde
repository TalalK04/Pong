void goalScored() {
  population();
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("GOALLL! \n Press 'r' to play again", width*1/2, height*1/2);
  restart = true;
  godMode = false;
  bounce = 0;
}

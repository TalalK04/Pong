
void preGameStart() {
  xMove = 0;
  yMove = 0;
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("This game is only compatible in LANDSCAPE mode \n Please change the size of your screen.", width*1/10, height*1/2);
}//end preGameStart

void chooseMode(){
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose the difficulty\n Easy: RightPaddle (press '1') LeftPaddle (press 'e')  \n Medium: RightPaddle (press '2') LeftPaddle (press 'm')  \n Hard: RightPaddle (press '3') LeftPaddle (press 'h')", width*1/10, height*1/4);
}//end chooseMode

void choosePlayerNum(){
  xMove = 0;
  yMove = 0;
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose how you want to play: \n Single Player (you will be leftPaddle): Press 'p' \n ScreenSaver: Press 's'", width*1/10, height*1/4);
}//end choosePlayerNum

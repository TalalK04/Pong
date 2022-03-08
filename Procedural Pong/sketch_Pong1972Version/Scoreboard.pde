void scoreBoard() {
  textSetup();
}//end ScoreBoard

void scoreBoardDraw() {
  
  if (rightGoal == true) {
    leftScore = 1;
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
  }
  if (leftGoal == true) {
    rightScore = 1;
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(rightScore), xRightScore, yRightScore, widthScore, heightScore); //Right Score
  }
  
    if (leftGoal == false || rightGoal == false) {
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(rightScore), xRightScore, yRightScore, widthScore, heightScore); //Right Score
  }
  
}//End draw()

void scoreBoardRect() {
  rect(xLeftScore, yLeftScore, widthScore, heightScore); //score left
  rect(xRightScore, yRightScore, widthScore, heightScore); //score right
}

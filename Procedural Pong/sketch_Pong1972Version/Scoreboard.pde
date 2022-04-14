void scoreBoardDraw() {
  textSetup();
  if (rightGoal == true) {
    leftScore = leftScore + 1;
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
  } else {
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
  }
  if (leftGoal == true) {
    rightScore = rightScore + 1;
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(rightScore), xRightScore, yRightScore, widthScore, heightScore); //Right Score
  } else {
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(rightScore), xRightScore, yRightScore, widthScore, heightScore); //Right Score
  }
}//End draw()

void scoreBoardRect() {
  rect(xLeftScore, yLeftScore, widthScore, heightScore); //score left
  rect(xRightScore, yRightScore, widthScore, heightScore); //score right
}

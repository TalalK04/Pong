void scoreBoard() {
  textSetup();
}//end ScoreBoard

void scoreBoardDraw() {

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

  //if (rightGoal == false) {
  //  textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
  //}
}//End draw()

void scoreBoardRect() {
  rect(xLeftScore, yLeftScore, widthScore, heightScore); //score left
  rect(xRightScore, yRightScore, widthScore, heightScore); //score right
}

//void Net() {
//  fill(255);
//  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
//  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
//  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
//}//end net

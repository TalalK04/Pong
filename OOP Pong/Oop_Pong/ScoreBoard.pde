class ScoreBoard {
  int leftScore = 0, rightScore = 0;
  float xLeftScore, xRightScore, yLeftScore, yRightScore;


  ScoreBoard (float width, float height) {
    xLeftScore = width*1/4;
    yLeftScore = yRightScore = height*1/10;
    xRightScore = width*3/4;
  }

  void draw() {
    textSize(25);
    text(leftScore, xLeftScore, yLeftScore);
    text(rightScore, xRightScore, yRightScore);
    for (int i=0; i<ballCounter; i++ ) {
      if (ball[i].rightGoalGetter() == true) {
        leftScore += 1;
        textSize(25);
        text(leftScore, xLeftScore, yLeftScore); //Left Score
        ball[i].leftGoalSetter();
      } else if (ball[i].leftGoalGetter() == true) {
        rightScore += 1;
        textSize(25);
        text(rightScore, xRightScore, yRightScore); //Right Score
        ball[i].rightGoalSetter();
      } else {
        leftScore = leftScore + 0;
                rightScore = rightScore + 0;
        text(leftScore, xLeftScore, yLeftScore); //Left Score
        text(rightScore, xRightScore, yRightScore); //Right Score
      }
      //} else {
      //  //ball[i].leftGoalSetter();
      //  textSize(25);
      //  text(leftScore, xLeftScore, yLeftScore); //Left Score
      //}
      //} else {
      //  //ball[i].rightGoalSetter();
      //  textSize(25);
      //  text(rightScore, xRightScore, yRightScore); //Right Score
      //}
    }//end for
  }//end ScoreBoard

  int leftScoreGetter() {
    return leftScore += 0;
  }
  int rightScoreGetter() {
    return rightScore += 0;
  }
}//end class ScoreBoard

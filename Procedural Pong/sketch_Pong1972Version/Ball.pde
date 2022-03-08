int xMove, yMove;
boolean rightGoal = false;
boolean leftGoal = false;



void ball () {
  ballStart();
  ballMove();
}//end ball

void ballMove() {

  if (yBall >= height -(ballDiameter*1/2)) {
    yMove= -1;
  }
  if (yBall <= height*0 +(ballDiameter*1/2)) {
    yMove = 1;
  }

  if ((leftGoal && rightGoal) == false) {
    xBall+=xMove;
    yBall+=yMove;
  }
  if (rightGoal == true) {
    xBall = (x1RightNet + (ballDiameter*2/3));
    yMove = 0;
  } else rightGoal = false;
  if (leftGoal == true) {
    xBall = (x1LeftNet - (ballDiameter*2/3)); 
    yMove = 0;
  } else leftGoal = false;


  if (xBall >= x1RightNet -(ballDiameter*1/2)) {
    rightGoal = true;
  } 
  if (xBall <= x1LeftNet +(ballDiameter*1/2)) {
    leftGoal = true;
  }

  if ((xBall == xPaddleLeft + (widthPaddle + ballDiameter*1/2)) && ((yBall >= yPaddleLeft) && (yBall <= (yPaddleLeft + heightPaddle)))) {
    xMove = (xMove*-1);
  } else if ((xBall >= xPaddleRight - (ballDiameter*1/2)) && ((yBall >= yPaddleRight) && (yBall <= (yPaddleRight + heightPaddle)))) {
    xMove = (xMove*-1);
  }
}//end ballMove

void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//end ballStart

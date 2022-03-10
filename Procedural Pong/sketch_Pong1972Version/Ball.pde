int xMove, yMove;
boolean rightGoal = false;
boolean leftGoal = false;
int leftScore = 0;
int rightScore = 0;
int bounce = 0;

void ball () {
  ballStart();
  ballMove();
}//end ball

void ballMove() {

  //if (bounce == 5){ 
  //heightPaddle = (heightPaddle*0.9);
  //}

  if (yBall >= height -(ballDiameter*1/2)) {
    yMove= (yMove*-1);
    bounce += 1;
  }
  if (yBall <= height*0 +(ballDiameter*1/2)) {
    yMove = (yMove*-1);
    bounce += 1;
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
    bounce += 1;
  } else leftGoal = false;


  if (xBall >= x1RightNet -(ballDiameter*1/2)) {
    rightGoal = true;
    //leftScore = leftScore + 1;
  } 
  if (xBall <= x1LeftNet +(ballDiameter*1/2)) {
    leftGoal = true;
    //rightScore = rightScore + 1;
  }

  if ((xBall == xPaddleLeft + (widthPaddle + ballDiameter*1/2)) && ((yBall >= yPaddleLeft) && (yBall <= (yPaddleLeft + heightPaddle)))) {
    xMove = (xMove*-1);
    bounce += 1;
  } else if ((xBall >= xPaddleRight - (ballDiameter*1/2)) && ((yBall >= yPaddleRight) && (yBall <= (yPaddleRight + heightPaddle)))) {
    xMove = (xMove*-1);
    bounce += 1;
  }
  println(bounce);
}//end ballMove

void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//end ballStart

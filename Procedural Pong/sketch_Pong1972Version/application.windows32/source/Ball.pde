int xMove, yMove;
boolean rightGoal = false;
boolean leftGoal = false;
int leftScore = 0;
int rightScore = 0;
int bounce = 0;
boolean godMode = false;

void ball () {
  ballStart();
  ballMove();
}//end ball

void ballMove() {

  if (godMode == true && (xMove<0 && yMove<0)) {
    xMove = -4;
    yMove = -4;
  } else if (godMode == true && (xMove>0 && yMove>0)) {
    xMove = 4;
    yMove = 4;
  } else if (godMode == false && (xMove>0 && yMove>0)) {
    xMove = 2;
    yMove = 2;
  } else if (godMode == false && (xMove<0 && yMove<0)) {
    xMove = -2;
    yMove = -2;
  }

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
  } 
  if (xBall <= x1LeftNet +(ballDiameter*1/2)) {
    leftGoal = true;
  }

  if ((xBall <= xPaddleLeft + (widthPaddle + ballDiameter*1/2)) && ((yBall >= yPaddleLeft) && (yBall <= (yPaddleLeft + heightPaddle)))) {
    xMove = (xMove*-1);
    bounce += 1;
  } else if ((xBall >= xPaddleRight - (ballDiameter*1/2)) && ((yBall >= yPaddleRight) && (yBall <= (yPaddleRight + heightPaddle)))) {
    xMove = (xMove*-1);
    bounce += 1;
  }

  if (bounce == 5) { 
    heightPaddle = height*1/6;
  } else if (bounce == 10) { 
    heightPaddle = height*1/7;
  } else if (bounce == 15) { 
    heightPaddle = height*1/10;
  } else if (bounce == 20) { 
    heightPaddle = height*1/12;
  } else if (bounce == 25) { 
    heightPaddle = height*1/15;
  }
  if (bounce >= 5) {
    godMode = true;
  }
}//end ballMove

void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//end ballStart

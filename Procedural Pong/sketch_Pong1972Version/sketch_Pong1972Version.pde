//Global variables
//Best Practie: initialization on similar lines;
float xBall, yBall, ballDiameter;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet; // left net line
float xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle, xPaddleRight, yPaddleRight; // right/left paddles
float x1RightNet, y1RightNet, x2RightNet, y2RightNet; //right net line
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine; //middle line
float xLeftScore, yLeftScore, widthScore, heightScore, xRightScore, yRightScore; //score
boolean landscapeMode = false;
boolean twoPlayer = false;
boolean restart = false;

void setup() {
  size(700, 500); 
  population(); 
  if (height < width) landscapeMode = true;
}//end setup

void draw() {
  background(0);

  if (leftGoal == true || rightGoal == true) {
    goalScored();
  } else if (restart == false) {
    gameStart();
  }


  if (landscapeMode == false) {
    preGameStart();
  } else if ((landscapeMode == true)  && (leftMode == false || rightMode == false)) {
    chooseMode();
  } else if ((landscapeMode == true)  && (leftMode == true && rightMode == true) && (singlePlayer == false && screenSaver == false && twoPlayer == false)) {
    choosePlayerNum();
  } else if ((landscapeMode == true)  && (leftMode == true && rightMode == true) && (screenSaver == true || singlePlayer == true || twoPlayer == true)) {
    gameStart();
  }
}//end draw

void keyPressed() {
  rightPaddlekeyPressed();
  leftPaddlekeyPressed();
  if (key == 'r' || key == 'R') restart = false;
}//end keyPressed

void mousePressed() {
}//end mousePressed

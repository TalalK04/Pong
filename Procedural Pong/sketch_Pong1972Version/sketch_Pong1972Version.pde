//Global variables
//Best Practie: initialization on similar lines;
float xBall, yBall, ballDiameter;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet; // left net line
float xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle, xPaddleRight, yPaddleRight; // right/left paddles
float x1RightNet, y1RightNet, x2RightNet, y2RightNet; //right net line
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine; //middle line
float xLeftScore, yLeftScore, widthScore, heightScore, xRightScore, yRightScore; //score
boolean landscapeMode = false;

boolean playerNum = false;


void setup() {
  //Geometry Communication and Variables for GUI Ratios
  size(700, 500); //Landscape-orientation, //fullScreen(); //displayWidth, displayHeight
  population(); //one purpose of developer written functions

  if (height < width) {
    landscapeMode = true;
  }


  
}//end setup

void draw() {
  background(0);
  //objects use varibales to ID purpose of function
  
  if (landscapeMode == false) {
    preGameStart();
  }
  if ((landscapeMode == true)  && (leftMode == false || rightMode == false) && (playerNum == false)) {
    chooseMode();
  } else if ((landscapeMode == true)  && (leftMode == true && rightMode == true) && (playerNum == false)) {
    choosePlayerNum();  
  } else if ((landscapeMode == true)  && (leftMode == true && rightMode == true) && (screenSaver == true || singlePlayer == true)) {
    GameStart();
  }
}//end draw

void keyPressed() {
  rightPaddlekeyPressed();
  leftPaddlekeyPressed();
}//end keyPressed

void mousePressed() {
}//end mousePressed

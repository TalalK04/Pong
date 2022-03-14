//Global Variable
int rightPaddleVelocity = 0;
boolean rightMode = false;
boolean screenSaver = false;


void rightPaddleDraw () {
  rightPaddleStart(); 
  if (screenSaver == true || singlePlayer == true) {
    yPaddleRight = yBall - heightPaddle*1/2;
  }
  
  if (yPaddleRight >= (height-heightPaddle)) yPaddleRight = height-heightPaddle;
  if (yPaddleRight <= height*0) yPaddleRight = height*0;
}//end rightPaddleDraw

void rightPaddlekeyPressed() {

  if ((key == CODED && keyCode == UP) && (twoPlayer == true)) {
    yPaddleRight -= rightPaddleVelocity;
  } 
  if ((key == CODED && keyCode == DOWN) && (twoPlayer == true)) {
    yPaddleRight += rightPaddleVelocity;
  } 
  
  /////
  if ((rightPaddleVelocity == 0) && (key == '1')) { //easy
    rightPaddleVelocity = 10;
    rightMode = true;
  } 
  if ((rightPaddleVelocity == 0) && (key == '2')) { //medium
    rightPaddleVelocity = 5;
    rightMode = true;
  } 
  if ((rightPaddleVelocity == 0) && (key == '3')) { //hard
    rightPaddleVelocity = 2;
    rightMode = true;
  }
  /////

  if ((leftMode == true && rightMode == true) && (key == 'c'|| key == 'C')) screenSaver = true;
}//end rightPaddle


void rightPaddleStart() {
  rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
}//end  leftPaddleStart

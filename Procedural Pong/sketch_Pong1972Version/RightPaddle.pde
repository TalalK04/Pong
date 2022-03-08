//Global Variable
int rightPaddleVelocity = 0;
boolean rightMode = false;
boolean screenSaver = false;


void rightPaddleDraw () {
  rightPaddleStart(); //might have to move outside draw()

  if (yPaddleRight >= (height-heightPaddle) ) {
    yPaddleRight = height-heightPaddle;
  } 
  if (yPaddleRight <= height*0) {
    yPaddleRight = height*0;
  }


  if (singlePlayer == true) {
    yPaddleRight = yBall - heightPaddle*1/2;
  }
}//end rightPaddleDraw

void rightPaddlekeyPressed() {

  if ((rightPaddleVelocity == 0) && (key == CODED && keyCode == UP)) {
    yPaddleRight -= rightPaddleVelocity;
  } else {
    yPaddleRight = yBall - heightPaddle*1/2;
  }
  if ((rightPaddleVelocity == 0) && (key == CODED && keyCode == DOWN)) {
    yPaddleRight += rightPaddleVelocity;
  } 
  /////
  if ((rightPaddleVelocity == 0) && (key == '1')) { //easy
    rightPaddleVelocity = 1;
    rightMode = true;
  } 
  if ((rightPaddleVelocity == 0) && (key == '2')) { //medium
    rightPaddleVelocity = 3;
    rightMode = true;
  } 
  if ((rightPaddleVelocity == 0) && (key == '3')) { //hard
    rightPaddleVelocity = 10;
    rightMode = true;
  }
  /////


  if ((rightPaddleVelocity == 0) && (key == 'p'|| key == 'P')) {
    playerNum = true;
    singlePlayer = true;
  }
}//end RightPaddle


void rightPaddleStart() {
  rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
}//end  leftPaddleStart

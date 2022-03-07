//Global Variable
int rightPaddleVelocity = 0;
Boolean maxHeightRight = false, maxBottomRight = false;



void rightPaddleDraw () {
  rightPaddleStart(); //might have to move outside draw()

  if (yPaddleRight >= (height-heightPaddle) && (key == CODED && keyCode == DOWN)) {
    rightPaddleVelocity = 0;
  } else if (yPaddleRight <= height*0 && (key == CODED && keyCode == UP)) {
    rightPaddleVelocity = 0;
  } else rightPaddleVelocity = 5;
}//end rightPaddleDraw

void rightPaddlekeyPressed() {
  
  if (key == CODED && keyCode == UP) {
    yPaddleRight -= rightPaddleVelocity;
    //logical conflict avoided
  }//end RightUp
  if (key == CODED && keyCode == DOWN) {
    yPaddleRight += rightPaddleVelocity;
    
/////
    if ((rightPaddleVelocity == 0) && (key == '1')) { //easy
      rightPaddleVelocity = 1;
    } 
    if ((rightPaddleVelocity == 0) && (key == '2')) { //medium
      rightPaddleVelocity = 3;
    } 
    if ((rightPaddleVelocity == 0) && (key == '3')) { //hard
      rightPaddleVelocity = 10;
    }
/////
  }//end RightPaddle
}

void rightPaddleStart() {
  rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
}//end  leftPaddleStart

//Global Variable
int rightPaddleVelocity = 5;
Boolean maxHeight=false, maxBottom=false;



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
  }//end RightPaddle
}

void rightPaddleStart() {
  rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
}//end  leftPaddleStart

//Global Variable
int leftPaddleVelocity = 5;

void leftPaddleDraw () {

  leftPaddleStart(); //might have to move outside draw()
  
   if (yPaddleLeft >= (height-heightPaddle) && (key == 'S' || key == 's')) {
    leftPaddleVelocity = 0;
  } else if (yPaddleLeft <= height*0 && (key == 'W' || key == 'w')) {
    leftPaddleVelocity = 0;
  } else leftPaddleVelocity = 5;
}//edn LeftPaddle

void leftPaddlekeyPressed() {
  if (key == 'W' || key == 'w') {
    yPaddleLeft -= leftPaddleVelocity;
    //logical conflict avoided
  }//end RightUp
  if (key == 'S' || key == 's') {
    yPaddleLeft += leftPaddleVelocity;
  }//end leftPaddle
}

void leftPaddleStart() {
  rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
}//end  leftPaddleStart

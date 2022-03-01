//Global Variable
int leftPaddleVelocity = 5;
boolean maxHeightLeft = false, maxBottomLeft = false;

void leftPaddleDraw () {

  leftPaddleStart(); //might have to move outside draw()
//while(yPaddleLeft >= height*0 || yPaddleLeft <= (height-heightPaddle)){
//  yPaddleLeft = yBall - heightPaddle*2/3;
//  }

  if ((maxBottomLeft || maxHeightLeft) == true) {
    leftPaddleVelocity = 0;
  }


  if (yPaddleLeft >= (height-heightPaddle) && (key == 'S' || key == 's')) {
    maxBottomLeft = true;
  } else if (yPaddleLeft <= height*0 && (key == 'W' || key == 'w')) {
    maxHeightLeft = true;
  } else { 
    maxHeightLeft = false;
    maxBottomLeft = false;
  }
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

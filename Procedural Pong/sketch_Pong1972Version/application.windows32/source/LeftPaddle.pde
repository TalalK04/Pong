//Global Variable
int leftPaddleVelocity = 0;
boolean leftMode = false;
boolean singlePlayer = false;



void leftPaddleDraw () {

  leftPaddleStart(); 
  
  if (screenSaver == true) {
    yPaddleLeft = yBall - heightPaddle*1/2;
  } 
  if (yPaddleLeft >= (height-heightPaddle)) yPaddleLeft = height-heightPaddle;
  if (yPaddleLeft <= height*0) yPaddleLeft = height*0;
}//end leftPaddle

void leftPaddlekeyPressed() {

  if ((key == 'W' || key == 'w')  && (singlePlayer == true || twoPlayer == true)) {
    yPaddleLeft -= leftPaddleVelocity;
  } 
  if ((key == 'S' || key == 's') && (singlePlayer == true || twoPlayer == true)) {
    yPaddleLeft += leftPaddleVelocity;
  }

  if ((leftPaddleVelocity == 0) && (key == 'e'|| key == 'E')) { //easy
    leftPaddleVelocity = 10;
    leftMode = true;
  } else if ((leftPaddleVelocity == 0) && (key == 'm'|| key == 'M')) { //medium
    leftPaddleVelocity = 5;
    leftMode = true;
  } else if ((leftPaddleVelocity == 0) && (key == 'h'|| key == 'H')) { //hard
    leftPaddleVelocity = 2;
    leftMode = true;
  }

  if ((leftMode == true && rightMode == true) && (key == 'p'|| key == 'P')) singlePlayer = true;
  if ((leftMode == true && rightMode == true) && (key == 't'|| key == 'T')) twoPlayer = true;
} //end leftPaddle


void leftPaddleStart() {
  rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
}//end  leftPaddleStart

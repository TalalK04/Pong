//Global Variable
int leftPaddleVelocity = 0;
boolean leftMode = false;
boolean singlePlayer = true;



void leftPaddleDraw () {

  leftPaddleStart(); //might have to move outside draw()

  if (yPaddleLeft >= (height-heightPaddle) ) {
    yPaddleLeft = height-heightPaddle;
  } 
  if (yPaddleLeft <= height*0) {
    yPaddleLeft = height*0;
  }
  if(screenSaver == true) {
   println("true");
  }
}//end LeftPaddle

void leftPaddlekeyPressed() {

  if ((leftPaddleVelocity == 0) && (key == 'W' || key == 'w')) {
    yPaddleLeft -= leftPaddleVelocity;
  } 
  if ((leftPaddleVelocity == 0) && (key == 'S' || key == 's')) {
    yPaddleLeft += leftPaddleVelocity;
  }

  /////
  if ((leftPaddleVelocity == 0) && (key == 'e'|| key == 'E')) { //easy
    leftPaddleVelocity = 1;
    leftMode = true;
  } else if ((leftPaddleVelocity == 0) && (key == 'm'|| key == 'M')) { //medium
    leftPaddleVelocity = 3;
    leftMode = true;
  } else if ((leftPaddleVelocity == 0) && (key == 'h'|| key == 'H')) { //hard
    leftPaddleVelocity = 10;
    leftMode = true;
  }
  /////

  if ((key == 's'|| key == 'S')) {
    screenSaver = true;
  }
} //end leftPaddle


void leftPaddleStart() {
  rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
}//end  leftPaddleStart

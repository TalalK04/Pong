/* Ideas - Abstract
 Change the Ball Colour based on direction or collision
 Change the speed of the ball based on the score of the game
 Change the colour of the ball at a specific level/score
 Introduce multiple balls at a specific level/score
 Unlimited mode, where the ball speeds up over time
 - Note: continuous collision, so the ball can't zip through the paddle
 Ball become invisible for a split second-guessing
 - invisible halfway across the screen ... guess the path
 */

private class Ball {
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset = #FFFFFF;
  private int xSpeed, ySpeed;
  private boolean nightMode = false;
  private boolean rightGoal = false, leftGoal = false;
  private boolean godMode = false;
  private int bounce = 0;
  //boolean leftPaddleHit = false, rightPaddleHit = false;

  //
  //int ballCount = 10; //(Static Variable: Do not need an object. True sense of Final Global Varibale)
  //Knows how many instances of BALL there are - Not just myBall and yourBall

  private Ball(float width, float height) { //Constructor Is...
    x = width*1/2; //Start Ball Location wherever
    y = height*1/2;
    xStart = x; //Location Specifically at Game Start, middle of field
    yStart = y;
    diameter =  width*1/30;
    if (nightMode == false) colour = color( random(0, 255), random(255), random(255) ); //Hexidecimal: #1FF03, Night Mode friendly
    if (nightMode == true) colour = color( random(0, 255), random(255), 0 );
    xSpeed = int ( random (width/width, width/width*5) );
    ySpeed = int ( random (height/height, height/height*5) );
    while (xSpeed>-2 && xSpeed<2) xSpeed = int(random( -3, 3));
    while (ySpeed>-2 && ySpeed<2) ySpeed = int(random( -3, 3));
   
  }//end Constructor

  private void draw() {
    
    println(bounce);
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(colourReset);
    //
    ballMove();
    bounceWall();
    bouncePaddle();
    Goal();
    bounceCount();
  }// end draw

  private void ballMove() {
    x += xSpeed;
    y += ySpeed;
    }//end move

    void bounceWall() {
    if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) 
      ySpeed *= -1; //Top and Bottom
      bounce += 1;
    }//end Bounce

    private void bouncePaddle() {
    if ((x <= paddle.xPaddleLeft + (paddle.widthPaddle + diameter*1/2)) && ((y >= paddle.yPaddleLeft) && (y <= (paddle.yPaddleLeft + paddle.heightPaddle)))) {
      xSpeed *= -1;
      bounce += 1;
    } 
    if ((x >= paddle.xPaddleRight - (diameter*1/2)) && ((y >= paddle.yPaddleRight) && (y <= (paddle.yPaddleRight + paddle.heightPaddle)))) {
      xSpeed*=-1;
      bounce += 1;
    }
    
    }//end bouncePaddle

    private void Goal() {
    if (rightGoal == true) {
      x = (net.x1RightNet + (diameter*2/3));
      ySpeed = 0;
      xSpeed = 0;
      bounce += 1;
    } else {
      rightGoal = false; 
      scoreBoard.leftScoreGetter();
    }
    if (leftGoal == true) {
      x = (net.x1LeftNet - (diameter*2/3)); 
      ySpeed = 0;
      xSpeed = 0;
    } else {
      leftGoal = false;
      scoreBoard.rightScoreGetter();
    }


    if (x > net.x1RightNet - (diameter*1/2)) {
      rightGoal = true;
    } 
    if (x < net.x1LeftNet +(diameter*1/2)) {
      leftGoal = true;
    }
    }//end Goal
    
    private void bounceCount(){
         if (bounce < 5) {
      paddle.heightPaddle = height*1/4;
    } else if (bounce == 5) { 
      paddle.heightPaddle = height*1/6;
    } else if (bounce == 10) { 
      paddle.heightPaddle = height*1/7;
    } else if (bounce == 15) { 
      paddle.heightPaddle = height*1/10;
    } else if (bounce == 20) { 
      paddle.heightPaddle = height*1/12;
    } else if (bounce == 25) { 
      paddle.heightPaddle = height*1/15;
    }
    }//end bounceCount

  boolean rightGoalGetter() {
    return rightGoal;
  }
  boolean leftGoalGetter() {
    return leftGoal;
  }
  boolean rightGoalSetter() {
    return rightGoal = false;
  }
  boolean leftGoalSetter() {
    return leftGoal = false;
  }
}//End ball

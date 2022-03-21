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
  //
  //int ballCount = 10; //(Static Variable: Do not need an object. True sense of Final Global Varibale)
  //Knows how many instances of BALL there are - Not just myBall and yourBall

  private Ball(float widthParameter, float heightParameter) { //Constructor Is...
    x = widthParameter*1/2; //Start Ball Location wherever
    y = heightParameter*1/2;
    xStart = x; //Location Specifically at Game Start, middle of field
    yStart = y;
    diameter =  widthParameter*1/30;
    if (nightMode == false) colour = color( random(0, 255), random(255), random(255) ); //Hexidecimal: #1FF03, Night Mode friendly
    if (nightMode == true) colour = color( random(0, 255), random(255), 0 );
    xSpeed = int ( random (width/width, width/width*5) );
    ySpeed = int ( random (height/height, height/height*5) );
    ;
    xDirection = 0;
    while (xDirection == 0) xDirection = int( random(-2, 2) );
    yDirection = 0;
    while (yDirection == 0) yDirection = int( random(-2, 2) );
  }//end Constructor

  private void draw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(colourReset);
    //
    ballMove();
    bounceWall();
    bouncePaddle();
  }// end draw

  private void ballMove() {
    x += xSpeed;
    y += ySpeed;
  }//end move

  void bounceWall() {
    if (x-diameter*1/2 < width*0 || x+diameter*1/2 > width) 
      xSpeed *= -1;
    if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) 
      ySpeed *= -1; //Top and Bottom
    leftGoal = true;
  }//end Bounce

  private void bouncePaddle() {
  }//end bouncePaddle

  private void Goal () {
    //Ball knows where NET is
    //Ball knows where NET is
    if ( ( x < (width*0)+diameter*1/2 ) || ( x > width-diameter*1/2 ) ) {
      if (x < (width*0)+diameter) {
      }//rightGoal
      x = (width*0)+diameter/2;
      y = y;
      if (x > (width)-diameter*1/2) {
      }//leftGoal
      x = (width)-diameter/2;
      y = y;
    }//End Net Detection
    if ((rightGoal || leftGoal) == true) {
      //Empty IF
    } else {
      ballMove();
    }
  }//end goal
}//End ball

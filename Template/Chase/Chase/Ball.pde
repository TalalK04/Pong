class Ball {
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection, targetX, targetY;
  private color colour, colourReset = #FFFFFF;
  private int xSpeed, ySpeed;
  private boolean nightMode = false;
  private boolean rightGoal = false, leftGoal = false;
  //private float distX = dist(x, targetX);
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
    xDirection = 0;
    while (xDirection == 0) xDirection = int( random(-2, 2) );
    yDirection = 0;
    while (yDirection == 0) yDirection = int( random(-2, 2) );
  }//end Ball Constructor

  //Star Constructor

  Ball(float widthParameter, float heightParameter, float diameterParameter) {
    //THIS is not used here
    x = widthParameter; //Start Ball Location wherever
    y = heightParameter;
    diameter =  diameterParameter;
    colour = (nightMode == false) ? color (random(255), random(255), random(255)) : color (random(255), random(255), 0);
    targetX = x;
    targetY = y;
  }//end Star Constructor

  public void drawBall() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(colourReset);
    //
    ballMove();
    bounceWall();
  }//end drawBall

  public void drawStar() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(colourReset);
    //
    ballMove();
    bounceWall();
    starChase();
  }//end drawStar

  private void ballMove() {
    x += xSpeed*xDirection;
    y += ySpeed*yDirection;
  }//end move

  void bounceWall() {
    if (x-diameter*1/2 < width*0 || x+diameter*1/2 > width) 
      xSpeed *= -1;
    if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) 
      ySpeed *= -1; //Top and Bottom
  }//end Bounce

  void starChase() {
    if (x < targetX) {
      x += sqrt(2);
      y += sqrt(2);
    } else {
      x += (sqrt(2))*-1;
    }
    //
    if (y < targetY) {
      y += sqrt(2);
      x += sqrt(2);
    } else {
      y += (sqrt(2))*-1;
    }
  }//end starChase


  void setTargetX(int iParameter) {
    targetX = iParameter;
  }// end setTargetX

  void setTargetY(int iParameter) {
    targetY = iParameter;
  }// end setTargetY

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

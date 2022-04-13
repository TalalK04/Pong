/* Ideas: Abstract
 Paddle as a Pin-Ball-Lookalike in the middle of the table
 Make the paddle smaller with more points
 [Advanced Option] 360 degrees full rotation for the ball/paddles
 [Advanced Option] Curved Paddle, deflects and different angles
 */

class Paddle {
  //Global Variables
  private color colour;
  private float xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle, xPaddleRight, yPaddleRight;
  private boolean nightMode = false;
  private boolean leftUp = false, leftDown = false, rightUp = false, rightDown = false, rightStop = false, leftStop = true;
  private int leftPaddleVelocity = 0, rightPaddleVelocity = 0;
  private boolean leftMode = false;
  private boolean singlePlayer = false;
  private boolean rightMode = false;
  private boolean screenSaver = false;
  private boolean twoPlayer = false;

  //
  Paddle(float width, float height) { // General Population
    if (nightMode == false) this.colour = color(int (random(100, 255)), int (random(50, 255)), int (random(175, 255)));
    if (nightMode == true) this.colour = color(int (random(100, 255)), int (random(50, 255)), 0);
    widthPaddle = int(width*1/55);
    xPaddleLeft = int(width*1/40);
    xPaddleRight = int(width*39/40) - widthPaddle;
    this.yPaddleRight = int(height*1/2 - heightPaddle*1/2);
    this.yPaddleLeft = int(height*1/2 - heightPaddle*1/2);
    heightPaddle = int(height*1/4);
  }//End Constructor

  void draw() {
    leftPaddle();
    rightPaddle();
  }//end draw

  void leftPaddle() {
    fill(colour);
    rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
    move();
    for (int i=0; i<ballCounter; i++ ) {
      if (screenSaver == true) {
        yPaddleLeft = ball[i].ballYGetter() - heightPaddle*1/2;
      }//end IF
    }//end FOR
    }//end leftPaddle

    void rightPaddle() {
      fill(colour);
      rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
      move();
      for (int i=0; i<ballCounter; i++ ) {
        if (screenSaver == true || singlePlayer == true) {
          yPaddleRight = ball[i].ballYGetter() - heightPaddle*1/2;
        }//end IF
      }//end FOR
    }//end rightPaddle

    void move() {
      if (leftUp == true) { 
        yPaddleLeft = yPaddleLeft - leftPaddleVelocity;
      } else if (leftDown == true) {
        yPaddleLeft = yPaddleLeft + leftPaddleVelocity;
      } else if (rightUp == true) {
        yPaddleRight = yPaddleRight - rightPaddleVelocity;
      } else if (rightDown == true) {
        yPaddleRight = yPaddleRight + rightPaddleVelocity;
      } else {
        rightPaddleVelocity = 0;
        leftPaddleVelocity = 0;
      }
      if (yPaddleLeft >= (height-heightPaddle)) yPaddleLeft = height - heightPaddle; 
      if (yPaddleLeft < height*0) yPaddleLeft = height*0; 
      if (yPaddleRight > (height-heightPaddle)) yPaddleRight = height - heightPaddle; 
      if (yPaddleRight < height*0) yPaddleRight = height*0;
    }//end move

    void momentumAddToBall() {
    }//end momentumAddTooBall
    //if the paddle is moving, increase the movement of the ball in the direction of the paddle
    //if the paddle is stationary, increase the x-axis movement only
    //ability is controlled in configuration (on or off)

    public void leftUpSetter() {
      leftUp = true;
      leftDown = false;
    }
    public void leftDownSetter() {
      leftDown = true;
      leftUp = false;
    }
    public void rightUpSetter() {
      rightUp = true;
      rightDown = false;
    }
    public void rightDownSetter() {
      rightDown = true;
      rightUp = false;
    }

    boolean twoPlayerGetter () {
      return twoPlayer;
    }
    boolean singlePlayerGetter () {
      return singlePlayer;
    }
    boolean leftModeSetter () {
      return leftMode = true;
    } 
    boolean rightModeSetter () {
      return rightMode = true;
    }
    boolean leftModeGetter () {
      return leftMode;
    } 
    boolean rightModeGetter () {
      return rightMode;
    }


    //float xPaddleLeftGetter(){ return xPaddleLeft; }
    //float yPaddleLeftGetter(){ return yPaddleLeft; }
    //float xPaddleRightGetter(){ return xPaddleRight; }
    //float yPaddleRightGetter(){ return xPaddleRight; }
    //float heightPaddleGetter(){ return heightPaddle; }
    //float widthPaddleGetter(){ return widthPaddle; }
  }//end Paddle

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
  //
  Paddle(float width, float height) { // General Population
    if (nightMode == false) this.colour = color(int (random(100, 255)), int (random(50, 255)), int (random(175, 255)));
    if (nightMode == true) this.colour = color(int (random(100, 255)), int (random(50, 255)), 0);
    widthPaddle = int(width*1/50);
    xPaddleLeft = int(width*1/40);
    xPaddleRight = int(width*39/40) - widthPaddle;
    this.yPaddleRight = int(height*1/2) - heightPaddle*1/2;
    this.yPaddleLeft = yPaddleRight;
    heightPaddle = int(height*1/5);
  }//End Constructor


  void draw() {
    leftPaddle();
    rightPaddle();
  }//end draw

  void leftPaddle() {
    fill(colour);
    rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
    move();
  }//end leftPaddle

  void rightPaddle() {
    fill(colour);
    rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
    move();
  }//end rightPaddle

  void move() {
    //Needs to stop at Top and Bottom
  }//end move

  void momentumAddToBall() {
  }//end momentumAddTooBall
  //if the paddle is moving, increase the movement of the ball in the direction of the paddle
  //if the paddle is stationary, increase the x-axis movement only
  //ability is controlled in configuration (on or off)

  //Getter
  //When the ball bounces of the paddle, randomize the color 20 times (1/3 of a second)

  //Setters
  //Send Paddle Location to Ball Class for Collision and Bounce
}//endPaddle

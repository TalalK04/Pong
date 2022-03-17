/* Ideas: Abstract
 Paddle as a Pin-Ball-Lookalike in the middle of the table
 Make the paddle smaller with more points
 [Advanced Option] 360 degrees full rotation for the ball/paddles
 [Advanced Option] Curved Paddle, deflects and different angles
 */

class Paddle {
  //Global Variables
  //
  Paddle() { // General Population
  }//End Constructor

  void draw() {
    leftPaddle();
    rightPaddle();
  }//end draw

  void leftPaddle() {
    move();
  }//end leftPaddle

  void rightPaddle() {
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

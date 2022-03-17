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
 
class Ball {
  //Global Variables
  float x, y, diameter;
  color colour;
  int xSpeed, ySpeed;
  //
  Ball(float xParameter, float yParameter, float diameterParameter, color colourParameter, int xSpeedParameter, int ySpeedParameter) { //Constructor Is...
    x = xParameter;
    y = yParameter;
    diameter =  diameterParameter;
    colour = colourParameter; //Hexidecimal: #1FF03, Night Mode friendly
    xSpeed = xSpeedParameter;
    ySpeed = ySpeedParameter;
  }//end Constructor

  void draw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    //
    ballMove();
    bounceWall();
    bouncePaddle();
  }// end draw
  
  void ballMove() {
  x += xSpeed;
  y += ySpeed;
}//end move

void bounceWall() {
  if (x-diameter*1/2 < width*0 || x+diameter*1/2 > width) xSpeed *= -1;
  if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) ySpeed *= -1; //Top and Bottom
}//end Bounce

void bouncePaddle() {}//end bouncePaddle
}//End ball

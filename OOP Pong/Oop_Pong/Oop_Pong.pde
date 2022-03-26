// Global Variables And Objects
//Global variables
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet; // left net line
float x1RightNet, y1RightNet, x2RightNet, y2RightNet; //right net line
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine; //middle line
int mouse = 0;
int ballCount = 10;
Ball[] ball = new Ball[ballCount]; //Not just an array, but an array list: includes code and variable
int ballCounter = ball.length - ball.length; //How to get 0 but using another value
Paddle paddle;

void setup() {
  size(1000, 700);
  x2MiddleLine= x1MiddleLine = width*1/2;
  x2LeftNet = x1LeftNet = width*1/40;
  x2RightNet = x1RightNet = width*39/40;
  y1MiddleLine = y1RightNet = y1LeftNet = height*0;
  y2MiddleLine = y2RightNet = y2LeftNet = height;
  ball[ballCounter] = new Ball(width, height); //Start the first ball, need ballCounter
  paddle = new Paddle(width, height);

  //
  ballCounter += 1;
  //
}//end setup
//Object is garbage collected here

void draw() {
  background(0);
  stroke(255);
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
  paddle.draw();
  for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
    ball[i].draw();
    //
  }//end ball.draw

  //myBall.draw();
  //yourBall.draw(); //Notice Bug
  //
  //ballCollisions();
}//end draw

void keyPressed() {
  if ((key == 'W' || key == 'w')) {
    paddle.leftUpSetter();
  } 
  if ((key == 'S' || key == 's')) {
    paddle.leftDownSetter();
  } 
  if ((key == CODED && keyCode == UP) ) {
    paddle.rightUpSetter();
  } 
  if ((key == CODED && keyCode == DOWN) ) {
    paddle.rightDownSetter();
  } 
}//end keyPresseded

void mousePressed() {
  //Easter Egg Example: mousePressed to create another ball instantiation

  if (ballCounter >= ball.length) {
    exit();
  } else {
    ballCounter += 1;
  }
  for (int i=ballCounter-1; i<ballCounter; i++ ) { //Constructor for other ball objects could be a button
    ball[i] = new Ball(width, height);
    ball[i].draw();
  }//end Constructor
}//end mousePressed

  //  void momentumAddToBall() {
  //  if (paddle.leftUp == true && ball[ball.length].paddleHitSetter()){
  //    ball[ball.length].xDirectionGetter() *= 1.2;
  //  }
  //}//end momentumAddTooBall
  ////if the paddle is moving, increase the movement of the ball in the direction of the paddle
  ////if the paddle is stationary, increase the x-axis movement only
  ////ability is controlled in configuration (on or off)

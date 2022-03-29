// Global Variables And Objects
//Global variables

int mouse = 0;
int ballCount = 10;
Ball[] ball = new Ball[ballCount]; //Not just an array, but an array list: includes code and variable
int ballCounter = ball.length - ball.length; //How to get 0 but using another value
Paddle paddle;
Net net;
ScoreBoard scoreBoard;
boolean landscapeMode = false;


void setup() {
  size(700, 500);
  ball[ballCounter] = new Ball(width, height); //Start the first ball, need ballCounter
  paddle = new Paddle(width, height);
  net = new Net(width, height);
  scoreBoard = new ScoreBoard(width, height);
  //
  ballCounter += 1;
  if (height < width) landscapeMode = true;
  //
}//end setup
//Object is garbage collected here

void draw() {
  background(0);

  net.draw();
  paddle.draw();
  scoreBoard.draw();
  for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
    ball[i].draw();
  }//end ball.draw

  //ballCollisions();
}//end draw

void keyPressed() {
  if ((key == 'W' || key == 'w') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) {
    paddle.leftUpSetter();
  } 
  if ((key == 'S' || key == 's') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) {
    paddle.leftDownSetter();
  } 
  if ((key == CODED && keyCode == UP)  && (paddle.twoPlayerGetter() == true)) {
    paddle.rightUpSetter();
  } 
  if ((key == CODED && keyCode == DOWN)  && (paddle.twoPlayerGetter() == true)) {
    paddle.rightDownSetter();
  }
}//end keyPresseded

void mousePressed() {
  //Easter Egg Example: mousePressed to create another ball instantiation
  if (mousePressed) println(mouseX);

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

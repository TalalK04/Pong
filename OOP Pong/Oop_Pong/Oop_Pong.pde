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
boolean restart = false;


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

  if (landscapeMode == false) {
    preGameStart();
  } else if ((landscapeMode == true)  && (paddle.leftModeGetter() == false || paddle.rightModeGetter() == false)) {
    chooseMode();
  } else if ((landscapeMode == true)  && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.singlePlayerGetter() == false && paddle.screenSaver == false && paddle.twoPlayer == false)) {
    choosePlayerNum();
  } else if ((landscapeMode == true)  && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.screenSaver == true || paddle.singlePlayer == true || paddle.twoPlayer == true) && (restart == false)) {
    net.draw();
    paddle.draw();
    scoreBoard.draw();
    for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
      ball[i].draw();
    }//end ball.draw
  }
  for (int i=0; i<ballCounter; i++ ) {
    if (ball[i].leftGoalGetter() == true || ball[i].rightGoalGetter() == true) {
      goalScored();
    }
  }//end for


  //ballCollisions();
}//end draw

void preGameStart() {
  for (int i=ballCounter-1; i<ballCounter; i++ ) {
    ball[i].xSpeed = 0;
    ball[i].ySpeed = 0;
  }
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("This game is only compatible in LANDSCAPE mode\nPlease change the size of your screen.", width*1/10, height*1/2.25);
}//end preGameStart

void chooseMode() {
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose paddle speed:\nFast (EASY): RightPaddle (press '1') | LeftPaddle (press 'e')\nMedium: RightPaddle (press '2') | LeftPaddle (press 'm')\nSlow (HARD): RightPaddle (press '3') | LeftPaddle (press 'h')", width*1/10, height*1/4);
  text("Left Paddle Controls: W (Up) | S (Down)\nRight Paddle Controls: Up Arrow Key | Down Arrow Key", width*1/10, height*1/1.5);
}//end chooseMode

void choosePlayerNum() {
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose how you want to play:\nSingle Player (you will be controlling the Left Paddle): Press 'p'\nTwo Player: Press 't'\nScreenSaver: Press 'c'", width*1/10, height*1/4);
  text("Keep in mind: \n - Paddles will get smaller as the game continues\n - Ball will begin to move faster at some point", width*1/10, height*1/1.75);
  text("GOOD LUCK!", width*1/10, height*1/1.2);
}//end choosePlayerNum

void goalScored() {
void keyPressed() {
  if (key == 'r' || key == 'R') restart = false;
  //Left Paddle
  if ((key == 'W' || key == 'w') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) paddle.leftUpSetter();
  if ((key == 'S' || key == 's') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) paddle.leftDownSetter();
  if ((paddle.leftPaddleVelocity == 0) && (key == 'h'|| key == 'H')) { //easy
    paddle.leftPaddleVelocity = 10;
    paddle.leftModeSetter();
  } else if ((paddle.leftPaddleVelocity == 0) && (key == 'm'|| key == 'M')) { //medium
    paddle.leftPaddleVelocity = 5;
    paddle.leftModeSetter();
  } else if ((paddle.leftPaddleVelocity == 0) && (key == 'e'|| key == 'E')) { //hard
    paddle.leftPaddleVelocity = 2;
    paddle.leftModeSetter();
  }

  //Choose Mode
  if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 'p'|| key == 'P')) paddle.singlePlayer = true;
  if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 't'|| key == 'T')) paddle.twoPlayer = true;
  if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 'c'|| key == 'C')) paddle.screenSaver = true;

  //Right Paddle
  if ((key == CODED && keyCode == UP)  && (paddle.twoPlayerGetter() == true)) paddle.rightUpSetter();
  if ((key == CODED && keyCode == DOWN)  && (paddle.twoPlayerGetter() == true))paddle.rightDownSetter();
  if ((paddle.rightPaddleVelocity == 0) && (key == '1')) { //hard
    paddle.rightPaddleVelocity = 10;
    paddle.rightModeSetter();
  } else if ((paddle.rightPaddleVelocity == 0) && (key == '2')) { //medium
    paddle.rightPaddleVelocity = 5;
    paddle.rightModeSetter();
  } else if ((paddle.rightPaddleVelocity == 0) && (key == '3')) { //easy
    paddle.rightPaddleVelocity = 2;
    paddle.rightModeSetter();
  }
}//end keyPresseded

void mousePressed() {
  //Easter Egg Example: mousePressed to create another ball instantiation

  if (ballCounter >= ball.length) {
    exit();
  } else if (mousePressed && landscapeMode = true && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.screenSaver == true || paddle.singlePlayer == true || paddle.twoPlayer == true) && (restart == false)) {
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

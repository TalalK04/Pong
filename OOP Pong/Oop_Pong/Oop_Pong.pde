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
int Size;
boolean gameStart = false;



void setup() {
  size(1500, 1200);
  Size = height*width;
  ball[ballCounter] = new Ball(width, height); //Start the first ball, need ballCounter
  paddle = new Paddle(width, height);
  net = new Net(width, height);
  scoreBoard = new ScoreBoard(width, height);
  //
  ballCounter += 1;
  if (height < width) landscapeMode = true;
  //
  if (restart == true ) println("hello");
  if (restart == false ) println("false");
}//end setup


//Object is garbage collected here

void draw() {
  background(0);

  if (landscapeMode == false) preGameStart();
  if ((landscapeMode == true)  && (paddle.leftMode == false || paddle.rightMode == false)) chooseMode();
  if ((landscapeMode == true)  && (paddle.leftMode == true && paddle.rightMode == true) && (paddle.singlePlayerGetter() == false && paddle.screenSaver == false && paddle.twoPlayer == false)) choosePlayerNum();
  if ((landscapeMode == true)  && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.screenSaver == true || paddle.singlePlayer == true || paddle.twoPlayer == true) && restart == false) {
    gameStart();
  }
  for (int i=0; i<ballCounter; i++ ) {
    if (ball[i].leftGoal == true || ball[i].rightGoal == true) {
      println("Goalll");
      restart = true;
      goalScored();
    }
  }//end for
}//end draw

void gameStart() {
  net.draw();
  paddle.draw();
  scoreBoard.draw();
  for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
    ball[i].ballDraw();
  }//end ball.draw
  //gameStart = true;
}//end gameStart

void preGameStart() {
  for (int i=ballCounter-1; i<ballCount; i++ ) {
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
  text("Choose paddle speed:\nSlow (EASY): RightPaddle (press '1') | LeftPaddle (press 'e')\nMedium: RightPaddle (press '2') | LeftPaddle (press 'm')\nFast (HARD): RightPaddle (press '3') | LeftPaddle (press 'h')", width*1/10, height*1/4);
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

void keyPressed() {
  if (gameStart == false && ( key == CODED && (key == 'r' || key == 'R') )) gameStart();

  //Left Paddle
  if ((key == 'W' || key == 'w') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true )) {
    paddle.leftUpSetter();
  } 
  if ((key == 'S' || key == 's') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) {
    paddle.leftDownSetter();
  }

if ((paddle.leftPaddleVelocity == 0) && (key == 'e'|| key == 'E')) { //easy
  paddle.leftPaddleVelocity = 2;
  paddle.leftMode = true;
} else if ((paddle.leftPaddleVelocity == 0) && (key == 'm'|| key == 'M')) { //medium
  paddle.leftPaddleVelocity = 5;
  paddle.leftMode = true;
} else if ((paddle.leftPaddleVelocity == 0) && (key == 'h'|| key == 'H')) { //hard
  paddle.leftPaddleVelocity = 10;
  paddle.leftMode = true;
}

//Choose Mode
if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 'p'|| key == 'P')) paddle.singlePlayer = true;
if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 't'|| key == 'T')) paddle.twoPlayer = true;
if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 'c'|| key == 'C')) paddle.screenSaver = true;

//Right Paddle
if ((key == CODED && keyCode == UP)  && (paddle.twoPlayerGetter() == true)) paddle.rightUpSetter();
if ((key == CODED && keyCode == DOWN)  && (paddle.twoPlayerGetter() == true))paddle.rightDownSetter();
if ((paddle.rightPaddleVelocity == 0) && (key == '1')) { //easy
  paddle.rightPaddleVelocity = 2;
  paddle.rightMode = true;
} else if ((paddle.rightPaddleVelocity == 0) && (key == '2')) { //medium
  paddle.leftPaddleVelocity = 5;
  paddle.rightMode = true;
} else if ((paddle.rightPaddleVelocity == 0) && (key == '3')) { //hard
  paddle.rightPaddleVelocity = 10;
  paddle.rightMode = true;
}
}//end keyPresseded

void mousePressed() {
  //Easter Egg Example: mousePressed to create another ball instantiation

  if (landscapeMode == true && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.screenSaver == true || paddle.singlePlayer == true || paddle.twoPlayer == true) && restart == false) {
    ballCounter += 1;
  }
  if (ballCounter >= ball.length) {
    exit();
  } 
  for (int i=ballCounter; i<ball.length; i++ ) { //Constructor for other ball objects could be a button
    if (gameStart == true) {
      ball[i] = new Ball(width, height);
      ball[i].ballDraw();
    }
  }//end for
}//end mousePressed

void goalScored() {
  gameStart = false;
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("GOALLL! \n Press 'r' to play again", width*1/2, height*1/2);  
}









//  void momentumAddToBall() {
//  if (paddle.leftUp == true && ball[ball.length].paddleHitSetter()){
//    ball[ball.length].xDirectionGetter() *= 1.2;
//  }
//}//end momentumAddTooBall
////if the paddle is moving, increase the movement of the ball in the direction of the paddle
////if the paddle is stationary, increase the x-axis movement only
////ability is controlled in configuration (on or off)

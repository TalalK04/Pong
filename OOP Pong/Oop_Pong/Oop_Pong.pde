// Global Variables And Objects
int ballCount = 10;
Ball[] ball = new Ball[ballCount]; //Not just an array, but an array list: includes code and variable
int ballCounter = ball.length - ball.length; //How to get 0 but using another value
Paddle paddle;
void setup() {

  size(700, 500);
  //An object is... See the class
  //
  ball[ballCounter] = new Ball(width, height); //Start the first ball, need ballCounter
  paddle = new Paddle(width, height);
  //
  ballCounter++; // ballCounter += 1;
  //
  println("Exciting... not exciting"); //Ball Object immediately deleted, local variable
  //exit(); //Exit Button, TBA
}//end setup
//Object is garbage collected here

void draw() {
  background(255);
  paddle.draw();
  for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
    ball[i].draw();
    //
  }//end ball.draw

  //myBall.draw();
  //yourBall.draw(); //Notice Bug
  //
  ballCollisions();
}//end draw

void keyPressed() {
  //Press W-S-D for Left Paddle
  //Press UP-DOWN-LEFT Arrows for Right Paddle
}//end keyPresseded

void mousePressed() {
  //Easter Egg Example: mousePressed to create another ball instantiation
  if (ballCounter >= ball.length) {
    exit();
  } else {
    ballCounter++; //ballCounter += 1
  }
  for (int i=ballCounter-1; i<ballCounter; i++ ) { //Constructor for other ball objects could be a button
    ball[ballCounter] = new Ball(width, height);
    ball[i].draw();
    
  }//end Constructor
}//end mousePressed

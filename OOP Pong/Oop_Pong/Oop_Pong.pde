// Global Variables And Objects
Ball myBall; 
Ball yourBall;

void setup() {

  size(700, 500);
  //An object is... See the class
  //
  myBall = new Ball(width, height); //line can be anywhere
  yourBall = new Ball(width, height);
  
  //
  println("Exciting... not exciting"); //Ball Object immediately deleted, local variable
  //exit(); //Exit Button, TBA
}//end setup
//Object is garbage collected here

void draw() {
  background(255);
  myBall.draw();
  yourBall.draw(); //Notice Bug
  //
  ballCollisions();
 }//end draw

void keyPressed() {
  //Press W-S-D for Left Paddle
  //Press UP-DOWN-LEFT Arrows for Right Paddle
}//end keyPresseded

void mousePressed() {
}//end mousePressed

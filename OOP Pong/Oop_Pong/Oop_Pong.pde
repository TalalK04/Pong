// Global Variables
Ball myBall; 
Ball yourBall;

void setup() {

  size(700, 500);
  //An object is... See the class
  //
  myBall = new Ball(width*1/10, height*1/3, width*1/25, color(31, 255, 3), 1, 1); //line can be anywhere
  yourBall = new Ball(width*9/10, height*1/3, width*1/25, color( random(0, 255), random(255), random(255)), 1, 1);
  //
  println("Exciting... not exciting"); //Ball Object immediately deleted, local variable
  //exit(); //Exit Button, TBA
}//end setup
//Object is garbage collected here

void draw() {
  background(255);
  myBall.draw();
  yourBall.draw(); //Notice Bug
 }//end draw

void keyPressed() {
}//end keyPresseded

void mousePressed() {
}//end mousePressed

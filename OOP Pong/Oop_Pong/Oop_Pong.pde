// Global Variables

void setup() {
  size(700, 500); 

  //An object is... See the class
  Ball myBall = new Ball(width*1/10, height*1/3, width*1/25, color(31, 255, 3)); //line can be anywhere
  Ball yourBall = new Ball(width*9/10, height*1/3, width*1/25, color(31, 255, 3));
  //
  myBall.draw();
  yourBall.draw(); //Notice Bug
  //
  println("Exciting... not exciting"); //Ball Object immediately deleted, local variable
  //exit(); //Exit Button, TBA
}//end setup
//Object is garbage collected here
void draw() {
  //Empty loop (especially needed in abstract classes)
}//end draw

void keyPressed() {
}//end mousePressed

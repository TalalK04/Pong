// Global Variables

void setup() {
  size(700, 500); 
  
  //An object is... See the class
  Ball myBall = new Ball(); //line can be anywhere
  //A Constructor is... 
  myBall.x = width*1/10;
  myBall.y = height*1/3;
  myBall.diameter = width*1/25;
  myBall.colour = color(31, 255, 3); //Hexidecimal: #1FF03, Night Mode friendly
  //
  fill(myBall.colour);
  ellipse(myBall.x, myBall.y, myBall.diameter, myBall.diameter);
  println("Exciting... not exciting"); //Ball Object immediately deleted, local variable
  //exit(); //Exit Button, TBA
}//end setup
//Object is garbage collected here
void draw() {
  //Empty loop (especially needed in abstract classes)
}//end draw

void keyPressed() {
  
}//end mousePressed

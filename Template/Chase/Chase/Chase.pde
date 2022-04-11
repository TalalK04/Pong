//Global Variables
int starCounter = 10;
Ball[] stars = new Ball[starCounter]; // Processing Requires #, Pure Java allows static Variable
float appWidth, appHeight;
float  smallerDisplayDimension;
float xRandom, yRandom, diameterRandom;
boolean overlapping = true;

void setup() {
  size(1000, 1200); 
  //Portrait, not landscape or square
  display();
  starsPop();
}//end setup

void draw() {
  background(0);
  for ( int i=0; i<stars.length; i++ ) {
    stars[i].drawStar();
  }//end for population
}//end draw

void keyPressed() {
}//end keyPressed

void mousePressed() {
}//end mousePressed

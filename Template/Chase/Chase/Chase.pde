//Global Variables
int starCounter = 5;
Ball[] stars = new Ball[starCounter]; // Processing Requires #, Pure Java allows static Variable
float appWidth, appHeight;
float  smallerDisplayDimension;
float xRandom, yRandom, diameterRandom;
boolean overlapping = true;
boolean setTarget = false;
boolean blackhole = true;

void setup() {
  size(1000, 1200); 
  //Portrait, not landscape or square
  display();
  starsPop();
}//end setup

void draw() {
  background(0);
  for ( Ball star : stars ) {
    star.drawStar();
  }//end for population
}//end draw

void keyPressed() {
  if (key == ' ') blackhole = false;
}//end keyPressed

void mousePressed() {
if(mousePressed){
  for (Ball star : stars) {
    star.setTargetX(mouseX); 
    star.setTargetY(mouseY);
  }//end FOR
}//end IF
}//end mousePressed

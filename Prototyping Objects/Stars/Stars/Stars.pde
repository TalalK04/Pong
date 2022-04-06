//Global Variables
int starCounter = 10;
Ball[] stars = new Ball[starCounter]; // Processing Requires #, Pure Java allows static Variable
float appWidth, appHeight;
float  smallerDisplayDimension;
float xRandom, yRandom, diameterRandom;

void setup() {
  size(1000, 1200); 
  //Portrait, not landscape or square
  println(width, height, displayWidth, displayHeight);
  appWidth = width;
  appHeight = height;
  smallerDisplayDimension = ( appWidth <= appHeight ) ? appWidth : appHeight;
  //while (yRandom-diameterRandom*1/2 < appHeight*0 || yRandom+diameterRandom*1/2 > appHeight)
  //while (xRandom-diameterRandom*1/2 < appWidth*0 || xRandom+diameterRandom*1/2 > appWidth) 
  for ( int i=0; i<stars.length; i++ ) {
    float diameterRandom = random (smallerDisplayDimension*1/8, smallerDisplayDimension*1/4);
    float xRandom = random (0+diameterRandom*1/2, appWidth-diameterRandom*1/2); //No stars should be in the net
    float yRandom = random (0+diameterRandom*1/2, appHeight-diameterRandom*1/2);
    int j = i;
    while (j>=0) {
      if ( xRandom > stars[j].x-stars[j].diameter*1/2 && xRandom < stars[j].x-stars[j].diameter*1/2) {
        xRandom = random (diameterRandom*1/2, appWidth-diameterRandom*1/2);
      }
       if ( yRandom > stars[j].y-stars[j].diameter*1/2 && yRandom < stars[j].y-stars[j].diameter*1/2) {
        yRandom = random (diameterRandom*1/2, appHeight-diameterRandom*1/2);
      }
      j--;
    }
    stars[i] = new Ball ( xRandom, yRandom, diameterRandom );
  }//end for population
}//end draw

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

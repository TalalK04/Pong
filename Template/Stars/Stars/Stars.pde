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
  println(width, height, displayWidth, displayHeight);
  appWidth = width;
  appHeight = height;
  smallerDisplayDimension = ( appWidth <= appHeight ) ? appWidth : appHeight;

  while (overlapping == true) {
    for ( int i=0; i<starCounter; i++ ) {
      float diameterRandom = random (smallerDisplayDimension*1/8, smallerDisplayDimension*1/4);
      float xRandom = random (0+diameterRandom*1/2, appWidth-diameterRandom*1/2); //No stars should be in the net
      float yRandom = random (0+diameterRandom*1/2, appHeight-diameterRandom*1/2);
      float d = dist(xRandom, yRandom, stars[i].x, stars[i].y);
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      int j = i;

      while (j>=0) {
        if ( d > (stars[j].diameter*1/2 + diameterRandom*1/2) ) {
          xRandom = random (diameterRandom*1/2, appWidth-diameterRandom*1/2);
          yRandom = random (diameterRandom*1/2, appHeight-diameterRandom*1/2);
        }//end xy while
        j--;
      }//end IF
      stars[i] = new Ball ( xRandom, yRandom, diameterRandom );
   
  }//end FOR
    overlapping = false;
    
    for (int i=0; i<stars.length; i++) {
      for (int j=stars.length-1; j>i; j--) {
        float distance = dist(stars[j].x, stars[j].y, stars[i].x, stars[i].y);
        if  ( distance < (stars[j].diameter*1/2 + stars[i].diameter*1/2) ) overlapping = true;
      }//end J FOR
    }//end I FOR
  }//end overlapping WHILE
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


//int j = i;



//  while (j>=0) {  
//        if ( ((yRandom + diameterRandom*1/2) > (stars[j].y - diameterRandom*1/2)) && ( (yRandom - diameterRandom*1/2) < stars[j].y + diameterRandom*1/2) ) {
//          yRandom = random (diameterRandom*1/2, appHeight-diameterRandom*1/2);
//        }//end IF
//        j--;
//      }//end while
//      stars[i] = new Ball ( xRandom, yRandom, diameterRandom );

//for (int j = 0; j < stars.length; j++) {
//  float d = dist(xRandom, yRandom, stars[j].x, stars[j].y);
//  if (d < (diameterRandom*1/2 + stars[j].diameter) ) {
//    overlapping = true;
//    break;
//  }
//}//end j FOR
//if (overlapping == false) {
//  stars[i] = new Ball (xRandom, yRandom, diameterRandom);
//}

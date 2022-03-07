//Global variables
//Best Practie: initialization on similar lines;
float xBall, yBall, ballDiameter;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet; // left net line
float xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle, xPaddleRight, yPaddleRight; // right/left paddles
float x1RightNet, y1RightNet, x2RightNet, y2RightNet; //right net line
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine; //middle line
float xLeftScore, yLeftScore, widthScore, heightScore, xRightScore, yRightScore; //score
boolean landscapeMode = false;
 




void setup() {
  //Geometry Communication and Variables for GUI Ratios
  size(700, 500); //Landscape-orientation, //fullScreen(); //displayWidth, displayHeight
  population(); //one purpose of developer written functions
  
  if (height <= width){
   landscapeMode = true; 
  }
  
    if (landscapeMode == true){
  return;
  } else {
    xMove = 0;
    yMove = 0;
    text("This game is only compatible in LANDSCAPE mode.  Please change the size of your screen", (height*1/2)-10, width*1/10);
  }
  
}//end setup

void draw() {
  background(0);
  //objects use varibales to ID purpose of function
  
  ball();
  leftPaddleDraw(); //another pupose of developer written functions
  rightPaddleDraw();
  stroke(255);
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine); //nedds to be dotted
  rect(xLeftScore, yLeftScore, widthScore, heightScore); //score left
  rect(xRightScore, yRightScore, widthScore, heightScore); //score right
}//end draw

void keyPressed() {
  //Right Paddle: ARROW Keys
  rightPaddlekeyPressed();
  leftPaddlekeyPressed();
}//end keyPressed

void mousePressed() {
}//end mousePressed

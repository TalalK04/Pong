class Ball {
  //Global Variables
  float x, y, diameter;
  color colour;
  int xSpeed, ySpeed;
  //
  Ball(float xParameter, float yParameter, float diameterParameter, color colourParameter, int xSpeedParameter, int ySpeedParameter) { //Constructor Is...
    x = xParameter;
    y = yParameter;
    diameter =  diameterParameter;
    colour = colourParameter; //Hexidecimal: #1FF03, Night Mode friendly
    xSpeed = xSpeedParameter;
    ySpeed = ySpeedParameter;
  }//end Constructor

  void draw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    //
    move();
    Bounce();
  }// end draw
  
  void move() {
  x += xSpeed;
  y += ySpeed;
}//end move

void Bounce() {
  //not bounce for Paddles
  if (x-diameter*1/2 < width*0 || x+diameter*1/2 > width) xSpeed *= -1;
  if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) ySpeed *= -1; //Top and Bottom
 
}//end Bounce
}//End ball

class Ball {
  //Global Variables
  float x, y, diameter;
  color colour;
  //
  Ball(float xParameter, float yParameter, float diameterParameter, color colourParameter) { //Constructor Is...
    xParameter = width*1/10;
    yParameter = height*1/3;
    diameterParameter = width*1/25;
    colourParameter = color(31, 255, 3); //Hexidecimal: #1FF03, Night Mode friendly
  }//end Constructor

  void draw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
  }// end draw
}//End ball

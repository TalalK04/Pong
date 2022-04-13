void display () {
  println(width, height, displayWidth, displayHeight);
  appWidth = width;
  appHeight = height;
  smallerDisplayDimension = ( appWidth <= appHeight ) ? appWidth : appHeight;
  println("Press the spacebar to extinguish the blackhole");
}//end display

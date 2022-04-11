void display () {
   println(width, height, displayWidth, displayHeight);
  appWidth = width;
  appHeight = height;
  smallerDisplayDimension = ( appWidth <= appHeight ) ? appWidth : appHeight;
}//end display

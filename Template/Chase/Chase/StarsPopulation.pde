void starsPop() {
  while (overlapping == true) {
    for ( int i=0; i<starCounter; i++ ) {
      float diameterRandom = random (smallerDisplayDimension*1/8, smallerDisplayDimension*1/4);
      float xRandom = random (0+diameterRandom*1/2, appWidth-diameterRandom*1/2); //No stars should be in the net
      float yRandom = random (0+diameterRandom*1/2, appHeight-diameterRandom*1/2);
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      float d = dist(xRandom, yRandom, stars[i].x, stars[i].y);
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
        float d = dist(stars[j].x, stars[j].y, stars[i].x, stars[i].y);
        if  ( d < (stars[j].diameter*1/2 + stars[i].diameter*1/2) ) overlapping = true;
      }//end J FOR
    }//end I FOR
  }//end overlapping WHILE
}//end starPop

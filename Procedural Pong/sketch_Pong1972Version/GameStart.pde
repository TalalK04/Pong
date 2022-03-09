void gameStart() {
  ball();
  fill(255);
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
  leftPaddleDraw(); //another pupose of developer written functions
  rightPaddleDraw();
  scoreBoardRect();
  scoreBoardDraw();
}//end GameStart

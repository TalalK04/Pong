//Global Variables
//
void setup() {
  size(500, 600);
  textSetup();
}//End setup()
//
void draw() {
  textDraw(height, purpleInk, CENTER, CENTER, titleFont, title, titleX, titleY, titleWidth, titleHeight, resetColor); //Left Score
textDraw(height, purpleInk, CENTER, TOP, titleFont, secondTitle, secondX, secondY, secondWidth, secondHeight, resetColor); //Right Score
}//End draw()
//
void keyPressed() {
}//End keyPressed()
//
void mousePressed() {
}//End mousePressed()
//

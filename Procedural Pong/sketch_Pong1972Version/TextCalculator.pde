PFont titleFont;

color blackInk=000000; 
color resetColor=#FFFFFF;
//
void textSetup() {
  titleFont = createFont("Verdana", 55);
}//End textSetup()


void preDrawText(float height, color ink, int alignHorizontal, int alignVertical, PFont font) {
  fill(ink);
  textAlign(alignHorizontal, alignVertical);
}//End preDrawText



void textDraw(float height, color ink, int alignHorizontal, int alignVertical, PFont font, String string, float xScore, float yScore, float widthScore, float heightScore) {
  preDrawText(height, ink, alignHorizontal, alignVertical, font);
  textSize(textCalculator(height, string, widthScore));
  text(string, xScore, yScore, widthScore, heightScore);
  textReset(resetColor);
}//End textDraw()
//
void textReset(color resetColor) {
  fill(resetColor);
}//End textReset

float textCalculator(float size, String string, float widthScore) {
  textSize(size);
  while (textWidth(string) > widthScore) {
    size = size*0.99;
    textSize(size);
  }
  size = size*0.15;
  return size;
}

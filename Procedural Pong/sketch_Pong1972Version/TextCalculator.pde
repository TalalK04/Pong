//Copy over all text lines
//Refer to procedures to execute in setup(), draw(), and whenever drawing text
//
//Global Variables
PFont titleFont;

color blackInk=000000; //Daytime only, not for night mode 
color resetColor=#FFFFFF;
//
void textSetup() {
  titleFont = createFont("Harrington", 55);
}//End textSetup()


void preDrawText(float height, color ink, int alignHorizontal, int alignVertical, PFont font) {
  fill(ink);
  textAlign(alignHorizontal, alignVertical); 
  textFont(font, height);
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

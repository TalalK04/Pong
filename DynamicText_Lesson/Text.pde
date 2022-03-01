//Copy over all text lines
//Refer to procedures to execute in setup(), draw(), and whenever drawing text
//
//Global Variables
PFont titleFont;
int titleX, titleY, titleWidth, titleHeight, secondX, secondY, secondWidth, secondHeight;
//These variables are Global to deal with draw() system resources (i.e initialize & garbage collect)
String title = "Wahoo!", secondTitle = "Hello World";
color purpleInk=#88007D; //Daytime only, not for night mode
color nightModeGreenInk=#04B200; 
color resetColor=#000000;
//
void textSetup()
{
  /*
  println("Start of Console");
   String[] fontList = PFont.list(); //To list all fonts available on system
   //fontList should be LOCAL, for garbage collection
   printArray(fontList);
   */
  titleFont = createFont("Harrington", 55);
  //Population
  titleX = width*1/5;
  titleY = height*1/10;
  titleWidth = width*3/5;
  titleHeight = height*1/10;
  secondX = width*1/5;
  secondY = height*3/10;
  secondWidth = width*3/5;
  secondHeight = height*1/10;
  textLayout();
  //
}//End textSetup()
//
void textLayout()
{
  rect(titleX, titleY, titleWidth, titleHeight);
  rect(secondX, secondY, secondWidth, secondHeight);
}//End textLayout
//
void preDrawText(float height, color ink, int alignHorizontal, int alignVertical, PFont font)
{
  fill(ink);
  textAlign(alignHorizontal, alignVertical); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(font, height); //50 //Change the number until it fits, largest font size
}//End preDrawText
void textDraw(float height, color ink, int alignHorizontal, int alignVertical, PFont font, String string, float xRect, float yRect, float widthRect, float heightRect, color ResetColor)
{
  preDrawText(height, ink, alignHorizontal, alignVertical, font);
  text(string, xRect, yRect, widthRect, heightRect);
  textReset(resetColor);
}//End textDraw()
//
void textReset(color resetColor)
{
  fill(resetColor); //Ink to default //
}//End textReset

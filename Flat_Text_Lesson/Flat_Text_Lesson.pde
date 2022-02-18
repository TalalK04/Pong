size(500, 600);
println("Start of Console");
String[] fontList = PFont.list();
printArray(fontList);
PFont titleFont = createFont("Engravers MT", 55);
int titleX, titleY, titleWidth, titleHeight;

//background(66, 200, 245);

titleX = width*1/5;
titleY = height*1/10;
titleWidth = width*3/5;
titleHeight = height*1/10;

rect(titleX, titleY, titleWidth, titleHeight);

String title = "Wahoo!";
color purpleInk = #88007D; //Daytime only, not for night mode
color nightModeGreenInk = #04B200;
color resetColor = #000000;
//
fill(purpleInk); //Ink
textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
//Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BASELINE]
textFont(titleFont, 51); //Change the number until it fits largest font size
text(title, titleX, titleY, titleWidth, titleHeight);
fill(resetColor); //Ink to default

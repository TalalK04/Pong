import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_Pong1972Version extends PApplet {

//Global variables
float xBall, yBall, ballDiameter;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet; // left net line
float xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle, xPaddleRight, yPaddleRight; // right/left paddles
float x1RightNet, y1RightNet, x2RightNet, y2RightNet; //right net line
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine; //middle line
float xLeftScore, yLeftScore, widthScore, heightScore, xRightScore, yRightScore; //score
boolean landscapeMode = false;
boolean twoPlayer = false;
boolean restart = false;

public void setup() {
   
  population(); 
  if (height < width) landscapeMode = true;
}//end setup

public void draw() {
  background(0);
  
  if (landscapeMode == false) {
    preGameStart();
  } else if ((landscapeMode == true)  && (leftMode == false || rightMode == false)) {
    chooseMode();
  } else if ((landscapeMode == true)  && (leftMode == true && rightMode == true) && (singlePlayer == false && screenSaver == false && twoPlayer == false)) {
    choosePlayerNum();
  } else if ((landscapeMode == true)  && (leftMode == true && rightMode == true) && (screenSaver == true || singlePlayer == true || twoPlayer == true) && (restart == false)) {
    gameStart();
  }

  if (leftGoal == true || rightGoal == true) {
    goalScored();
  }
}//end draw

public void keyPressed() {
  rightPaddlekeyPressed();
  leftPaddlekeyPressed();
  if (key == 'r' || key == 'R') restart = false;
}//end keyPressed

public void mousePressed() {
}//end mousePressed
int xMove, yMove;
boolean rightGoal = false;
boolean leftGoal = false;
int leftScore = 0;
int rightScore = 0;
int bounce = 0;
boolean godMode = false;

public void ball () {
  ballStart();
  ballMove();
}//end ball

public void ballMove() {

  if (godMode == true && (xMove<0 && yMove<0)) {
    xMove = -4;
    yMove = -4;
  } else if (godMode == true && (xMove>0 && yMove>0)) {
    xMove = 4;
    yMove = 4;
  } else if (godMode == false && (xMove>0 && yMove>0)) {
    xMove = 2;
    yMove = 2;
  } else if (godMode == false && (xMove<0 && yMove<0)) {
    xMove = -2;
    yMove = -2;
  }

  if (yBall >= height -(ballDiameter*1/2)) {
    yMove= (yMove*-1);
    bounce += 1;
  }
  if (yBall <= height*0 +(ballDiameter*1/2)) {
    yMove = (yMove*-1);
    bounce += 1;
  }
  if ((leftGoal && rightGoal) == false) {
    xBall+=xMove;
    yBall+=yMove;
  }
  if (rightGoal == true) {
    xBall = (x1RightNet + (ballDiameter*2/3));
    yMove = 0;
  } else rightGoal = false;
  if (leftGoal == true) {
    xBall = (x1LeftNet - (ballDiameter*2/3)); 
    yMove = 0;
    bounce += 1;
  } else leftGoal = false;


  if (xBall >= x1RightNet -(ballDiameter*1/2)) {
    rightGoal = true;
  } 
  if (xBall <= x1LeftNet +(ballDiameter*1/2)) {
    leftGoal = true;
  }

  if ((xBall <= xPaddleLeft + (widthPaddle + ballDiameter*1/2)) && ((yBall >= yPaddleLeft) && (yBall <= (yPaddleLeft + heightPaddle)))) {
    xMove = (xMove*-1);
    bounce += 1;
  } else if ((xBall >= xPaddleRight - (ballDiameter*1/2)) && ((yBall >= yPaddleRight) && (yBall <= (yPaddleRight + heightPaddle)))) {
    xMove = (xMove*-1);
    bounce += 1;
  }

  if (bounce == 5) { 
    heightPaddle = height*1/6;
  } else if (bounce == 10) { 
    heightPaddle = height*1/7;
  } else if (bounce == 15) { 
    heightPaddle = height*1/10;
  } else if (bounce == 20) { 
    heightPaddle = height*1/12;
  } else if (bounce == 25) { 
    heightPaddle = height*1/15;
  }
  if (bounce >= 5) {
    godMode = true;
  }
}//end ballMove

public void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//end ballStart
public void gameStart() {
  leftGoal = false;
  rightGoal = false;
  background(0);
  ball();
  stroke(255);
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
  leftPaddleDraw(); //another pupose of developer written functions
  rightPaddleDraw();
  scoreBoardRect();
  scoreBoardDraw();
}//end GameStart
//Global Variable
int leftPaddleVelocity = 0;
boolean leftMode = false;
boolean singlePlayer = false;



public void leftPaddleDraw () {

  leftPaddleStart(); 
  
  if (screenSaver == true) {
    yPaddleLeft = yBall - heightPaddle*1/2;
  } 
  if (yPaddleLeft >= (height-heightPaddle)) yPaddleLeft = height-heightPaddle;
  if (yPaddleLeft <= height*0) yPaddleLeft = height*0;
}//end leftPaddle

public void leftPaddlekeyPressed() {

  if ((key == 'W' || key == 'w')  && (singlePlayer == true || twoPlayer == true)) {
    yPaddleLeft -= leftPaddleVelocity;
  } 
  if ((key == 'S' || key == 's') && (singlePlayer == true || twoPlayer == true)) {
    yPaddleLeft += leftPaddleVelocity;
  }

  if ((leftPaddleVelocity == 0) && (key == 'e'|| key == 'E')) { //easy
    leftPaddleVelocity = 10;
    leftMode = true;
  } else if ((leftPaddleVelocity == 0) && (key == 'm'|| key == 'M')) { //medium
    leftPaddleVelocity = 5;
    leftMode = true;
  } else if ((leftPaddleVelocity == 0) && (key == 'h'|| key == 'H')) { //hard
    leftPaddleVelocity = 2;
    leftMode = true;
  }

  if ((leftMode == true && rightMode == true) && (key == 'p'|| key == 'P')) singlePlayer = true;
  if ((leftMode == true && rightMode == true) && (key == 't'|| key == 'T')) twoPlayer = true;
} //end leftPaddle


public void leftPaddleStart() {
  rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
}//end  leftPaddleStart
public void population() {

  xBall = width*1/2;
  yBall = height*1/2;
  ballDiameter = width*1/50;
  x2MiddleLine= x1MiddleLine = width*1/2;
  xPaddleLeft = x2LeftNet = x1LeftNet = width*1/40;
  x2RightNet = x1RightNet = width*39/40;
  y1MiddleLine = y1RightNet = y1LeftNet = height*0;
  y2MiddleLine = y2RightNet = y2LeftNet = height;
  widthPaddle = width*1/100;
  heightPaddle = height*1/5;
  xPaddleRight = width*39/40 - widthPaddle;
  yPaddleRight = height*1/2 - (heightPaddle*1/2);
  yLeftScore = yRightScore = height*0;
  widthScore = width*1/10;
  heightScore = height*1/10;
  xLeftScore = width*1/4 - widthScore*1/2;
  xRightScore = width*3/4 - widthScore*1/2;
  yPaddleLeft = height*1/2 - (heightPaddle*1/2);
  
  while (xMove>-2 && xMove<2) xMove = PApplet.parseInt(random( -3, 3));
  while (yMove>-2 && yMove<2) yMove = PApplet.parseInt(random( -3, 3));

}//End population
//Global Variable
int rightPaddleVelocity = 0;
boolean rightMode = false;
boolean screenSaver = false;


public void rightPaddleDraw () {
  rightPaddleStart(); 
  if (screenSaver == true || singlePlayer == true) {
    yPaddleRight = yBall - heightPaddle*1/2;
  }
  
  if (yPaddleRight >= (height-heightPaddle)) yPaddleRight = height-heightPaddle;
  if (yPaddleRight <= height*0) yPaddleRight = height*0;
}//end rightPaddleDraw

public void rightPaddlekeyPressed() {

  if ((key == CODED && keyCode == UP) && (twoPlayer == true)) {
    yPaddleRight -= rightPaddleVelocity;
  } 
  if ((key == CODED && keyCode == DOWN) && (twoPlayer == true)) {
    yPaddleRight += rightPaddleVelocity;
  } 
  
  /////
  if ((rightPaddleVelocity == 0) && (key == '1')) { //easy
    rightPaddleVelocity = 10;
    rightMode = true;
  } 
  if ((rightPaddleVelocity == 0) && (key == '2')) { //medium
    rightPaddleVelocity = 5;
    rightMode = true;
  } 
  if ((rightPaddleVelocity == 0) && (key == '3')) { //hard
    rightPaddleVelocity = 2;
    rightMode = true;
  }
  /////

  if ((leftMode == true && rightMode == true) && (key == 'c'|| key == 'C')) screenSaver = true;
}//end rightPaddle


public void rightPaddleStart() {
  rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
}//end  leftPaddleStart
public void scoreBoard() {
  textSetup();
}//end ScoreBoard

public void scoreBoardDraw() {
  if (rightGoal == true) {
    leftScore = leftScore + 1;
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
  } else {
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(leftScore), xLeftScore, yLeftScore, widthScore, heightScore); //Left Score
  }
  if (leftGoal == true) {
    rightScore = rightScore + 1;
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(rightScore), xRightScore, yRightScore, widthScore, heightScore); //Right Score
  } else {
    textDraw(height, blackInk, CENTER, CENTER, titleFont, str(rightScore), xRightScore, yRightScore, widthScore, heightScore); //Right Score
  }
}//End draw()

public void scoreBoardRect() {
  rect(xLeftScore, yLeftScore, widthScore, heightScore); //score left
  rect(xRightScore, yRightScore, widthScore, heightScore); //score right
}
PFont titleFont;
int blackInk=000000; 
int resetColor=0xffFFFFFF;

public void textSetup() {
  titleFont = createFont("Verdana", 55);
}//End textSetup()

public void preDrawText(float height, int ink, int alignHorizontal, int alignVertical, PFont font) {
  fill(ink);
  textAlign(alignHorizontal, alignVertical);
}//End preDrawText

public void textDraw(float height, int ink, int alignHorizontal, int alignVertical, PFont font, String string, float xScore, float yScore, float widthScore, float heightScore) {
  preDrawText(height, ink, alignHorizontal, alignVertical, font);
  textSize(textCalculator(height, string, widthScore));
  text(string, xScore, yScore, widthScore, heightScore);
  textReset(resetColor);
}//End textDraw()

public void textReset(int resetColor) {
  fill(resetColor);
}//End textReset

public float textCalculator(float size, String string, float widthScore) {
  textSize(size);
  while (textWidth(string) > widthScore) {
    size = size*0.99f;
    textSize(size);
  }
  size = size*0.15f;
  return size;
}//end textCalculator
public void goalScored() {
  population();
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("GOALLL! \n Press 'r' to play again", width*1/2, height*1/2);
  restart = true;
  godMode = false;
  bounce = 0;
}
public void preGameStart() {
  xMove = 0;
  yMove = 0;
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("This game is only compatible in LANDSCAPE mode\nPlease change the size of your screen.", width*1/10, height*1/2.25f);
}//end preGameStart

public void chooseMode() {
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose paddle speed:\nFast (EASY): RightPaddle (press '1') | LeftPaddle (press 'e')\nMedium: RightPaddle (press '2') | LeftPaddle (press 'm')\nSlow (HARD): RightPaddle (press '3') | LeftPaddle (press 'h')", width*1/10, height*1/4);
  text("Left Paddle Controls: W (Up) | S (Down)\nRight Paddle Controls: Up Arrow Key | Down Arrow Key", width*1/10, height*1/1.5f);
}//end chooseMode

public void choosePlayerNum() {
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose how you want to play:\nSingle Player (you will be controlling the Left Paddle): Press 'p'\nTwo Player: Press 't'\nScreenSaver: Press 'c'", width*1/10, height*1/4);
  text("Keep in mind: \n - Paddles will get smaller as the game continues\n - Ball will begin to move faster at some point", width*1/10, height*1/1.75f);
  text("GOOD LUCK!", width*1/10, height*1/1.2f);
}//end choosePlayerNum

  public void settings() {  size(1000, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "sketch_Pong1972Version" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

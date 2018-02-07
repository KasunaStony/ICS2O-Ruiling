/*
Name: Ruiling Ma
Date: 12/12/2016
Version: 2.0
Description: Processing Assignment 2 -- Rochambeau
*/

String title, rules;//strings that need to be print
PFont mono, font;//two fonts
int tx, ty, rx, ry;//coodinates for the stings
int RcX, RcY, Px, Py, Sx, Sy;//coodinates for the images
int computer;//computer choice
PImage Rock, Paper, Scissor, bg;//images
int UserChoice;//user choice


// method to generate a random number between 1 to 3 as the computer choice
int comChoice(){
  return (int)(Math.random() * 3 +1);
}

void setup(){
  
  //initialize everythings
  bg = loadImage("bg.png");
  background(bg);
  size(1000,700);
  noStroke();
  mono = createFont("LetterGothicStd", 32);
  font = createFont("andalemo", 32);
  title = "Welcome to Rochambeau!";
  rules = "Choose one of three and compete with computer";
  tx = width/2;
  ty = height/3;
  rx = width/2;
  ry = height/2;
  RcX = width/7;
  RcY = height/11 * 6;
  Px = width/7 * 3;
  Py = RcY + 10;
  Sx = width/7 * 5;
  Sy = RcY + 10;
  
  Rock  = loadImage("qbHME84.png");
  Paper  = loadImage("qbHME84 copy.png");
  Scissor  = loadImage("qbHME84 copy 2.png");
}
  
void Show(int u){
  fill(0);
  textAlign(CENTER);
  
  // a if statement that determine the user wins or the computer wins
  if (computer == u)
    text("Draw", 500, 600);
  else if (computer == 1 && u == 3){
    text("Rock beats Scissors", 500, 600);
    text("Computer Wins", 500, 650);
  }
  else if (computer == 3 && u == 1){
    text("Rock beats Scissors", 500, 600);
    text("You Wins", 500, 650);
  }
  else if (computer == 1 && u == 2){
    text("Paper beats Rock", 500, 600);
    text("You Wins", 500, 650);
  }
  else if (computer == 2 && u == 1){
    text("Paper beats Rock", 500, 600);
    text("Computer Wins", 500, 650);
  }
  else if (computer == 2 && u == 3){
    text("Scissors beats Paper", 500, 600);
    text("You Wins", 500, 650);
  }
  else if (computer == 3 && u == 2){
    text("Scissors beats Paper", 500, 600);
    text("Computer Wins", 500, 650);
  }
}
  
void mousePressed(){
  // generate a computer choice when mouse pressed
  computer = comChoice();
  //erasure the message before
  fill(255);
  rect(300, 575,600, 100);
  // a if statement that determine the user choice
   if( (mouseX > RcX && mouseX < RcX + 218) && (mouseY > RcY && mouseY < RcY + 210) ){
     UserChoice = 1;
     Show(UserChoice);
   }
   else if((mouseX > Px && mouseX < Px + 204) && (mouseY > Py && mouseY < Py + 204)){
     UserChoice = 2;
     Show(UserChoice);
   }
   else if((mouseX > Sx && mouseX < Sx + 219) && (mouseY > Sy && mouseY < Sy + 212)){
     UserChoice = 3;
     Show(UserChoice);
   }
}

void draw(){
textFont(mono);  
textAlign(CENTER);  
textSize(50);
fill(0);
//print the title
text(title, tx, ty);  
textFont(font);
textSize(30);
//print the rules
text(rules, rx, ry);
//show the images
image(Rock, RcX, RcY);
image(Paper, Px, Py);
image(Scissor, Sx, Sy);
}
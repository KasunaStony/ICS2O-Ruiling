/*
Name: Ruiling Ma
Date: 30/11/2016
Version: 1.0
*/
import static javax.swing.JOptionPane.*;

int UserGuess, computerGuess;
PImage bg, start;
int tx, ty, rx, ry, sx, sy;
PFont mono, font;
String title, rules;

void setup()
{
  size(1000, 700);
  start = loadImage("start.png");
  bg = loadImage("bg.png");
  background(bg);
  mono = createFont("LetterGothicStd", 32);
  font = createFont("andalemo", 32);
  title = "Welcome to HighLow!";
  rules = "Guess a number between 1 to 100";
  tx = width/2;
  ty = height/3;
  rx = width/2;
  ry = height/2;
  sx = width/5*2;
  sy = height/3 * 2;  
} 

int comChoice(){
  return (int)(Math.random() * 100 +1);  
}

void Show(int c, int u){ // Recursion 
  if(u < 1 | u > 100){
    showMessageDialog(null, "Please enter a number between 1 to 100", 
    "Alert", ERROR_MESSAGE);
    u = getInt("Enter a number between 1 to 100");
    Show(c, u);
  }
  if(c == u){
    showMessageDialog(null, "You guessed correctly!", 
    "Hint", INFORMATION_MESSAGE);
    System.exit(0);
  }
  else if(c > u){
    if((c - u)>= 30)
    showMessageDialog(null, "Higher\n Freezing", 
    "Hint", INFORMATION_MESSAGE);
    else if((c - u) >= 20 && (c - u) <= 29 )
    showMessageDialog(null, "Higher\n Cold", 
    "Hint", INFORMATION_MESSAGE);
    else if((c - u) >= 10 && (c - u) <= 19 )
    showMessageDialog(null, "Higher\n Warmer", 
    "Hint", INFORMATION_MESSAGE);
    else if((c - u) >= 5 && (c - u) <= 9 )
    showMessageDialog(null, "Higher\n Hot", 
    "Hint", INFORMATION_MESSAGE);
    else if((c - u) >= 1 && (c - u) <= 4 )
    showMessageDialog(null, "Higher\n Boiling", 
    "Hint", INFORMATION_MESSAGE);
  u = getInt("Guess again");
  Show(c, u);
  }
  else{
    if((u - c) >= 30)
    showMessageDialog(null, "Lower\n Freezing", 
    "Hint", INFORMATION_MESSAGE);
    else if((u - c) >= 20 && (c - u) <= 29 )
    showMessageDialog(null, "Lower\n Cold", 
    "Hint", INFORMATION_MESSAGE);
    else if((u - c) >= 10 && (c - u) <= 19 )
    showMessageDialog(null, "Lower\n Warmer", 
    "Hint", INFORMATION_MESSAGE);
    else if((u - c) >= 5 && (c - u) <= 9 )
    showMessageDialog(null, "Lower\n Hot", 
    "Hint", INFORMATION_MESSAGE);
    else if((u - c) >= 1 && (c - u) <= 4 )
    showMessageDialog(null, "Lower\n Boiling", 
    "Hint", INFORMATION_MESSAGE);
  u = getInt("Guess again");
  Show(c, u);    
  }   
}

void mousePressed(){
  if( (mouseX > sx && mouseX < sx+ 200) && (mouseY > sy && mouseY < sy + 200) ){
    computerGuess = comChoice();
    System.out.println(computerGuess);
    UserGuess = getInt("Enter a number between 1 to 100");
    Show(computerGuess, UserGuess);
   }  
}


  


void draw(){
  textFont(mono);  
  textAlign(CENTER);  
  textSize(50);
  fill(0);
  text(title, tx, ty);  
  textFont(font);
  textSize(30);
  text(rules, rx, ry);
  image(start, sx, sy);
}
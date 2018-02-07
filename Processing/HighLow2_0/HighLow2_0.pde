/*
Name: Ruiling Ma
Date: 12/12/2016
Version: 2.0
Description: Processing Assignment 2 -- Guess Again
*/
import static javax.swing.JOptionPane.*;

int UserGuess, computerGuess;// variable of user choice and computer choice
PImage bg, start;// image for background and start botton
int tx, ty, rx, ry, sx, sy;// variables for the coordinates of strings
PFont mono, font;// two fonts
String title, rules;// string that need to be print

void setup()
{
  //initialize everythings
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


// method to generate a random number between 1 to 100 as the computer choice
int comChoice(){
  return (int)(Math.random() * 100 +1);  
}

void Show(int c, int u){   
  
  // a loop that will keep going until the user get the number right
  for (;;){
  
    // handle invalid values that ask user to enter again
    if(u < 1 | u > 100){
    showMessageDialog(null, "Please enter a number between 1 to 100", 
    "Alert", ERROR_MESSAGE);
    u = getInt("Enter a number between 1 to 100");
    }
    
    // when user guess right, popup that they are right and exit
    if(c == u){
      showMessageDialog(null, "You guessed correctly!", 
      "Hint", INFORMATION_MESSAGE);
      System.exit(0);
    }
    
    // when user doesn't get it right, popup a hint and ask them to guess again
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
  u = getInt("Guess again");// when user doesn't get it right, popup a hint and ask them to guess again 
  
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
  }
  }
}


// when the user presse the start botton
void mousePressed(){
  if( (mouseX > sx && mouseX < sx+ 200) && (mouseY > sy && mouseY < sy + 200) ){
    // generate a computer choice
    computerGuess = comChoice();
    // print the computer choice in console
    System.out.println(computerGuess);
    // get the first user guess
    UserGuess = getInt("Enter a number between 1 to 100");
    // call the Show method
    Show(computerGuess, UserGuess);
   }  
}


  


void draw(){
  textFont(mono);  
  textAlign(CENTER);  
  textSize(50);
  fill(0);
  // print the title
  text(title, tx, ty);  
  textFont(font);
  textSize(30);
  // pirnt the rules
  text(rules, rx, ry);
  // the start botton
  image(start, sx, sy);
}
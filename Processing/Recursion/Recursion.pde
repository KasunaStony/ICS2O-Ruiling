/*
Program-name: HowToCode_Recursion
Date: 2017/01/12
Credit: Ruiling Ma(KasunaStony)
Version: 1.0
Description: Teach recursion and recursive method(in Java)
*/

//import necessary packages
import java.util.*;
import static javax.swing.JOptionPane.*;

//all the picture objects 
picture title, front, start, bottom, pre, next, introduction, definition, goals, example, explanation, form, analysis, d2, solution, quiz1, quiz2, quiz3, result, ex1, ex2, ex3, back, bye;
//number of questions in quiz
final int q = 5;
//UserName
String username = null;
//page number
int page = 0;
//y loc of text of quiz result
int xp;
//quiz score
float score;
//user answer of quiz questions
String a[] = new String[q];
//check if the consle output is clean
boolean consle;
//control the appearence of explanation 
boolean e1 = false;
boolean e2 = false;
boolean e3 = false;
//check if user get the right answer or not
boolean[] answer = new boolean[q];
//check if the user input an answer or not
boolean[] control = new boolean[q];

//class picture of images
class picture{
  //loc of images
  int xloc, yloc;
  //image reference
  PImage image;
  //constructor
  picture(int x, int y, PImage i){  
    xloc = x;
    yloc = y;
    image = i;  
  }
}
 
//setup method 
void setup(){  
  size(1200, 650);
  background(0);
  //initialize a[] array as no answers
  for(int i = 0; i < 5; i++){
    a[i] = "/";
  }
  //initialize every picture object
  title = new picture(0, 10, loadImage("recursion.jpg"));
  front = new picture(260, 110, loadImage("0.png"));
  start = new picture(544, 475, loadImage("start.jpg"));
  bottom = new picture(15, 605, loadImage("bottom.jpg"));
  pre = new picture(30, 535, loadImage("pre.jpg"));
  next = new picture(1100, 535, loadImage("next.jpg"));
  introduction = new picture(0, 15, loadImage("introduction.jpg"));
  definition = new picture(600, 125, loadImage("definition.jpg"));
  goals = new picture(0, 125, loadImage("goals.jpg"));
  example = new picture(0,0, loadImage("example.jpg"));
  explanation = new picture(0, 0, loadImage("explanation.jpg"));
  form = new picture(0, 0, loadImage("form.jpg"));
  analysis = new picture(0, 0, loadImage("Analysis.jpg"));
  d2 = new picture(0, 0, loadImage("2d.jpg"));
  solution = new picture(-10 ,65, loadImage("solution.png"));
  quiz1 = new picture(0, 0, loadImage("quiz1.jpg"));
  quiz2 = new picture(0, 0, loadImage("quiz2.jpg"));
  quiz3 = new picture(0, 0, loadImage("quiz3.jpg"));
  result = new picture(0, 0, loadImage("result.jpg"));
  ex1 = new picture(300, 100, loadImage("ex1.png"));
  ex2 = new picture(300, 100, loadImage("ex2.png"));
  ex3 = new picture(300, 100, loadImage("ex3.png"));
  back  = new picture(0, 0, loadImage("back.jpg"));
  bye = new picture(0, 0, loadImage("bye.jpg"));
}
//check if the user input an answer and change the control[] to show "Answer Accepted"
void Accept(int i){
 
  if(i == 0){
    control[i] = true;
  }
  else if(i == 1){
    control[i] = true;
  }
  else if(i == 2){
    control[i] = true;
  }
  else if(i == 3){
    control[i] = true;
  }
  else if(i == 4){
    control[i] = true;
  }
}
//simulate the recursive method
void example(){
  //deal with exception if user cancel the input
  try{
    //need text() in this method so stop the draw()
  noLoop();
  //check the consle is clean or not
  if(!consle){
    showMessageDialog(null, "Please clean the consle before you try again", 
    "Alert", ERROR_MESSAGE);   
    return;
  }  
  
  fill(255);
  textSize(25);
  //an ArrayList of Strings of user input
  List<String> e = new ArrayList<String>();
  //first input
  String str = getString("Enter a Stirng: ");
  //text location
  int x = 625;
  int y = 135;
  
  //read user input and add the input to the List until meet a "." 
  while(!str.equals(".")){
    e.add(str);    
    str = getString("Enter a Stirng: ");
  }
  
  
  //the last input is "."
  e.add(".");
  //text an empty line
  text("\n", x, y);
  //text the Strings from end to start
  for(int i = e.size() - 1; i >= 0; i--){
    y += 30;    
    text(e.get(i), x, y);    
  }
  //the consle is not clean
  consle = false;
  //deal with exception if user cancel the input
  }catch(NullPointerException e){   
    }
  return; 
}

void mousePressed(){
  //page 0
  if((page == 0) && (mouseX > start.xloc && mouseX < start.xloc + 112) && (mouseY > start.yloc && mouseY < start.yloc + 112)){
    //get a username
    username = getString("Enter an username");
    //if user cancle or enter an empty String, initialize the username as "Null"
    if(username == null || username.equals("")){
      showMessageDialog(null, "Don't want a user name? I'll call you Null then~", 
      "Message", INFORMATION_MESSAGE);
      username = "Null";
    }
    loop();
    //go to next page
    page++;       
  }
  //when click the pre icon, go back one page
  else if((page >= 1) && (mouseX > pre.xloc && mouseX < pre.xloc + 70) && (mouseY > pre.yloc && mouseY < pre.yloc + 70)){
    loop();
    page--;
  }
  //when click the next icon, go forward one page
  else if((page >= 1) && (mouseX > next.xloc && mouseX < next.xloc + 70) && (mouseY > next.yloc && mouseY < next.yloc + 70)){
    loop();
    page++;
  }
  //when at page 2 and click the "try it", start the simulation of the recursive method
  else if((page == 2) && (mouseX > 500 && mouseX < 710) && (mouseY > 475 && mouseY < 520)){
    example();
  }
  //when at page 2 and click the "clean consle", clean the consle
  else if((page == 2) && (mouseX > 523 && mouseX < 690) && (mouseY > 530 && mouseY < 560)){
    consle = true;
    loop();
  }
  //when at page 6 and click the "solution", show solution
  else if((page == 6) && (mouseX > 815 && mouseX < 985) && (mouseY > 495 && mouseY < 525)){
    noLoop();
    image(solution.image, solution.xloc, solution.yloc);    
  }
  //when at page 6 and click the "X", close the solution
  else if((page == 6) && (mouseX > 558 && mouseX < 589) && (mouseY > 69 && mouseY < 98)){
    loop();      
  }  
  //when at page 7(first page of the quiz)and click on the first "input answer"
  else if((page == 7) && (mouseX > 80 && mouseX < 345) && (mouseY > 340 && mouseY < 385)){   
    //answer hasn't been accept yet
    control[0] = false;
    //deal with NumberFormatException if user input is not a int or been cancled
    try{
      //get the user's answer
      int an = getInt("Enter your answer of question 1.a: ");
      //record the user's answer
      a[0] = String.valueOf(an);
      //check if user is right
      answer[0] = (an == 32);
      //text that answer has been accepted
      Accept(0);
      //warn the user that he/she need to input an integer
    }catch(NumberFormatException e){
         showMessageDialog(null, "Please Enter an Integer", 
         "Alert", ERROR_MESSAGE);       
    }
  }
  //when at page 7(first page of the quiz)and click on the second "input answer"
  else if((page == 7) && (mouseX > 80 && mouseX < 345) && (mouseY > 450 && mouseY < 500)){
    //answer hasn't been accept yet
     control[1] = false;
     //deal with NullPointerException if user input has been canceld
     try{
       //get the user's answer
       String an = getString("Enter your answer of question 1.b: ");
       //record the user's answer
       a[1] = an;
       //check if user is right
       answer[1] = (an.equals("n"));
       //text that answer has been accepted
       Accept(1); 
       //warn the user that he/she need to input an answer
    }catch(NullPointerException e){   
      showMessageDialog(null, "Please Enter your answer", 
         "Alert", ERROR_MESSAGE); 
    }
  }
  //when at page 8(second page of the quiz)and click on the first "input answer"
  else if((page == 8) && (mouseX > 80 && mouseX < 345) && (mouseY > 340 && mouseY < 385)){    
    //answer hasn't been accept yet
    control[2] = false;
    //deal with NumberFormatException if user input is not a int or been cancled
    try{
      //get the user's answer
      int an = getInt("Enter your answer of question 2.a: ");
      //record the user's answer
      a[2] = String.valueOf(an);
      //check if user is right
      answer[2] = (an == 1213121);
      //text that answer has been accepted
      Accept(2);
       //warn the user that he/she need to input an integer
    }catch(NumberFormatException e){
         showMessageDialog(null, "Please Enter an Integer", 
         "Alert", ERROR_MESSAGE);       
    }
  }
  //when at page 8(second page of the quiz)and click on the second "input answer"
  else if((page == 8) && (mouseX > 80 && mouseX < 345) && (mouseY > 450 && mouseY < 500)){    
    //answer hasn't been accept yet
    control[3] = false;
    //deal with NumberFormatException if user input is not a int or been cancled
    try{
      //get the user's answer
      int an = getInt("Enter your answer of question 2.b: ");
      //record the user's answer
      a[3] = String.valueOf(an);
      //check if user is right
      answer[3] = (an == 7);
      //text that answer has been accepted
      Accept(3);
      //warn the user that he/she need to input an integer
    }catch(NumberFormatException e){
         showMessageDialog(null, "Please Enter an Integer", 
         "Alert", ERROR_MESSAGE);       
    }
  }
  //when at page 9(third page of the quiz)
  else if((page == 9) && (mouseX > 30 && mouseX < 200) && (mouseY > 390 && mouseY < 525)){
    //answer hasn't been accept yet
    control[4] = false;
    //record the user's answer
    a[4] = "A";
    //check if user is right
    answer[4] = false;
    //text that answer has been accepted
    Accept(4);
  }
  //same as above
  else if((page == 9) && (mouseX > 260 && mouseX < 440) && (mouseY > 390 && mouseY < 525)){
    control[4] = false;
    a[4] = "B";
    answer[4] = true;
    Accept(4);
  }
  //same as above
  else if((page == 9) && (mouseX > 510 && mouseX < 690) && (mouseY > 390 && mouseY < 525)){
    control[4] = false;
    a[4] = "C";
    answer[4] = false;
    Accept(4);
  }
  //same as above
  else if((page == 9) && (mouseX > 760 && mouseX < 950) && (mouseY > 390 && mouseY < 525)){
    control[4] = false;
    a[4] = "D";
    answer[4] = false;
    Accept(4);
  }
  //when at page 10(quiz result page)
  else if((page == 10) && (mouseX > 985 && mouseX < 1170) && (mouseY > 200 && mouseY < 225)){
    //show the explanation of question 1
    e1 = true;
  }
  else if((page == 10) && (mouseX > 985 && mouseX < 1170) && (mouseY > 280 && mouseY < 305)){
    //show the explanation of question 2
    e2 = true;
  }
  else if((page == 10) && (mouseX > 985 && mouseX < 1170) && (mouseY > 340 && mouseY < 365)){
    //show the explanation of question 3
    e3 = true;
  }
  //if click on the "X", close all explannation
  else if((page == 10) && (mouseX > 865 && mouseX < 900) && (mouseY > 104 && mouseY < 136)){
    e1 = e2 = e3 = false;
  }  
}

//draw bottom image
void drawBottom(){
  image(bottom.image, bottom.xloc, bottom.yloc);
}
//draw next icon
void drawNext(){
  image(next.image, next.xloc, next.yloc, 70,70);
}
//draw pre icon
void drawPre(){
  image(pre.image, pre.xloc, pre.yloc, 70,70);
}

void draw(){
  //only 12 pages
  page = page < 13 ? page:12;
   //opening page
  if(page == 0){
    background(0);
    drawBottom();
    image(title.image, title.xloc, title.yloc);
    image(front.image, front.xloc, front.yloc);
    image(start.image, start.xloc, start.yloc, 112, 112);
  }
  //introduction page
  else if(page == 1){
    background(0);    
    image(introduction.image, introduction.xloc, introduction.yloc);
    image(definition.image, definition.xloc, definition.yloc);
    image(goals.image, goals.xloc, goals.yloc);
    drawBottom();
    drawNext();
    drawPre();
  }
  //example page
  else if(page == 2){    
    background(0);
    consle = true;
    image(example.image, example.xloc, example.yloc);
    drawBottom();
    drawNext();
    drawPre();
  }
  //explanation of the example
  else if(page == 3){
    background(0);
    image(explanation.image, explanation.xloc, explanation.yloc);
    drawBottom();
    drawNext();
    drawPre();
  }
  //Gerenal form page
  else if(page == 4){
    background(0);
    image(form.image, form.xloc, form.yloc);
    drawBottom();
    drawNext();
    drawPre();    
  }
  //analysis page
  else if(page == 5){
    background(0);
    image(analysis.image, analysis.xloc, analysis.yloc);
    drawBottom();
    drawNext();
    drawPre();  
  }
  // 2-d array page
  else if(page == 6){
    background(0);
    image(d2.image, d2.xloc, d2.yloc);
    drawBottom();
    drawNext();
    drawPre();
  }
  //first page of quiz
  else if(page == 7){
    fill(69, 133, 108);
    textSize(25);
    background(0);
    image(quiz1.image, quiz1.xloc, quiz1.yloc);
    drawBottom();
    drawNext();
    drawPre();
    //show the first "Answer accepted!"
    if(control[0])
      text("Answer accepted!", 360, 370);
     //show the second "Answer accepted!"
    if(control[1])
      text("Answer accepted!", 360, 485);
  }
  //second page of quiz
  else if(page == 8){
    fill(69, 133, 108);
    textSize(25);
    background(0);
    image(quiz2.image, quiz2.xloc, quiz2.yloc);
    drawBottom();
    drawNext();
    drawPre();
    //show the first "Answer accepted!"
    if(control[2])
      text("Answer accepted!", 360, 370);
      //show the second "Answer accepted!"
    if(control[3])    
      text("Answer accepted!", 360, 485);
  }
  //third page of quiz
  else if(page == 9){
    fill(69, 133, 108);
    textSize(25);
    background(0);
    image(quiz3.image, quiz3.xloc, quiz3.yloc);
    drawBottom();
    drawNext();
    drawPre();
    //show the "Answer accepted!"
    if(control[4])
      text("Answer accepted!", 980, 500);
  }
  //quiz result page
  else if(page == 10){
    textSize(25);
    fill(255);
    xp = 200;
    score = 0;
    background(0);
    image(result.image, result.xloc, result.yloc);
    drawBottom();
    drawNext();
    drawPre();  
    //text the user's answer and the score for each question
    for(int i = 0; i < q; i++){
      text(a[i], 210, xp);      
      if(answer[i]){
        text("1", 840, xp);
        score ++;
      }
      else
        text("0", 840, xp);
        xp += 40;
      }
      //text the final score
    text(String.format("%.1f",score/5 * 100), 815, 442); 
    //show explanation of each question
    if(e1){
      image(ex1.image, ex1.xloc, ex1.yloc);
    }
    if(e2){
      image(ex2.image, ex2.xloc, ex2.yloc);
    }
    if(e3){
      image(ex3.image, ex3.xloc, ex3.yloc);
    }      
  }
  //look back and forward page
  else if(page == 11){
    background(0);
    image(back.image, back.xloc, back.yloc);
    drawBottom();
    drawNext();
    drawPre();
  }
  //end page
  else if(page == 12){
    textSize(80);
    fill(255);
    background(0);
    image(bye.image, bye.xloc, bye.yloc);
    drawBottom();
    drawPre();
    //text the username after the "thank you, "
    text(username, 630, 240);
  }  
}
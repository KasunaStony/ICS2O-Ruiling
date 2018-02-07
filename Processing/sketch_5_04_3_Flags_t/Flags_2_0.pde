/*
Name: Ruiling Ma
Date: 12/12/2016
Version: 2.0
Description: Processing Assignment 2 -- Flags
*/

String title, f, s, t, e;//String that need to be print on the screen
PFont mono, font;//Two fonts
PImage bg;//background picture
int tx, ty, fx, fy, sx, sy, tix, tiy, ex, ey;//coordinates of strings
int bx, by, bw, bh;//coordinates of flags

void setup(){
  //initialize everythings
  size(1000, 700);
  noStroke();
  bg = loadImage("bg.png");
  background(bg);
  title = "Welcome to Ruiling's flag generator. Select the flag to display:";
  f = "1. Botswana";
  s = "2. Bahamas";
  t = "3. Kuwait";
  e = "Exit";
  tx = width/2;
  ty = height/8;
  fx = width/10;
  fy = height/10 * 2;
  sx = fx;
  sy = height/10 * 3;
  tix = fx;
  tiy = height/10 * 4;
  ex = fx;
  ey = height/10 * 5;
  
  bx = width/2;
  by = height/5;
  bw = width/5 * 2;
  bh = height/3;
  mono = createFont("LetterGothicStd", 32);
  font = createFont("andalemo", 32);
 
}

void draw(){
   textFont(mono);  
   textAlign(CENTER);  
   textSize(20);
   fill(0);
   //print the title
   text(title, tx, ty);
   textAlign(LEFT);
   textFont(font);
   textSize(20);
   //print 4 choices
   text(f, fx, fy);
   text(s, sx, sy);
   text(t, tix, tiy);
   text(e, ex, ey);   
}

void mousePressed(){
  if( (mouseX > fx && mouseX < fx + 110) && (mouseY > fy - 10 && mouseY < fy + 10) )
    draw(1);//when click on 1st, change the flag to Botswana
  else if ( (mouseX > sx && mouseX < sx + 110) && (mouseY > sy - 10 && mouseY < sy + 10) )
    draw(2);//when click on 2ed, change the flag to Bahamas   
  else if ( (mouseX > tix && mouseX < tix + 110) && (mouseY > tiy -10 && mouseY < tiy + 10) )
    draw(3);//when click on 3rd, change the flag to Kuwait        
  else if ( (mouseX > ex && mouseX < ex + 35) && (mouseY > ey -10 && mouseY < ey + 10) )
    System.exit(0);//when click on exit, exit
}


  

void draw(int i){
  
  if (i == 1){  
    //Botswana flag 
    fill(38,95,149);
    rect(bx, by, bw, bh);
    fill(255);
    rect(bx, bh/24 * 9 + 140, bw, bh/24);
    fill(0);
    rect(bx, bh/24 * 10 + 140, bw, bh/24 * 4);
    fill(255);
    rect(bx, bh/24 * 14 + 140, bw, bh/24);   
  }
  
  else if(i == 2){
    
    //Bahamas flag
    fill(50,121,157);
    rect(bx, by, bw, bh);
    fill(245,239,66);
    rect(bx, bh/3 + 140, bw, bh/3);
    fill(0);
    triangle(bx, by, bx, 140 + bh, bx + (bh/2) * sqrt(3), bh/2 + 140);
  }
  else if(i == 3){
    // Kuwait flag 
    fill(58,134,66);
    rect(bx, by, bw, bh);
    fill(213, 37, 40);
    rect(bx, bh/3 * 2 + 140, bw, bh/3);
    fill(0);
    triangle(bx, by, bx, 140 + bh, bx + (bh/2) * sqrt(3), bh/2 + 140);
    fill(255);
    rect(((bh/2) * sqrt(3))/3 * 2 + 500, bh/3 + 140, bw/4 * 3, bh/3);  
  }
}
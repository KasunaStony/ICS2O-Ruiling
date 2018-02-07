/*
Name: Ruiling Ma
Date: Nov 22
Version: 1.0
Description: Flags-Botswana
*/
float r1_x, r1_y, r1_w, r1_h, r2_x, r2_y, r2_w, r2_h, r3_x, r3_y, r3_w, r3_h;//all the vaules for each rect
void setup(){
  size(900,600);     
  colorMode(RGB);
  background(38,95,149);
   noStroke();
  r1_x = 0;
  r1_y = height/24 * 9;
  r1_w = width;
  r1_h = height/24;
  r2_x = 0;
  r2_y = height/24 * 10;
  r2_w = width;
  r2_h = height/24 * 4;
  r3_x = 0;
  r3_y = height/24 * 14;
  r3_w = width;
  r3_h = height/24;//set all the vaules
  
}

void draw(){
  fill(255);
  rect(r1_x, r1_y,r1_w,r1_h);
  fill(0);
  rect(r2_x,r2_y,r2_w,r2_h);
  fill(255);
  rect(r3_x, r3_y,r3_w,r3_h);
  
}
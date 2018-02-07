/*
Name: Ruiling
Date: Nov 22
Version: 1.0
Description: Flag-Bahamas
*/
float x1, y1, x2, y2, x3, y3, r1, r2, r3, r4;
void setup(){
  size(1000,500);
  background(50,121,157);
  noStroke();
  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = height;
  x3 = (height/2) * sqrt(3);
  y3 = height/2;
  r1 = 0;
  r2 = height/3;
  r3 = width;
  r4 = height/3;
}

void draw(){
fill(245,239,66);
rect(r1,r2,r3,r4);
fill(0);
triangle(x1, y1, x2, y2, x3, y3);
}
/*
Name: Ruiling
Date: Nov 22
Version: 1.0
Description: Flag-Kuwait
*/
float x1, y1, x2, y2, x3, y3, r1, r2, r3, r4, t1, t2, t3, t4;
void setup(){
  size(1000,500);
  background(58,134,66);
   noStroke();
  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = height;
  x3 = (height/2) * sqrt(3);
  y3 = height/2;
  r1 = ((height/2) * sqrt(3))/3 * 2;
  r2 = height/3;
  r3 = width/4 * 3;
  r4 = height/3;
  t1 = 0;
  t2 = height/3 * 2;
  t3 = width;
  t4 = height/3;
}

void draw(){
fill(213, 37, 40);
rect(t1, t2, t3, t4);
fill(0);
triangle(x1, y1, x2, y2, x3, y3);
fill(255);
rect(r1,r2,r3,r4);

}
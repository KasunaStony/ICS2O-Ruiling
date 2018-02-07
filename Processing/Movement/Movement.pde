float x = -200, y = 0;
float i = 200, j = 0;
void setup(){
  size(500, 500);
  frameRate(60);
  background(255);
  noStroke();
}


void draw() {

  translate(width/2, height/2);
  background(255);
  if ( x < 200 ) {
    fill(255);
    // rotate(PI/3.0);
    //arc(x - 1, y - 1, 85, 85, 0, radians(300) + 2, PIE);
    x++;
    y = sqrt(200 * 200 - pow(x, 2));
    fill(0);
    arc(x, y, 80, 80, 0, radians(300), PIE);
  }
  else if (x >= 200) {
  
  fill(255);
  // rotate(PI/3.0);
 // arc(i + 1, j + 1, 85, 85, 0, radians(300) + 2, PIE);
  i--;
  j = -(sqrt(200 * 200 - pow(i, 2)));
  fill(0);
  arc(i, j, 80, 80, 0, radians(300), PIE);  
  }
 
}
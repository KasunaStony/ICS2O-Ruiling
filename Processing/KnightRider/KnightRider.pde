/*
Name: Ruiling Ma
Date: 21/12/2016
Vesion: 1.0
Description: Task 1 - Knight Rider
*/

final int W = 75;//width and height of each circle
final int N = 8;//number of circles
Rider k[] = new Rider[N];//an Array of Rider objects, each one is a circle
boolean FB = true;//control the direction
int c = 0;// subscript
int a = 50;//first xLoc
int b = height/2;//yLoc

//class Rider
class Rider{
//xLoc and yLoc for each object  
  int x, y;
//constructor  
Rider(int i, int j){
  
  x = i;
  y = j;
  
 }
}

void setup(){
  
  size(800, 100);
  background(255);
  frameRate(10);
  //construction of each object in the array
  for(int i = 0; i < N; i++){
    //set xLoc and yLoc
    k[i] = new Rider(a, b);
    //change a each time
    a += width/8;
  }
}

void draw(){
  //change direction when reach the end
  if(c == N - 1){
    FB = false;
  }
  //direction to right
  if(FB){
  //draw 8 white circles
  for(int i = 0; i < N; i++){
  fill(255);
  ellipse(k[i].x, k[i].y, W, W);
  }
  //one is red 
  fill(227, 64, 46);
  ellipse(k[c].x, k[c].y, W, W);
  //to right
  c++;
  
  }
  //direction to left
  else{
    //draw 8 white circles
    for(int i = 0; i < N; i++){
      fill(255);
      ellipse(k[i].x, k[i].y, W, W);
  }
  //one is red
  fill(227, 64, 46);
  ellipse(k[c].x, k[c].y, W, W);
  //to left
  c--;
  //change direction when reach the end
  if(c == 0){
    FB = true;
  }
  
  }
  
}
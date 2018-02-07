/*
Name: Ruiling Ma
Date: 21/12/2016
Vesion: 1.0
Description: Task 2 - Binary Counter
*/

final int W = 75;//width and height of each circle
final int N = 8;//number of circles
Rider k[] = new Rider[N];//an Array of Rider objects, each one is a circle
int a = 50;//first xLoc
int b = height/2;//yLoc
int d = 0;//counter

//class Rider
class Rider{
  //xLoc and yLoc for each object 
  int x, y;
  //boolean q represent whether the light is on or off
  boolean q;
  //constructor
Rider(int i, int j, boolean b){
  
  x = i;
  y = j;
  q = b;
  
 }
}
void setup(){
  size(800, 100);
  background(255);
  frameRate(5);
  //construction of each object in the array
  for(int i = 0; i < N; i++){
    k[i] = new Rider(a, b, false);
    //change a each time
    a += width/8;
  }
}

void draw(){ 
  //if finished, stop the draw loop
  if(d == 255)noLoop();
  //draw brand new white 8 circles each time
  for(int i = 0; i < N; i++){
  fill(255);
  ellipse(k[i].x, k[i].y, W, W);
  }  
  //each time +1, basically is just find an off light and turn it on(from right to left) and turn off every light behind it
  wai : for(int i = 7; i >= 0; i--){
    //find the first off light from right to left
    if(!k[i].q){
      //turn on it
      k[i].q = true;
      //turn off every light on the right
      for(int j = i + 1; j < N; j++){
        k[j].q = false;
      }
      //if find the light, break the loop
      break wai;
    }
  }
  //draw every on light
  for(int i = 0; i < N; i++){
    if(k[i].q){
      fill(227, 64, 46);
      ellipse(k[i].x, k[i].y, W, W);
    }
  }
  //counter ++ 
  d++;
  
}
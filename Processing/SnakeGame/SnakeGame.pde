int SLength = 2;
int FHeadX, FHeadY;
char Direction = 'R', Temp;
int pause = 0;

int w = 20;

int x[] = new int [450];
int y[] = new int [450];

boolean Food = true;

int FoodX, FoodY;

boolean gameOver = false;

int Stime, Ttime, Ptime;

int speed = 10;
void setup(){
  size(500,500);
  frameRate(30);
  noStroke();
  Stime = millis();
}

void draw(){
  
  Ttime = 1000/speed;
  Ptime = millis() - Stime;
  
  if(Direction != 'P' && Ptime > Ttime){
    if(GameOver()){
      return;
    }
  
  
  background(244);
  
  switch(Direction){
    case 'L':
      FHeadX -= w;
      break;
    case 'R':
      FHeadX += w;
      break;
    case 'D':
       FHeadY += w;
       break;
     case 'U': 
       FHeadY  -= w;
       break;
  }
  
  
  drawFood(width, height);
  
  if(FHeadX == FoodX && FHeadY == FoodY){
    SLength++;
    Food = true;
  }
  
  drawSnake();
  
  if(Direction!='P' && SnakeDie()){
            return;
        }
  
  Stime = millis();
  
  }
  
}

void drawSnake(){
  for(int i=SLength-1; i>0; i--){
            x[i] = x[i-1];
            y[i] = y[i-1];
        }

        //store snake new head
        y[0] = FHeadY;
        x[0] = FHeadX;

        stroke(0);  //Black
        strokeWeight(1);    //线宽为1

        //draw snakeHead
        fill(47, 111, 129);
        rect(x[0],y[0],w,w);

        //draw snakeBody
        fill(#7B6DB7);
        for(int i=1; i < SLength; i++){
            rect(x[i],y[i],w,w);
        } 
}

void keyPressed(){
  if(key == 'p' || key == 'P'){
    pause++;
    if(pause % 2 == 1){
      Temp = Direction;
      Direction = 'P';
    }
    else
      Direction = Temp;
  }
  
  if(Direction != 'P' && key == CODED){
    switch(keyCode){
      case LEFT:
      Direction = 'L';
      break;
      case RIGHT:
      Direction = 'R';
      break;
      case DOWN:
      Direction = 'D';
      break;
      case UP:
      Direction = 'U';
      break;
    }
  }
}

void Init(){
  background(244);
  SLength = 2;
  gameOver = false;
  FHeadX = 0;
  FHeadY = 0;
  Direction = 'R';
}

void drawFood(int maxw, int maxh){
  fill(47, 111, 129);
  if(Food){
    FoodX = int(random(0, maxw)/w)* w;
    FoodY = int(random(0, maxh)/w)* w;
  }
  rect(FoodX, FoodY, w, w);
  Food = false;
}

boolean GameOver(){
  if(gameOver && keyPressed && (key == 'r'|| key == 'R')){
    Init();
  }
  return gameOver;
}

boolean SnakeDie(){
  if(FHeadX < 0 || FHeadX >= width || FHeadY < 0 || FHeadY >= height){
    pop();
    return true;
  }
  if(SLength>2){
        for(int i=1; i<SLength; i++){
            if(FHeadX==x[i] && FHeadY == y[i]){
                pop();
                return true;
            }
        }
    }
  return false;
}

void pop(){
  pushMatrix();
  
  gameOver = true;
  background(0);
  translate(width/2, height/2 - 50);
    fill(255); 
    textAlign(CENTER); 
    textSize(84);
    text(SLength, 0, 0);
    
    fill(120);
    textSize(18);
    text("Score",0,230);
    text("Game Over, Press 'R' to restart.", 0, 260);

    popMatrix();
}
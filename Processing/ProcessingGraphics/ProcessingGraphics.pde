  
import processing.sound.*;
SoundFile file;

int amplitude;

int offset;


float t;


int numGaps;

void setup() {
  size(640, 640);
  strokeWeight(8);
  smooth();
  numGaps = 40;
  amplitude = height / 10;
  offset = height / 8;
  t = 0;
  file = new SoundFile(this, "/Users/maruiling/ICS2O-Ruiling/Processing/ProcessingGraphics/tokyohot.mp3");
  file.play();
}

void draw(){
  frameRate(10);
  background(0);
  stroke(255);
  
  for (int i = 1; i < numGaps; i++) { 
    float xCoord = i * (width / numGaps);      //x-coordinate of each line
    float yCoord1 = height/2 - (offset + amplitude * sin(t + i))+(float)(Math.random()*100);   
    float yCoord2 = 400; 
    line(xCoord, yCoord1, xCoord, yCoord2);
  }
  
  t+=1;
}
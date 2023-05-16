int scaleX = 80;
int scaleY = 60;
int cols = 0;
int rows = 0;
int padX = 10;
int padY = 10;

void setup() {
  size(800, 600);
  smooth();
  noLoop();
  cols = width / scaleX;
  rows = height / scaleY;
}

void cell(int x, int y, int w, int h){
  rect(x, y, w, h);
}

void draw() {
  background(255);
  strokeWeight(1);
  stroke(0);
  fill(255);
  stroke(0);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*scaleX;
      int y = j*scaleY;
      cell(x+padX, y + padY, scaleX - 2*padX, scaleY - 2*padY); 
    }
  }
}

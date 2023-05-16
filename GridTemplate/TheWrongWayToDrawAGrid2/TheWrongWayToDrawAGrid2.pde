int scaleX = 100;
int scaleY = 50;
int cols = 0;
int rows = 0;

void setup() {
  size(1000, 500);
  smooth();
  noLoop();
  cols = width / scaleX;
  rows = height / scaleY;
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
      rect(x, y, scaleX, scaleY);
    }
  }
}

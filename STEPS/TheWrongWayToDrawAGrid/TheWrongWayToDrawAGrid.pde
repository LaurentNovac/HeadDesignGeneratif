int colCount = 14;
int rowCount = 10;
void setup() {
  size(1280, 720);
  smooth();
  noLoop();
}



void draw() {
  background(255);
  strokeWeight(10);
  stroke(0);

  //drawColumns
  int incX = width / colCount;
  for (int i = 0; i <= colCount; i++) {
    int x = i * incX;
    line(x, 0, x, height);
  }

  //drawRows
  int incY = height / rowCount;
  for (int i = 0; i <= rowCount; i++) {
    int y = i * incY;
    line(0, y, width, y);
  }
}

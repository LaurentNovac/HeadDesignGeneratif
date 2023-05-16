int scaleX = 80;
int scaleY = 50;
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

void myLine(int x, int y, int w, int h) {
  PVector start = new PVector(x, y);
  PVector end = new PVector(w, h);
  int dist = ceil(start.dist(end));
  for(int i = 0; i < dist; i++){//change iter
    float lp = map(i, 0, dist, 0, 1);
    PVector pos = PVector.lerp(start, end, lp);
    point(pos.x, pos.y);
  }
}

void cell(int x, int y, int w, int h) {
  fill(0, 255, 0);
  stroke(0, 255, 0);

  myLine(x, y, x + w, y);
  myLine(x+w, y, x + w, y + h);
  myLine(x+w, y + h, x, y + h);
  myLine(x, y, x, y + h);
}

void draw() {
  background(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*scaleX;
      int y = j*scaleY;
      cell(x+padX, y + padY, scaleX - 2*padX, scaleY - 2*padY);
    }
  }
}

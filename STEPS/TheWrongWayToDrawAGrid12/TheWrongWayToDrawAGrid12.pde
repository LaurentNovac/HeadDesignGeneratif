int scaleX = 80;
int scaleY = 60;
int padX = 4;
int padY = 4;
int cols = 0;
int rows = 0;

void setup() {
  size(800, 600);
  smooth();
  noLoop();
  stroke(0);
  cols = width / scaleX;
  rows = height / scaleY;
}

void cell(int w, int h, float u, float v) {
  float scaleNoise = 50;
  float n = noise(u*scaleNoise, v*scaleNoise);
  fill(u*n*255, v*n*255, 0);
  line(0, 0, w, 0);
  line(w, 0, w, h);
  line(w, h, 0, h);
  line(0,0, 0, h);
}

void draw() {
  background(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*scaleX;
      int y = j*scaleY;
      pushMatrix();
      translate(x+padX, y + padY);
      int w = scaleX - 2*padX;
      int h = scaleY - 2*padY;
      cell(w, h, (float)x / (float)width, (float)y / (float)height);
      popMatrix();
    }
  }
}

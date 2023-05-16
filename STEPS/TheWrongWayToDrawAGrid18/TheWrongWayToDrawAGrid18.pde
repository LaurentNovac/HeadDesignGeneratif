int scaleX = 8;
int scaleY = 6;
int padX = 0;
int padY = 0;
int cols = 0;
int rows = 0;
PImage img;
void setup() {
  size(900, 600);
  smooth();
  noStroke();
  cols = width / scaleX;
  rows = height / scaleY;
  img = loadImage("sat.jpg");
}

void cell(int w, int h, float u, float v) {
  int wImg = img.width;
  int hImg = img.height;

  color c = img.get(round(u* wImg), round(v * hImg));
  fill(c);

  rect(0, 0, w, h);
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

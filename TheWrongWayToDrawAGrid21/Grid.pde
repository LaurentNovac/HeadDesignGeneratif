class Grid {
  int scaleX = 90;
  int scaleY = 60;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  float depth = 0;



  void setup() {
    noStroke();
    cols = width / scaleX;
    rows = height / scaleY;
  }

  void cell(int width, int height, float u, float v, float w) {
    stroke(255);
    float strk = map(w, 0, 1, 2, 0);
    strokeWeight(strk);
    noFill();
    rect(0, 0, width, height);
  }

  void draw() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*scaleX;
        int y = j*scaleY;
        push();
        translate(x+padX, y + padY);
        int w = scaleX - 2*padX;
        int h = scaleY - 2*padY;
        cell(w, h, (float)x / (float)width, (float)y / (float)height, depth);
        pop();
      }
    }
  }
}

class Grid {
  int scaleX = 90;
  int scaleY = 60;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  
  void setup() {
    cols = width / scaleX;
    rows = height / scaleY;
  }

  void cell(int w, int h, float u, float v) {
    //fill(u*255,v*255,0);
    noFill();
    stroke(0);
    rect(0, 0, w, h);
  }

  void draw() {
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
}

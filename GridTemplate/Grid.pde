class Grid {
  int scaleX = 90;
  int scaleY = 60;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  float depth = 0;

  ArrayList<CellData> cellsData;

  void setup() {
    noStroke();
    cols = width / scaleX;
    rows = height / scaleY;
    cellsData = new ArrayList<CellData>();

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        cellsData.add(new CellData());
      }
    }

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*scaleX;
        int y = j*scaleY;
        translate(x+padX, y + padY);
        int w = scaleX - 2*padX;
        int h = scaleY - 2*padY;
        cellInit(w, h, (float)x / (float)width, (float)y / (float)height, depth, cellsData.get(j*cols+i));
      }
    }
  }

  void cellInit(int width, int height, float u, float v, float w, CellData cellData) {
    cellData.n = noise(u, v, w);
  }

  void cell(int width, int height, float u, float v, float w, CellData cellData) {
    stroke(255);
    float strk = map(w, 0, 1, 0.5, 2);
    strokeWeight(strk);
    fill(cellData.n*255);
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
        cell(w, h, (float)x / (float)width, (float)y / (float)height, depth, cellsData.get(j*cols+i));
        pop();
      }
    }
  }
}

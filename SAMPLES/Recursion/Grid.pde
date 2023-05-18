class Grid {
  int scaleX = 900;
  int scaleY = 900;
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
        int w = scaleX - 2*padX;
        int h = scaleY - 2*padY;

        CellData cellData = cellsData.get(j*cols+i);
        cellData.u = (float)x / (float)width;
        cellData.v = (float)y / (float)height;
        cellData.w = depth;
        cellData.width = w;
        cellData.height = h;
        cellInit(cellData);
      }
    }
  }

  void cellInit(CellData cellData) {
  }

  void drawCircle(int x, int y, int d, int recDepth, int currentPlane) {
    recDepth -= 1;
    
    if(recDepth == currentPlane){
      stroke(0);
      noFill();
      ellipse(x, y, d, d);
    }

    if (recDepth > 0) {
      drawCircle(x+d/2, y, d/2, recDepth, currentPlane);
      drawCircle(x-d/2, y, d/2, recDepth, currentPlane);
      drawCircle(x, y-d/2, d/2, recDepth, currentPlane);
    }
  }

  void cell(CellData cellData) {
    int currentPlane = round(map(cellData.w, 0, 1, 0, gridCount - 1));
    drawCircle(cellData.width/2, cellData.height/2, cellData.width/2, gridCount, currentPlane);
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

        CellData cellData = cellsData.get(j*cols+i);
        cellData.u = (float)x / (float)width;
        cellData.v = (float)y / (float)height;
        cellData.w = depth;
        cellData.width = w;
        cellData.height = h;
        cell(cellData);
        pop();
      }
    }
  }
}

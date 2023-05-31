class Grid {
  int scaleX = 90;
  int scaleY = 90;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  float depth = 0;

  ArrayList<CellData> cellsData;

  PGraphics gfx;

  void setup() {
    gfx = createGraphics(width, height, P3D);

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

  void cell(CellData cellData) {
    gfx.stroke(255);
    //float strk = map(w, 0, 1, 0.5, 2);
    gfx.strokeWeight(3);
    gfx.noFill();
    gfx.rect(0, 0, cellData.width, cellData.height);
  }

  void draw() {
    gfx.beginDraw();
    gfx.background(0, 0);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*scaleX;
        int y = j*scaleY;
        gfx.push();
        gfx.translate(x+padX, y + padY);
        int w = scaleX - 2*padX;
        int h = scaleY - 2*padY;

        CellData cellData = cellsData.get(j*cols+i);
        cellData.u = (float)x / (float)width;
        cellData.v = (float)y / (float)height;
        cellData.w = depth;
        cellData.width = w;
        cellData.height = h;
        cell(cellData);
        gfx.pop();
      }
    }
    gfx.endDraw();
    image(gfx, 0, 0);
  }
}

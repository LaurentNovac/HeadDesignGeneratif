class Grid {
  int scaleX = 1;
  int scaleY = 1;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  float depth = 0;
  boolean redraw = true;
  boolean needSave = false;
  ArrayList<CellData> cellsData;
  PImage img;
  PGraphics gfx;
  String filePath;

  void setup() {
    gfx = createGraphics(width, height, P3D);
    img = loadImage("depthmap.jpg");
    
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

  void cell(CellData cellData) {
    gfx.noStroke();
    color c = img.get(round(cellData.u * img.width), round(cellData.v * img.height));
    float d = brightness(c);
    int currentPlane = round(map(cellData.w, 0, 1, 0, gridCount - 1));
    int dIndex = round(map(d, 0, 255, gridCount - 1, 0));

    if (currentPlane == dIndex && d > 0.5) {
      gfx.fill(d, d, d);
      gfx.rect(0, 0, cellData.width, cellData.height);
    }
  }

  void draw() {
    if (redraw || needSave) {
      println("compute "+countDebug++);
      redraw = false;
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
    }

    image(gfx, 0, 0);
  }
}

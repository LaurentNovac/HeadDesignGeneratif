class Grid {
  int scaleX = 10;
  int scaleY = 10;
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

  void cell(CellData cellData) {
    float nx = map(noise(cellData.u), 0, 1, -1, 1);
    float ny = map(noise(cellData.v), 0, 1, -1, 1);


    PVector force = new PVector(nx, ny);
    force.normalize();
    force.mult(.01);

    cellData.acceleration.add(force);

    cellData.velocity.add(cellData.acceleration);
    cellData.position.add(cellData.velocity);

    stroke(255);
    //float strk = map(w, 0, 1, 0.5, 2);
    //strokeWeight(strk);
    fill(255);
    int w = cellData.width;
    int h = cellData.height;
    translate(w/2, h/2);
    ellipse(cellData.position.x, cellData.position.y, w / 2, h / 2);

    cellData.acceleration.mult(0);
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

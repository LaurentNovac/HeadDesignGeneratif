class Grid {
  int scaleX = 10;
  int scaleY = 10;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  float depth = 0;

  String str = "wertQWHFAIzjkfAfliefk)(uasdhjkyxcvbnm.,m+ç%/";
  PImage img;
  ArrayList<CellData> cellsData;

  void setup() {
    noStroke();
    cols = width / scaleX;
    rows = height / scaleY;
    img = loadImage("cat.png");
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

    noiseSeed(1234);
    PFont font= createFont("EuropaLight.otf", 128);
    textFont(font, 12);
    textAlign(CENTER, CENTER);
  }

  void cellInit(CellData cellData) {
  }
  
  void cell(CellData cellData, float t) {
    float time = t;
    float n = noise(cellData.u, cellData.v, time);
    
    color col = img.get(round(cellData.u * img.width),round(cellData.v * img.height));
    float bright = brightness(col)/255.0;
    float anim = (1+sin(t)) / 2;
    
    
    float val = lerp(n, bright, anim);
    
    int charIndex = round(map(val, 0, 1, 0, str.length() - 1));
    char c = str.charAt(charIndex);
    fill(255);
    text(c, cellData.width/2, cellData.height/2);
  }

  void draw(float t) {
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
        cell(cellData, t);

        pop();
      }
    }
  }
}

class Grid {
  int scaleX = 10;
  int scaleY = 10;
  int padX = 0;
  int padY = 0;
  int cols = 0;
  int rows = 0;
  float depth = 0;

  PImage image;
  String str = "OSKAR";

  void setup() {
    noStroke();
    cols = width / scaleX;
    rows = height / scaleY;
    image = loadImage("sat.jpg");
    image.resize(width, height);
    noiseSeed(1234);
    PFont font= createFont("EuropaLight.otf", 128);
    textFont(font, 12);
    textAlign(CENTER, CENTER);
  }

  void cell(int width, int height, float u, float v, float w, float t) {
    float time = t;
    float n = noise(u, v, time);
    n = pow(n, 1);
    int charIndex = round(map(n, 0, 0.8, 0, str.length() - 1));
    char c = str.charAt(charIndex);
    fill(255);
    text(c, width/2, height/2);
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
        cell(w, h, (float)x / (float)width, (float)y / (float)height, depth, t);
        pop();
      }
    }
  }
}

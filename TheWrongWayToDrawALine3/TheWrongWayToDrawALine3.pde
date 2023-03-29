void setup() {
  size(1280, 720);
  smooth();
}

void myLine(int x, int y, int w, int h) {
  PVector start = new PVector(x, y);
  PVector end = new PVector(w, h);
  int dist = ceil(start.dist(end));
  for(int i = 0; i < dist; i++){
    float lp = map(i, 0, dist, 0, 1);
    PVector pos = PVector.lerp(start, end, lp);
    point(pos.x, pos.y);
  }
}

void draw() {
  background(255);
  strokeWeight(2);
  myLine(0, 0, width, height);
}

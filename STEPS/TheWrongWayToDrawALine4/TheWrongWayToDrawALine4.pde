void setup() {
  size(1280, 720);
}

void myLine(int x, int y, int w, int h) {
  PVector start = new PVector(x, y);
  PVector end = new PVector(w, h);
  int dist = ceil(start.dist(end));
  PVector s = start.copy();
  for(int i = 1; i < dist; i++){
    float lp = map(i, 0, dist, 0, 1);
    PVector pos = PVector.lerp(start, end, lp);
    line(s.x,s.y, pos.x, pos.y);
    s = pos;
  }
}

void draw() {
  background(255);
  strokeWeight(1);
  myLine(0, 0, width, height);
}

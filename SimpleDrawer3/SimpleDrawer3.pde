IntList positionsX;
IntList positionsY;

void setup() {
  size(800, 600);
  stroke(255);
  fill(255);
  background(0);
  positionsX = new IntList();
  positionsY = new IntList();
  noiseSeed(42);
}

void draw() {
  if (mousePressed) {
    positionsX.append(mouseX);
    positionsY.append(mouseY);
  }
  background(0);
  if (positionsX.size() > 1) {
    int lastX = positionsX.get(0);
    int lastY = positionsY.get(0);
    for (int i = 2; i < positionsX.size(); i++) {
      int nextX = positionsX.get(i);
      int nextY = positionsY.get(i);
      nextX += 100*sin(millis()*noise(nextX)*0.001);
      nextY += 100*cos(millis()*noise(nextY)*0.001);

      line(lastX, lastY, nextX, nextY);
      lastX = nextX;
      lastY = nextY;
    }
  }
}

void keyPressed() {
  if (key == 'c') {
    positionsX.clear();
    positionsY.clear();
  }
}

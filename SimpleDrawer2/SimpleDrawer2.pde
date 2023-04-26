int[] positions;
void setup() {
  size(800, 600);
  noStroke();
  fill(255);
  background(0);
  positions = new int[500];
}

void draw() {
  if (mousePressed) {
    ellipse(mouseX, mouseY, 10, 10);
  }
}

void keyPressed() {
  if (key == 'c') {
    background(0);
  }
}

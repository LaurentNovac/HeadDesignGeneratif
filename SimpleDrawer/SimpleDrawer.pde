void setup() {
  size(800, 600);
  noStroke();
  fill(255);
  background(0);
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

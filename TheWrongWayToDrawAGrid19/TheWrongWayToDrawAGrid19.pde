Grid g1;
Grid g2;

void setup() {
  size(900, 600, P3D);
  g1 = new Grid();
  g2 = new Grid();

  g1.setup();
  g2.setup();
}

void draw() {
  background(255);
  push();
  translate(width/2, height/2);
  rotate(radians(30));
  translate(-width/2, -height/2);
  g1.draw();
  pop();
  g2.draw();
}

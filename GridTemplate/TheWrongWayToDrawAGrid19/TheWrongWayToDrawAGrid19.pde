Grid g1;
Grid g2;

void setup() {
  size(900, 600, P3D);
  smooth(8);

  g1 = new Grid();
  g2 = new Grid();

  g1.setup();
  g2.setup();
}

void draw() {
  background(255);
  float mX = map(mouseX, 0, width, -300, 300);
  float mY = map(mouseY, 0, height, -300, 300);

  camera(mX+width/2.0, mY+height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), mX+width/2.0, mY+height/2.0, 0, 0, 1, 0);

  push();

  translate(width/2, height/2, -300);
  rotate(radians(30));
  translate(-width/2, -height/2);
  g1.draw();
  pop();

  g2.draw();
}

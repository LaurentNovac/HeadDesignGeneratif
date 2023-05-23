import controlP5.*;

int countDebug = 0;
ArrayList<Grid> grids;
int gridCount = 10;

int zIndex = 0;
float xParallaxOffset = 0;
float yParallaxOffset = 0;
float zNear = 0;
float zFar = 0;
ControlP5 cp5;
boolean drawUI = false;

void initUI() {
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  cp5.addSlider("zIndex")
    .setPosition(100, 50)
    .setValue(zIndex)
    .setRange(0, gridCount);
  cp5.addSlider("xParallaxOffset")
    .setPosition(100, 100)
    .setValue(xParallaxOffset)
    .setRange(-1000, 1000);
  cp5.addSlider("yParallaxOffset")
    .setPosition(100, 150)
    .setValue(yParallaxOffset)
    .setRange(-1000, 1000);
  cp5.addSlider("zNear")
    .setPosition(100, 200)
    .setValue(zNear)
    .setRange(0, 1000);
  cp5.addSlider("zFar")
    .setPosition(100, 250)
    .setValue(zFar)
    .setRange(0, -1000);
}

void setup() {
  size(900, 900, P3D);
  initUI();
  smooth(8);
  grids=new ArrayList<Grid>();

  for (int z=0; z<gridCount; z++) { //loop to make grid, put into array
    Grid grid = new Grid();
    grids.add(grid);
  }

  for (int z=0; z<gridCount; z++) { //loop to get each grid + call their setup
    Grid grid = grids.get(z);
    grid.setup();
  }
}

void draw() {
  background(128);
  push();
  float x = xParallaxOffset;
  float y = yParallaxOffset;

  camera(x+width/2.0, y+height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), //eye position
    x+width/2.0, y+height/2.0, 0, //target vector(directions)
    0, 1, 0); // up vector

  for (int z=gridCount-1; z>=zIndex; z--) { //loop to draw grid
    Grid grid = grids.get(z); //get current grid from grids arraylist
    float depth = 0;
    if(gridCount > 1){
       depth = map(z, 0, gridCount-1, 0, 1); //compute a depth value based on grid count
    }
    grid.depth = depth; //store it into the grid object

    push();
    if(gridCount > 1){
      float gz = map(z, 0, gridCount-1, zNear, zFar); //compute a translation in z where first grid would be the closest and last grid the farthest
      translate(0, 0, gz); //translates position in array to depth levels
    }
    grid.draw(); //finally draw the grid
    pop();
  }
  pop();
  if (drawUI) {
    cp5.draw();
  }
}

void saveAllFrames(){
  String prefix = "export/grid_";
  String extension = ".png";
  for (int i = 0; i < grids.size();i++) {
    String path = prefix + i + extension;
    Grid grid = grids.get(i);
    grid.save(path);
    println("file saved to "+path);
  } 
}

void keyPressed() {
  if (key == 'g') {
    drawUI = !drawUI;
  }else if (key == 's') {
    saveAllFrames();
  }
}

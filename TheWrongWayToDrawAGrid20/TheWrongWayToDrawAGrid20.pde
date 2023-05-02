ArrayList<Grid> grids;
int gridCount = 50;

void setup() {
  size(900, 600, P3D);
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
  background(255);
  float x = map(mouseX, 0, width, -400, 400);
  float y = map(mouseY, 0, height, -200, 200);
  x=0;
  y=0;
  camera(x+width/2.0, y+height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), //eye position
    x+width/2.0, y+height/2.0, 0, //target vector(directions)
    0, 1, 0); // up vector

  float anim = sin(millis()*0.001);
  int zIndex = round(map(anim, -1, 1, 0, gridCount)); //compute an animated zIndex so the grids are drawn one after the other
  for (int z=gridCount-1; z>=zIndex; z--) { //loop to draw grid
    Grid grid = grids.get(z); //get current grid from grids arraylist
    float depth = map(z, 0, gridCount-1, 0, 1); //compute a depth value based on grid count
    grid.depth = depth; //store it into the grid object

    push();
    float gz = map(z, 0, gridCount-1, 0, -10000); //compute a translation in z where first grid would be the closest and last grid the farthest
    translate(0, 0, gz); //translates position in array to depth levels
    float angle = map(depth, 0, 1, 0, TWO_PI); //compute an angla based on depth, the farthest the more it turns a.k.a vortex
    
    //rotate around center
    translate(width/2, height/2, 0);
    rotate(angle);
    translate(-width/2, -height/2, 0);

    grid.draw(); //finally draw the grid
    pop();
  }
}

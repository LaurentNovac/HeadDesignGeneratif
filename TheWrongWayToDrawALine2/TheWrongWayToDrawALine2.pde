void setup(){
  size(1280, 720);
}

void myLine(int x, int y, int w, int h){
  line(x,y,w,h);
}

void draw(){
  background(255);
  myLine(0,0,width,height);
}

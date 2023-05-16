class MyGrid extends Grid{
  void cell(int w, int h, float u, float v) {
    //fill(u*255,v*255,0);
    fill(255,0,0);
    stroke(0);
    rect(0, 0, w, h);
  }
}

int nx;
int ny;
int gap;

void setup() {
  size(640, 480);
  nx = 10;
  ny = nx;
  gap = 30;
  mouseX = width/2;
  mouseY = height/2;
}

void draw() {
  clear();
  background(0, 0, 0);
  pushStyle();
  stroke(120, 140, 200);
  pushMatrix();
  translate(width/2-(nx*gap/2), height/2-(ny*gap/2));
  for(int x = 0; x < nx; x++) {
    for(int y = 0; y < ny; y++) {
      line(x*gap+random(0, 10), y*gap+random(0, 10),
        mouseX-width/2+(nx*gap/2), mouseY-height/2+(ny*gap/2));
    }
  }
  popMatrix();
  popStyle();
}

void mouseWheel(MouseEvent e) {
  nx -= int(e.getCount());
  ny = nx;
}
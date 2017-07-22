void setup() {
  //fullScreen();
  //size(640, 480);
  size(1024, 768);
  fill(0, 0, 0);
  background(255, 255, 255);
}

void draw() {
  int dx = 2;
  int dy = dx;
  for (int x = 0; x < width; x++) {
    line(x*dx, 0, x*dx, height);
  }

  for (int y = 0; y < height; y++) {
    line(0, y*dx, width, y*dx);
  }

  // Save as image
  //
  //println(frameCount);
  //if (frameCount == 1) {
  //  println("Save");
  //  saveFrame("image.png");
  //}
}

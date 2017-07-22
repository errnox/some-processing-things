void setup() {
  size(640, 480, P3D);
  background(0, 0, 0);
} 

void draw() {
  clear();
  fill(50, 180, 70);
  noStroke();
  int w = 80;
  int h = 50;

  pushMatrix();

  translate(mouseX, mouseY, mouseX/4+mouseY/4);
  rect(-w/2, -h/2, w, h);

  stroke(255);
  noFill();
  box(40);

  stroke(180, 200, 80);
  pushMatrix();
  // translate(80, -20, 20);
  translate(80, -20, 20);
  if (keyPressed == true && key == CODED) {
    if (keyCode == ALT) {
      stroke(80, 180, 200);
      sphereDetail(8);
      strokeWeight(2);
      line(0, 0, 0, -80, 20, -20);
    }
  } else {
    sphereDetail(4);
  }
  sphere(20);
  strokeWeight(1);
  popMatrix();

  popMatrix();
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}

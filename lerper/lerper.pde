int boxw = 15;
int boxh = boxw;
int gap = 5;
int nboxes = 0;

color from = color(200, 205, 254);
color to = color(145, 255, 161);

void setup() {
  size(640, 480);
  background(0, 0, 0);
  adjustNumBoxes();
}

void draw() {
  clear();
  noStroke();
  pushMatrix();
  translate(width/2-(nboxes*(boxw+gap)/2), 0);
  for(int i = 0; i < nboxes; i++) {
    fill(lerpColor(from, to, float(i)*0.1));
    rect(i*(boxw+gap), (height/2-boxh/2)+sin(i)*boxw/2*mouseY/100, boxw,
      boxh);
  }
  popMatrix();

  fill(255, 255, 255);
  text("Scroll the mouse wheel to change the box size (" + boxw + "px).",
    25, height-35);
  text("Click anywhere to reset the size.", 25, height-20);
}

void mouseWheel(MouseEvent e) {
  int neww = boxw - e.getCount();
  if (neww > 0 && neww <= 100) {
    boxw -= e.getCount();
    boxh = boxw;
    adjustNumBoxes();
  }
}

void mousePressed() {
  boxw = 15;
  boxh = boxw;
  adjustNumBoxes();
}

void adjustNumBoxes() {
  nboxes = width/(boxw+gap)-4;
}

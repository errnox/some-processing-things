int cpx1;
int cpy1;
int cpx2;
int cpy2;
int x1;
int y1;
int x2;
int y2;
int cpr;
int sen;
boolean showSen;
boolean showCurve;
boolean showBezier;


void setup() {
  size(640, 480);
  init();
}

void draw() {
  clear();
  background(0, 0);
  noFill();
  stroke(255, 255, 255);
  strokeWeight(3);
  noFill();
  if(showCurve) {
    curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2);
  }

  if(showBezier) {
    bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);
  }

  // Control points
  noStroke();
  fill(255, 0, 0);
  ellipse(cpx1, cpy1, cpr, cpr);
  ellipse(cpx2, cpy2, cpr, cpr);
  // Points
  fill(0, 0, 255);
  ellipse(x1, y1, cpr, cpr);
  ellipse(x2, y2, cpr, cpr);
  if (showSen) {
    // Control points sensitivity
    fill(255, 0, 0, 120);
    ellipse(cpx1, cpy1, cpr+sen, cpr+sen);
    ellipse(cpx2, cpy2, cpr+sen, cpr+sen);
    // Points sensitivity
    fill(0, 0, 255, 120);
    ellipse(x1, y1, cpr+sen, cpr+sen);
    ellipse(x2, y2, cpr+sen, cpr+sen);
    // Control point lines
    strokeWeight(1);
    stroke(255, 0, 0, 120);
    line(cpx1, cpy1, x1, y1);
    line(cpx1, cpy1, x2, y2);
    line(cpx2, cpy2, x1, y1);
    line(cpx2, cpy2, x2, y2);
  }
  
  // Legend
  fill(255, 255, 255);
  text(
    "Space: toggle handles  |  c: toggle curve  |  b: toggle bezier",
    10, height-25);
  text(
    "q/w: decrease/increase handle areas  |  r: reset",
    10, height-10);
}

void mouseDragged() {
  if(mouseButton == LEFT) {
    if(abs(dist(cpx1, cpy1, mouseX, mouseY)) <= sen) {
      cpx1 = mouseX;
      cpy1 = mouseY;
    }
    if(abs(dist(cpx2, cpy2, mouseX, mouseY)) <= sen) {
      cpx2 = mouseX;
      cpy2 = mouseY;
    }
    if(abs(dist(x1, y1, mouseX, mouseY)) <= sen) {
      x1 = mouseX;
      y1 = mouseY;
    }
    if(abs(dist(x2, y2, mouseX, mouseY)) <= sen) {
      x2 = mouseX;
      y2 = mouseY;
    }
  }
}

void keyPressed() {
  if(key == ' ') {
    showSen = !showSen;
  }
  if(key == 'w') {
    sen += 10;  
  }
  if(key == 'q') {
    sen -= 10;  
  }
  if(key == 'r') {
    init();  
  }
  if(key == 'c') {
    showCurve = !showCurve;
    if(showBezier == false) {
      showCurve = true;
    }
  }
  if(key == 'b') {
    showBezier = !showBezier;
    if (showCurve == false) {
      showBezier = true;
    }
  }
}

void init() {
  cpx1 = 40;
  cpy1 = 40;
  cpx2 = 120;
  cpy2 = 150;
  x1 = 60;
  y1 = 100;
  x2 = 150;
  y2 = 100;
  cpr = 10;
  sen = 30;
  showSen = false;
  showCurve = true;
  showBezier = false;
}
int rc;
float rd;
int bc;
float bd;
int gc;
float gd;
int r;
String s;
String s2;
boolean isTextShown;

void setup() {
  size(640, 480);
  background(0, 0, 0);
  isTextShown = false;
  r = 40;
}

void draw() {
  rd = dist(0, 0, mouseX, mouseY);
  rc = int(map(rd, 0, width, 0, 255));
  bd = dist(0, height, mouseX, mouseY);
  bc = int(map(bd, 0, height, 0, 255));
  gd = dist(width, height, mouseX, mouseY);
  gc = int(map(gd, 0, height, 0, 255));
  background(rc, gc, bc);
  stroke(rc, gc, bc);

  if(isTextShown) {
    fill(20, 20, 20);
    s = rc + ", " + gc + ", " + bc;
    text(s, width/2-textWidth(s)/2, height/2);
    
    s2 = bc + ", " + rc + ", " + gc;
    text(s2, mouseX-textWidth(s2)/2, mouseY-r/2-10);
  }
  
  noStroke();
  fill(bc, rc, gc);
  ellipse(mouseX, mouseY, r, r);
}

void keyPressed() {
  if (key == ' ') {
    isTextShown = !isTextShown;
  }
}
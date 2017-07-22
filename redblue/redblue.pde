int rc;
float rd;
int bc;
float bd;

void setup() {
  size(640, 480);
  background(0, 0, 0);
}

void draw() {
  rd = dist(0, 0, mouseX, 0);
  rc = int(map(rd, 0, width, 0, 255));
  bd = dist(0, 0, mouseY, 0);
  bc = int(map(bd, 0, height, 0, 255));
  background(rc, 0, bc);
  
  text("red", width-40, 30);
  text("blue", 20, height-20);
  
  stroke(255, 255, 255, 80);
  strokeWeight(2);
  line(50, 50, width-50, height-50);
}
void setup() {
  size(640, 480, P3D);
  fullScreen();
  background(0, 0, 0);
} 

void draw() {
  clear();
  fill(50, 180, 70);
  noStroke();
  int w = 120;
  int h = 60;
  translate(mouseX-w/2, mouseY-h/2, mouseX/5+mouseY/5);
  //rect(width/2-w/2, height/2-h/2, w, h);
  rect(0, 0, w, h);
}
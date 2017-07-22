float moused;

void setup() {
  size(640, 480);
}

void draw() {
  clear();
  background(0, 0, 0);
  strokeWeight(1);
  stroke(255, 255, 255);
  fill(255, 255, 255, 80);
  moused = dist(width/2, height/2, mouseX, mouseY);
  if(moused < width/4) {
    if (moused < width/8) {
      stroke(180, 40, 50);
      strokeWeight(8);
    }
    line(width/2, height/2, mouseX, mouseY);
  }
  noStroke();
  fill(255, 255, 255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(255, 255, 255, 120);
  ellipse(mouseX, mouseY,
    map(moused, 0, dist(0, 0, width/2, height/2), 0, width/4),
    map(moused, 0, dist(0, 0, width/2, height/2), 0, width/4));
}
int arrowWidth = 15;

void setup() {
  size(640, 480);
  background(0, 0, 0);
  surface.setResizable(true);
}

void draw() {
  clear();
  strokeWeight(2);
  stroke(80, 180, 40);
  fill(80, 180, 40);
  //rect(width/2-10, height/2-10, 20, 20);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  fill(255, 255, 255);
  text(width, 10, height/2-20);
  text(height, width/2-30, 25);
  
  // Top arrow head
  pushMatrix();
  translate(width/2-arrowWidth/2, 0);
  drawArrowHead();
  popMatrix();
  
  // Right arrow head
  pushMatrix();
  translate(width, height/2-arrowWidth/2);
  rotate(radians(90));
  drawArrowHead();
  popMatrix();
  
  // Bottom arrow head
  pushMatrix();
  translate(width/2+arrowWidth/2, height);
  rotate(radians(180));
  drawArrowHead();
  popMatrix();
  
  // Left arrow head
  pushMatrix();
  translate(0, height/2+arrowWidth/2);
  rotate(radians(-90));
  drawArrowHead();
  popMatrix();
}

void keyPressed() {
  if (key == 'q') {
    exit();
  } 
}

void drawArrowHead() {
  line(0, arrowWidth/2, arrowWidth/2, 0);
  line(arrowWidth/2, 0, arrowWidth, arrowWidth/2);
}
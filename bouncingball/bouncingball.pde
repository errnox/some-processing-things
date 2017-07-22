float x = 0;
float y = 0;
float speed = 1;
float gravity = 0.3;
int ballr = 32;


void setup() {
  size(640, 480);
  x = width/2;
  y = height/2-height/4;
}

void draw() {
  background(0, 0, 0);
  fill(180, 170, 160);
  noStroke();
  
  y += speed;
  speed += gravity;
  
  if (y > height-ballr/2) {
    y = height-ballr/2;
    speed *= -0.8;
  }
  
  ellipse(x, y, ballr, ballr);
}
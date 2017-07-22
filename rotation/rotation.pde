int r;
int x;
int y;
int angle;
int speed;

void setup() {
  size(640, 480);
  r = 80;
  speed = 2;
}

void draw() {
  clear();
  background(0, 0, 0);

  if(angle <= 180) {
    angle++;
  } else {
    angle = 0;
  }
  
  pushMatrix();
  translate(width/2, height/2);
  x = int(cos(radians(angle*speed))*r);
  y = int(sin(radians(angle*speed))*r);

  fill(255, 255, 255);
  ellipse(0, 0, 5, 5);
  stroke(255, 255, 255);
  strokeWeight(2);
  line(0, 0, x, y);

  noStroke();
  fill(40, 180, 50);
  ellipse(x, y, r/5*angle/100+10, r/5*angle/100+10);
  popMatrix();
}
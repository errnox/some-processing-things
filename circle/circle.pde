void setup() {
  size(640, 480);
}

void draw() {
  clear();
  background(0.0, 0.0, 0.0);
  drawCircle(120, 160, 40, 40, 100);
}

void drawCircle(float cx, float cy, float rx, float ry, int num_segments) 
{ 
  float theta = 2 * 3.1415926 / float(num_segments); 
  float c = cos(theta);//precalculate the sine and cosine
  float s = sin(theta);
  float t;

  float x = 1;//we start at angle = 0 
  float y = 0; 

  pushMatrix();
  beginShape();
  for (int ii = 0; ii < num_segments; ii++) 
  { 
    //apply radius and offset
    //glVertex2f(x * rx + cx, y * ry + cy);//output vertex
    vertex(x * rx + cx, y * ry + cy);

    //apply the rotation matrix
    t = x;
    x = c * x - s * y;
    y = s * t + c * y;
  } 
  endShape();
  popMatrix();
}
int nx;
int ny;
int gap;
int r;
int initr;
float noiseScale;
int offx;
int offy;

void setup() {
  size(640, 480);
  seedNoise();
  nx = 20;
  ny = nx;
  gap = 10;
  initr = 10;
  r = initr;
  noiseScale = 0.02;
  offx = width/2-(nx*(initr+gap)/2);
  offy = height/2-(ny*(initr+gap)/2);
  
  mouseX = width/2;
  mouseY = height/2;
}

void draw() {
  clear();
  background(0, 0, 0);
  fill(80, 80, 80);
  noStroke();
  pushMatrix();
  translate(offx, offy);
  for(int x = 0; x < nx; x++) {
    for(int y = 0; y < ny; y++) {
      r = int(noise(x*noiseScale, y*noiseScale)*20);
      noStroke();

      if(dist(mouseX, mouseY, x*(initr+gap)+offx,
        y*(initr+gap)+offy) <= r*r) {
        fill(255, 255, 255);
      } else {
        fill(80, 80, 80);
      }
      ellipse(x*(initr+gap), y*(initr+gap), r, r);
    }
  }
  for(int x = 0; x < nx; x++) {
    for(int y = 0; y < ny; y++) {
      r = int(noise(x*noiseScale, y*noiseScale)*20);
      stroke(255, 255, 255, 150);
      strokeWeight(2);
      if(dist(mouseX, mouseY, x*(initr+gap)+offx,
        y*(initr+gap)+offy) <= r*r) {
        line(x*(initr+gap), y*(initr+gap), mouseX-offx, mouseY-offy);
      }
    }
  }
  popMatrix();
  
  fill(255, 255, 255);
  text(noiseScale, 5, 20);
}

private void seedNoise() {
  noiseSeed(int(random(0, 100)));
}

void keyPressed() {
  if(key == 'r') {
    seedNoise();
  }
}

void mouseWheel(MouseEvent e) {
  float x = noiseScale-e.getCount()*0.01;
  if(x > 0.0 && x < 2.0) {
    noiseScale = x;
  }
  //if(keyPressed == true && keyCode == CONTROL) {
  //  gap -= e.getCount();
  //  offx = width/2-(nx*(initr+gap)/2);
  //  offy = height/2-(ny*(initr+gap)/2);
  //}
}
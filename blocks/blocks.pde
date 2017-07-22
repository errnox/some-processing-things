int gap = 10;
int boxw = 15;
int boxh = boxw;
int boxd = boxw;
int xn = 10;
int yn = xn;
int zn = xn;
int tx = 0;
int ty = tx;
int tz = tx;
  
int zoom = 0;
int camz = 0;

void setup() {
  size(640, 480, P3D);
  background(0, 0, 0);
}

void draw() {
  clear();

  beginCamera(); 
  camera((mouseX-width/2)*10, (mouseY-height/2)*10, 800+zoom*100+camz*100,
    0, 0, 0,
    0.0, 1.0, 0.0);
  translate(-width/2, -height/2, 0);
  endCamera();

  pushMatrix();
  translate(width/2, height/2, 0);

  noFill();
  stroke(255, 255, 255);
  for (int x = 0; x < xn; x++) {
    for (int y = 0; y < yn; y++) {
      for (int z = 0; z < zn; z++) {
        pushMatrix();
        tx = x*(boxw+gap);
        ty = y*(boxh+gap);
        tz = z*(boxd+gap);
        translate(-xn*gap-boxw, -yn*gap-boxh, z-300);
        translate(tx, ty, tz);
        box(boxw);
        popMatrix();
      }
    }
  }

  stroke(255, 0, 0);
  sphereDetail(8);
  sphere(10);

  popMatrix();
}

void keyPressed() {
  switch (key) {
    case '+':
      if (xn < 20 && yn < 20 && zn < 20) {
        xn++;
        yn++;
        zn++;
      }
      break;
    case '-':
      if (xn > 1 && yn > 1 && zn > 1) {
        xn--;
        yn--;
        zn--;
      }
      break;
  }
  
  if (keyCode == UP) {
    camz -= 1;
  }

  if (keyCode == DOWN) {
    camz += 1;
  }
}

void mouseWheel(MouseEvent e) {
  zoom += e.getCount();
}
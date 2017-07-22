int xn;
int yn;
int r;
int initr;
int gap;
int xpos;
int ypos;
int sen;
boolean showSen;
boolean dragging;
int offx;
int offy;
int dragx;
int dragy;

void setup() {
  size(640, 480);
  xn = 10;
  yn = xn;
  initr = 10;
  r = initr;
  gap = 15;
  xpos = 0;
  ypos = 0;
  sen = 50;
  showSen = false;
  dragging = false;
  offx = 0;
  offy = 0;
  dragx = 0;
  dragy = 0;
}

void draw() {
  clear();
  background(0, 0, 0);
  fill(255, 255, 255);
  noStroke();

  pushMatrix();
  fill(255, 0, 0);
  rect(40, 40, 20 , 20);
  if(dragging == true) {
    if (mouseX <= dragx) {
      offx = -1*(dragx-mouseX);
    } else if (mouseX >= dragx) {
      offx = mouseX-dragx;
    }

    if (mouseY <= dragy) {
      offy = -1*(dragy-mouseY);
    } else if (mouseY >= dragy) {
      offy = mouseY-dragy;
    }
  }
  fill(255, 255, 80);
  rect(150+offx, 150+offy, 40 , 40);

  // DEBUG
  if(showSen) {
    pushStyle();
    stroke(180, 80, 80);
    line(offx, 0, offx, height);
    line(0, offy, width, offy);
    stroke(80, 80, 180);
    line(dragx+offx, 0, dragx+offx, height);
    line(0, dragy+offy, width, dragy+offy);
    popStyle();
  }

  //translate(offx, offy);

  fill(90, 255, 80);
  rect(20, 20, 40 , 40);

  for (int x = 0; x < xn; x++) {
    for (int y = 0; y < yn; y++) {
      xpos = width/2-xn*(r+gap)/2+x*(r+gap);
      ypos = height/2-yn*(r+gap)/2+y*(r+gap);
      if(abs(int(dist(mouseX, mouseY, xpos, ypos))) < sen) {
        r = initr+initr/2-abs(int(dist(mouseX, mouseY, xpos, ypos)))/10;
        if(r < initr) r = initr;
        fill(255, 255, 255, 100);
        ellipse(xpos, ypos, r+gap-gap/3, r+gap-gap/3);
        fill(255, 255, 255);
        ellipse(xpos, ypos, r, r);
      } else {
        fill(255, 255, 255);
        ellipse(xpos, ypos, r, r);
      }
      r = initr;
    }
  }
  
  popMatrix();
  
  if(showSen == true) {
    fill(0, 0, 0);
    rect(5, 5, 40, 20);
    fill(255, 255, 255);
    text(sen, 10, 20);
  }
}

void mouseWheel(MouseEvent e) {
  if(keyPressed == true && keyCode == CONTROL) {
    if(xn >= 1 && yn >= 1 && xn < 50 && yn < 50) {
      xn -= int(e.getCount());
      yn -= int(e.getCount());
    }
  } else if(sen >= 0 && sen < 5000) {
    sen -= int(e.getCount())*4;
  }

  if(sen < 0) sen = 1;
  if(xn <= 0) xn = 1;
  if(yn <= 0) yn = 1;
}

void mouseDragged() {
  if(mouseButton == CENTER) {
    dragging = true;
  }
}

void mousePressed() {
  if(mouseButton == CENTER) {
    dragx = mouseX-offx;
    dragy = mouseY-offy;
  }
}

void mouseReleased() {
  if(mouseButton == CENTER) {
    dragging = false;
  }
}

void keyPressed() {
  if(key == ' ') {
    showSen = !showSen;
  }
}
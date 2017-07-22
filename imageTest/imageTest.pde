PImage img;

void setup() {
  img = loadImage("tree.png");
  size(640, 480);
  background(255, 255, 255);
}

void draw() {
	if (frameCount%10 == 0) {
  	clear();
    background(255, 255, 255);
  }
  for (int x = 0; x < 10; x++) {
    for (int y = 0; y < 10; y++) {
      image(img, mouseX+x*16-10*16/2 + int(random(0, 16)),
			mouseY+y*16-10*16/2 + int(random(0, 16)), 10, 10);
    }
  }
}

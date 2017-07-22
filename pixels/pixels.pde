int pixelsPos;
int count;

void setup() {
  size(200, 200);
  background(0, 0, 0);
  count = 0;

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    if (int(random(0, 2)) == 1) {
      pixels[i] = color(255, 255, 255);
    } else {
      pixels[i] = color(0, 0, 0);
    }
  }
  updatePixels();
}

void draw() {
  //if (frameCount % 20 == 0) {
  //clear();
  //background(0, 0, 0);

  //if (frameCount % 15 == 0) {
  //loadPixels();
  ////pixels[pixelsPos] = color(255, 255, 255);
  ////try {
  ////  pixels[pixelsPos-width-1] = color(255, 255, 255);
  ////  pixels[pixelsPos+1] = color(255, 255, 255);
  ////  pixels[pixelsPos-1] = color(255, 255, 255);
  ////  pixels[pixelsPos+width-1] = color(255, 255, 255);
  ////} catch (Exception e) {
  ////  // Ignore
  ////}
  //for (int i = 0; i < 13000; i++) {
  //  //pixels[int(random(0, pixels.length))] = color(255, 255, 255);
  //  //pixels[int(random(0, pixels.length))] = color(0, 0, 0);
  //}
  //updatePixels();
  //}

  loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      count = 0;
      try {
        if (pixels[x+y*width-width-1] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width-width] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width-width+1] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width+1] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width+width+1] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width+width] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width+width-1] == color(255, 255, 255)) {
          count++;
        }
        if (pixels[x+y*width-1] == color(255, 255, 255)) {
          count++;
        }

        // Update the pixel color
        if (pixels[x+y*width] == color(255, 255, 255) && count == 3) {
          pixels[x+y*width] = color(255, 255, 255);
        } else if (pixels[x+y*width] == color(255, 255, 255) && count == 2) {
          pixels[x+y*width] = color(255, 255, 255);
        } else {
          pixels[x+y*width] = color(0, 0, 0);
        }
      } catch (Exception e) {
        // Ignore
      }
    }
  }
  updatePixels();

  fill(0, 0, 0);
  rect(10, 10, 50, 25);
  fill(0, 255, 0);
  text(millis(), 20, 20);
  //} // frameCount
}

void mouseMoved() {
  pixelsPos = width*mouseY+mouseX;
}
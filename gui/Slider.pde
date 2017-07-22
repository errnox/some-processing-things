class Slider {
  PApplet p;
  int x;
  int y;
  int w;
  int h;
  int value;

  Slider(PApplet p, int x, int y, int value) {
    this.p = p;
    this.x = x;
    this.y = y;
    this.w = 80;
    this.h = 30;
    this.value = value;
  }

  void update() {
    if (mousePressed && mouseButton == LEFT &&
      mouseX >= this.x && mouseX <= this.x+this.w &&
      mouseY >= this.y && mouseY <= this.y+this.h) {
      this.value = int(map(mouseX, this.x, this.x+this.w, 0, 100));
    }
  }

  void render() {
    p.pushMatrix();
    p.noStroke();
    p.fill(39, 170, 117);
    p.rect(this.x, this.y, this.w, this.h);
    p.fill(54, 255, 173);
    p.rect(this.x, this.y, map(value, 0, 100, 0, this.w), 
      this.h);
    p.fill(0, 0, 0);
    p.text(this.value, this.x+5, this.y+20);
    p.popMatrix();
  }

  int getValue() {
    return this.value;
  }

  void setValue(int value) {
    this.value = value;
  }
}
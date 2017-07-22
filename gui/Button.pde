class Button {
  PApplet p;
  int x;
  int y;
  int w;
  int h;
  int padding;
  boolean value;
  String text;
  boolean hovered;

  Button(PApplet p, boolean value, String text, int x, int y) {
    this.p = p;
    this.value = value;
    this.text = text;
    this.x = x;
    this.y = y;
    this.hovered = false;
    this.padding = 5;
    this.w = int(p.textWidth(this.text))+this.padding*3;
    this.h = 30;
  }
  
  void update() {
    if (mouseX >= this.x && mouseX <= this.x+this.w &&
      mouseY >= this.y && mouseY <= this.y+this.h) {
      this.hovered = true;
      if (mousePressed == true && mouseButton == LEFT) {
        this.hovered = false;
        this.value = !this.value;
      }
    } else {
      this.hovered = false;
    }
  }
  
  void render() {
    p.pushMatrix();
    if (this.hovered == true) {
      p.fill(39, 170, 117);
    } else {
      p.fill(54, 255, 173);
    }
    p.rect(this.x, this.y, this.w, this.h);
    p.fill(0, 0, 0);
    p.text(this.text, this.x + this.padding, this.y+this.padding*4);
    p.popMatrix();
  }
  
  boolean getValue() {
    return this.value;
  }
  
  void setValue(boolean value) {
    this.value = value;
  }
}
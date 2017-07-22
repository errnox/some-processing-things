class Block {
  PApplet p;
  String name;
  int x;
  int y;
  int z;
  int w;
  int h;
  int d;
  int strokeColor;

  Block(PApplet p, String name) {
    this.p = p;
    this.name = name;
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.w = 20;
    this.h = this.w;
    this.d = this.w;
    this.strokeColor = color(255, 255, 255);
  }

  public void render() {
    p.pushMatrix();
    p.pushStyle();

    p.noFill();
    p.stroke(this.strokeColor);
    p.translate(this.x, this.y, this.z);
    p.box(float(this.w));

    p.popStyle();
    p.popMatrix();
  }
}

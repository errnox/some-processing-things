class Player {
  PApplet p;
  int x;
  int y;
  int w;
  int h;
  int speed;

  public Player(PApplet p) {
    this.p = p;
    this.w = 20;
    this.h = w;
    this.x = w*4;
    this.y = h*4;
    this.speed = 1;
  }

  public void draw() {
    p.pushMatrix();
    p.pushStyle();
    p.noStroke();
    p.fill(40, 110, 60);
    p.rect(x, y, w, h);
    p.popStyle();
    p.popMatrix();
  }
  
  public void handleKeys() {
    if(keyCode == LEFT) {
      this.x -= this.w*this.speed;
    }
    if(keyCode == RIGHT) {
      this.x += this.w*this.speed;
    }
    if(keyCode == UP) {
      this.y -= this.h*this.speed;
    }
    if(keyCode == DOWN) {
      this.y += this.h*this.speed;
    }
  }
}
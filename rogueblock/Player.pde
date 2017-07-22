class Player {
  PApplet p;
  int x;
  int y;
  int z;
  int w;
  int h;
  int d;
  HashMap<Integer, Boolean> keys;

  Player(PApplet p, HashMap<Integer, Boolean> keys) {
    this.p = p;
    this.x = 0;
    this.y = this.x;
    this.z = this.x;
    this.w = 20;
    this.h = this.w;
    this.d = this.w;
    this.keys = keys;
  }

  public void keyPressed() {
    if(this.keys.get(p.CONTROL) == true) {
      if(this.keys.get(p.UP) == true) {
        this.moveMY();
      }
      if(this.keys.get(p.DOWN) == true) {
        this.movePY();
      }
    } else {
      if(this.keys.get(p.UP) == true) {
        this.moveMZ();
      }
      if(this.keys.get(p.DOWN) == true) {
        this.movePZ();
      }
    }
    if(this.keys.get(p.LEFT) == true) {
      this.moveMX();
    }
    if(this.keys.get(p.RIGHT) == true) {
      this.movePX();
    }
  }

  public void render() {
    p.pushStyle();
    p.pushMatrix();

    p.translate(this.x, this.y, this.z);    
    p.fill(180, 40, 60, 100);
    p.stroke(180, 40, 60, 150);
    p.box(this.w);

    p.popMatrix();
    p.popStyle();
  }

  public void movePX() {
    this.x += this.w;
  }

  public void moveMX() {
    this.x -= this.w;
  }

  public void movePY() {
    this.y += this.h;
  }

  public void moveMY() {
    this.y -= this.h;
  }

  public void movePZ() {
    this.z += this.d;
  }

  public void moveMZ() {
    this.z -= this.d;
  }
}
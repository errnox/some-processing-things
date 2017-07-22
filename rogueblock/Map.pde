class Map {
  PApplet p;
  int w;
  int h;
  int d;
  ArrayList<Block> blocks;
  int blockw;
  int blockh;
  int blockd;

  Map(PApplet p) {
    this.p = p;
    this.w = 3;
    this.h = this.w;
    this.d = this.h;
    this.blockw = 20;
    this.blockh = this.blockw;
    this.blockd = this.blockh;
    this.blocks = new ArrayList<Block>();
    EmptyBlock block;
    for(int x = 0; x < this.w; x++) {
      for(int y = 0; y < this.h; y++) {
        for(int z = 0; z < this.d; z++) {
          block = new EmptyBlock(this.p);
          block.x = x*blockw;
          block.y = y*blockh;
          block.z = z*blockd;
          this.blocks.add(block);
        }
      }
    }
  }

  public void render() {
    p.pushMatrix();
    p.pushStyle();
    for(int i = 0; i < this.w*this.h*this.d; i++) {
      this.blocks.get(i).render();
    }

    p.noFill();
    p.stroke(0, 255, 0, 80);
    p.strokeWeight(5);
    p.translate(this.w*this.blockw/2-this.blockw/2,
      this.h*this.blockh/2-this.blockh/2,
      this.d*this.blockd/2-this.blockd/2);
    p.box(this.w*this.blockw);
    p.popStyle();
    p.popMatrix();
  }
}
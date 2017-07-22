PApplet p;
HashMap<Integer, Boolean> keys;
Map map;
Player player;
Camera camera;

void setup() {
  size(640, 480, P3D);

  p = this;
  keys = new HashMap<Integer, Boolean>();
  for(int i = 0; i < 300; i++) {
    keys.put(i, false);
  }

  map = new Map(this);
  player = new Player(this, keys);
  camera = new Camera(this, keys, player);
}

void draw() {
  p.clear();
  p.background(0, 0, 0);

  pushMatrix();
  pushStyle();
  noStroke();
  // x
  fill(255, 0, 0);
  text("X", 10.0, 10.0);
  // y
  fill(0, 255, 0);
  text("Y", 10.0, 30.0);
  // z
  fill(0, 0, 255);
  text("Z", 10.0, 50.0);
  popStyle();
  popMatrix();

  camera.update();
  p.rect(40, 40, 60, 60);

  // Landmarks - red rectangle
  p.pushStyle();
  p.pushMatrix();
  p.noStroke();
  p.fill(255, 0, 0, 100);
  p.rotateX(radians(90));
  p.translate(-500.0, -500.0, 0.0);
  p.rect(0, 0, 1000.0, 1000.0);
  p.popMatrix();
  p.popStyle();

  // Landmarks - yellow rectangle
  p.pushStyle();
  p.pushMatrix();
  p.noStroke();
  p.fill(255, 255, 0, 100);
  p.translate(-500.0, -150.0, 0.0);
  p.rect(0, 0, 300.0, 150.0);
  p.popMatrix();
  p.popStyle();

  // Landmarks - blue sphere
  p.pushStyle();
  p.pushMatrix();
  p.noFill();
  p.stroke(50, 70, 180, 100);
  p.sphereDetail(12);
  p.sphere(1500.0);
  p.popMatrix();
  p.popStyle();

  pushMatrix();
  pushStyle();
  noFill();
  strokeWeight(1);
  // x
  stroke(255, 0, 0);
  line(-1000, 0, 0, 1000, 0, 0);
  // y
  stroke(0, 255, 0);
  line(0, -1000, 0, 0, 1000, 0);
  // z
  stroke(0, 0, 255);
  line(0, 0, -1000,  0, 0, 1000);
  popStyle();
  popMatrix();

  p.pushStyle();
  p.pushMatrix();
  p.noFill();
  p.stroke(255, 0, 0);
  p.sphereDetail(4);
  p.translate(0, 0, 20);
  p.sphere(3);
  p.popMatrix();
  p.popStyle();

  map.render();
  player.render();
}

void keyPressed() {
  this.keys.put(keyCode, true);
  player.keyPressed();
}

void keyReleased() {
  this.keys.put(keyCode, false);
}

void mouseDragged() {
  camera.mouseDragged();
}
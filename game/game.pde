Player player;

void setup() {
  size(640, 480);
  player = new Player(this);
}

void draw() {
  clear();
  background(0, 0, 0);
  player.draw();
}

void keyPressed() {
  player.handleKeys();
}
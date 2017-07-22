class Camera {
  PApplet p;
  HashMap<Integer, Boolean> keys;
  float yaw;
  float pitch;
  PVector pos;
  float s;
  float mouseSensitivity;

  Camera(PApplet p, HashMap<Integer, Boolean> keys, Player player) {
    this.p = p;
    this.keys = keys;
    this.init();
  }

  void init() {
    this.yaw = 0.0;
    this.pitch = 0.0;
    this.pos = new PVector(0.0, 100.0, -350.0);
    this.s = 10.0;
    this.mouseSensitivity = 0.02;
  }

  public void update() {
    if(p.keyPressed == true) {
      if(p.key == 'w') {
        pos.x -= s * sin(yaw);
        // pos.y += s * tan(pitch);
        pos.z += s * cos(yaw);
      }
      if(p.key == 's') {
        pos.x += s * sin(yaw);
        // pos.y -= s * tan(pitch);
        pos.z -= s * cos(yaw);
      }
      if(p.key == 'a') {
        pos.x -= s * sin(yaw-radians(90));
        pos.z += s * cos(yaw-radians(90));
      }
      if(p.key == 'd') {
        pos.x -= s * sin(yaw+radians(90));
        pos.z += s * cos(yaw+radians(90));
      }
      if(p.key == 'q') {
        yaw -= mouseSensitivity;
      }
      if(p.key == 'e') {
        yaw += mouseSensitivity;
      }
      if(p.key == 'r') {
        pitch += mouseSensitivity;
      }
      if(p.key == 'f') {
        pitch -= mouseSensitivity;
      }
      if(p.key == '0') {
        init();
      }
      if(p.key == ' ') {
        pos.y += s;
      }
      if(p.keyCode == p.TAB) {
        pos.y -= s;
      }
    }

    p.translate(p.width/2.0, p.height/2.0, (p.width+p.height)/2.0);
    p.rotateX(pitch);
    p.rotateY(yaw);
    p.translate(pos.x, pos.y, pos.z);
  }

  void mouseDragged() {
    p.pushMatrix();
    translate(-p.width/2.0, -p.height/2.0, 0.0);

    if(p.mouseButton == p.LEFT) {
      if(p.pmouseX < p.mouseX) {
        yaw += mouseSensitivity;
      } else if(p.pmouseX > p.mouseX) {
        yaw -= mouseSensitivity;
      }
  
      if(p.pmouseY < p.mouseY) {
        pitch -= mouseSensitivity;
      } else if(p.pmouseY > p.mouseY) {
        pitch += mouseSensitivity;
      }
    }

    p.popMatrix();
  }
}

Slider slider;
Button button;
int r;
int initialr;
boolean reset;

void setup() {
  size(640, 480);
  initialr = 30;
  r = initialr;
  slider = new Slider(this, 10, 20, r);
  button = new Button(this, reset, "Reset", 10, 70);
}

void draw() {
  clear();
  background(0, 0, 0);
  slider.update();
  slider.render();
  
  button.update();
  button.render();

  r = slider.getValue();
  if (button.getValue() == true) {
    button.setValue(false);
    r = 30;
    slider.setValue(initialr);
  }
  noStroke();
  fill(255, 188, 80);
  ellipse(width/2, height/2, r, r);
}
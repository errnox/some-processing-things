int c;
String s;
char ch;

void setup() {
  size(640, 480);
  textFont(createFont("Courier bold", 15));
}

void draw() {
  c = mouseX*mouseY;
  s = binary(c);
  background(0, 0, 0);
  stroke(255, 255, 255);
  text("Number: " + c, 20, 20);
  text("Binary: " + s, 20, 40);

  pushStyle();
  stroke(255, 255, 255, 60);
  fill(255, 255, 255, 140);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  textSize(12);
  text(c, mouseX+5, mouseY-5);

  noStroke();
  for(int i = 0; i < s.length(); i++) {
    ch = s.charAt(i);
    if(ch == '1') {
      fill(255, 255, 255, 255);
    } else {
      fill(255, 255, 255, 100);
    }
    rect(i*(15+1)+20, 60, 15, 15);
  }
  popStyle();
}
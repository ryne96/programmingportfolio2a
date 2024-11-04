class Button {
  // Member Variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    c1 = color(255, 192, 203);
    c2 = color(255, 220, 220);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    if (on == true) {
      fill(c2);
    } else {
      fill(c1);
  }

    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on= false;
      return on;
    }
  }
}

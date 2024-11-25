class Rock {
  int x, y, diam, speed;
  PImage r1;

  Rock() {
    x = int(random(width));
    y = -200;
    diam = int(random(20,95));
    speed = int(random(1, 10));
    r1 = loadImage("Rockduro.png");
  }

  void display() {
    r1.resize(diam,diam);
    image(r1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}

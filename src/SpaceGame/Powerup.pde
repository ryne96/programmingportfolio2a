class Powerup {
  char type;
  int x, y, diam, speed;
  PImage r2 ,r3;
  

  Powerup() {
    x = int(random(width));
    y = -200;
    diam = int(random(20, 95));
    speed = int(random(1, 5));
    r2 = loadImage("Mini.png");
    int rand = int(random(2));
    if (rand == 0) {
      type = 'h';
    } else if(rand == 1) {
      r2 = loadImage("FNShells.png");
      type = 'a';
    }
  }

  void display() {
    r2.resize(diam,diam);
    image(r2, x, y);
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

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

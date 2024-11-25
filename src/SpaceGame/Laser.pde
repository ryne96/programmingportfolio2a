class Laser {
  int x, y, w, h, speed;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 15;
  }

  void display() {
    fill(255, 255, 255);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<95) {
      return true;
    } else {
      return false;
    }
  }


boolean reachedTop() {
   if (y<-20) {
     return true;
   } else {
     return false;
    }
  }
}

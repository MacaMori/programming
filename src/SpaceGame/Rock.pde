class Rock {
  int x, y, diam, speed;
  PImage Rock;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    speed = int(random(1, 4));
    Rock = loadImage("Rock.png");
  }

  void display() {
    Rock.resize(50, 50);
    imageMode(CENTER);
    image(Rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<70) {
      return true;
    } else {
      return false;
    }
  }
}

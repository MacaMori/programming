class Star {
  int x, y, diam, speed;
  PImage Star;

  // Constructor
  Star() {
    x = int(random(height));
    y = int(random(width));
    speed = int(random(1, 3));
    Star = loadImage("Star.png");
  }

  void display() {
    fill(222, 223, 0);
    Star.resize(20,20);
    imageMode(CENTER);
    image(Star, x, y);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}

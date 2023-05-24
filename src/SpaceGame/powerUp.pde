class Power {
  int x, y, diam, speed;
  char type;
  //PImage Power;

  // Constructor
  Power() {
    x = int(random(width));
    y = -50;
    diam = int(random(50, 100));
    speed = int(random(1, 4));
    //Power = loadImage("power.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'A';
    } else if (rand == 1) {
      type = 'H';
    } else {
      type = 'T';
    }
  }


  void display() {
    //Power.resize(50, 50);
    //imageMode(CENTER);
    //image(Power, x, y);
    fill(0, 222, 0);
    ellipse(x, y, diam, diam);
    fill(255);
    text(type, x, y);
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


  boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<70) {
      return true;
    } else {
      return false;
    }
  }
}

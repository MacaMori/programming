class Laser {
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    x = 0;
    y = 0;
    w = 4;
    h = 10;
    speed = 5;
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(0, 255, 0);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

 boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<10) {
      return true;
    } else {
      return false;
    }
  }
}

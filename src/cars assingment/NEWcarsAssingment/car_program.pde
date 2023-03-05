class Car {
  color c;
  float xpos, ypos, xspeed;

  Car() {
    c=color(random(255), random(0), random(255));
    xpos= random(width);
    ypos=random(height);
    //xspeed= random(-3, 5);
    if (ypos>height/2) {
      xspeed=random(1, 5);
    } else if (ypos<height/2) {
      xspeed=random(-5, -1);
    }
  }

  void display() {
    stroke(#FAC608);
    line(0, height/4, 6000, height/4);
    line(0, 750, 6000, 750);
    stroke(255);
    line(0, height/2, 6000, height/2);
    stroke(0);
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(127);
    rect(xpos-6, ypos-6, 6, 3);
    rect(xpos-6, ypos+7, 6, 3);
    rect(xpos+6, ypos-6, 6, 3);
    rect(xpos+6, ypos+7, 6, 3);
    noStroke();
    if (xspeed>0) {
      rect(xpos-12, ypos-2, 5, 2);
      rect(xpos-12, ypos+2, 5, 2);
      rect(xpos-16, ypos+0, 5, 11);
    } else if (xspeed<0) {
      rect(xpos+12, ypos+2, 5, 2);
      rect(xpos+12, ypos-2, 5, 2);
      rect(xpos+16, ypos+0, 5, 11);
    }
  }

  void drive() {
    xpos=xpos+xspeed;
    if (xpos>width) {
      xpos=0;
    } else if (xpos<0) {
      xpos = width;
    }
  }
}

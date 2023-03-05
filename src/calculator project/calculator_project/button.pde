class Button {
  //Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  //constructor
  Button(int x, int y, int w, int h, char val, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.c1=c1;
    this.c2=c2;
    c1 = color(#ADC9BF);
    c2 = color(#C5E6DA);
    on = false;
    text(val, x, y);
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 10);
    fill(0);
    textMode(CENTER);
    if (val== 'c') {
      text("cl", x-2.6, y+5);
    } else if (val== 's') {
      text("x²", x-2.6, y+5);
    } else if (val== 'd') {
      text("10", x-2.6, y+5);
    } else if (val== 'f') {
      text("11", x-2.6, y+5);
    } else {
      text(val, x-2.6, y+5);
    }
  }


  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}

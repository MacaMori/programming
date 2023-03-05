// Maxim Dobrovisnky | 24 oct 2022 | Cars App
Car[] cars = new Car[13];

void setup() {
  noSmooth();
  frameRate(60);
  clear();
  size(2000, 1000);
  for (int i=0; i<cars.length; i++) {
    cars[i]=new Car();
  }
}

void draw() {
  background(0);
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}

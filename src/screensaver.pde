//Max Dobrovinsky | Oct 10 2022 | Screensaver app
float xpos, ypos, strokeW, pointCount;

void setup () {
  size(displayWidth, displayHeight);
  xpos = random (width);
  ypos = random (height);
  background(#2F5656);
}

void draw () {
  strokeW = random(2, 10);
  pointCount = random(10, 50);
  stroke(random(255), random(20), random(50));
  strokeWeight(strokeW);
  if (xpos <0 || xpos > width || ypos <0 || ypos > height) {
    xpos = random(width);
    ypos = random(height);
  }
  if (random(200)>185) {
    moveRight(xpos, ypos, pointCount);
  } else if (random(200)>180) {
    moveUp(xpos, ypos, pointCount);
  } else if (random(200)>180) {
    moveLeft(xpos, ypos, pointCount);
  } else if (random(200)>182.5) {
    moveDown(xpos, ypos, pointCount);
  } else if (random(200)>175) {
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX +i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX -i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY -i);
    xpos = startX;
    ypos = startY -i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY +i);
    xpos = startX;
    ypos = startY +i;
  }
}

//Maxim Dobrovisnky | nov 28 | SpaceGame //<>//
import processing.sound.*;
SoundFile blaster, explosion;
SpaceShip s1;
Timer rockTimer, powerTimer;
ArrayList<Rock> rockField = new ArrayList<Rock>();
ArrayList<Power> Powers = new ArrayList<Power>();
ArrayList<Laser> Lasers = new ArrayList<Laser>();
Star [] stars = new Star[100];
int score, level, rockCount, laserCount, Lives;
boolean play;

void setup() {
  frameRate(120);
  size(800, 800);
  s1 = new SpaceShip();
  rockTimer = new Timer(1000);
  rockTimer.start();
  powerTimer = new Timer(500);
  powerTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  Lives = 10;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(20);
    //////////Render Stars\\\\\\\\\\
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();
    //////////Add Rocks\\\\\\\\\\
    if (rockTimer.isFinished()) {
      rockField.add(new Rock());
      rockTimer.start();
      println("Rocks:" + rockField.size());
    }
    //////////power up distribution\\\\\\\\\\
    if (powerTimer.isFinished()) {
      Powers.add(new Power());
      powerTimer.start();
      println("Rocks:" + Powers.size());
    }

    //////////Render powerups and detect ship colision\\\\\\\\\\
    for (int i = 0; i < Powers.size(); i++) {
      Power pu = Powers.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'h') {
          s1.health=100;
        } else if (pu.type == 'A') {
          s1.ammo+=100;
        } else {
          s1.turretCount++;
          score-=pu.diam;
          Powers.remove(pu);
        }
        if (pu. reachedBottom()) {
          Powers.remove(pu);
        } else {
          pu.display();
          pu.move();
        }
      }
    }
    
      //////////Render Rocks and detect ship colision\\\\\\\\\\
      for (int i = 0; i < rockField.size(); i++) {
        Rock r = rockField.get(i);
        if (s1.intersect(r)) {
          s1.health-=r.diam;
          score-=r.diam;
          rockField.remove(r);
        }
        if (r. reachedBottom()) {
        } else {
          r.display();
          r.move();
          Lives--;
        }
      }

      //////////Render Lasers\\\\\\\\\\
      for (int i = 0; i < Lasers.size(); i++) {
        Laser l = Lasers.get(i);
        for (int j = 0; j < rockField.size(); j++) {
          Rock r = rockField.get(j);
          if (r.intersect(l)) {
            Lasers.remove(l);
            r.diam -= 50;
            if (r.diam<10) {
              rockField.remove(r);
            }
            score+=100;
          }
        }
        if (l. reachedTop()) {
          Lasers.remove(l);
          println(rockField.size());
        } else {
          l.display();
          l.move();
        }
      }


      s1.display();
      s1.move(mouseX, mouseY);
      infoPanel();
    }
  }


void mousePressed() {
  //blaster.stop();
  //blaster.play();
  //if (s1.fire() && s1.turretCount ==1) {
  //  Lasers.add(new Laser(s1.x, s1.y));
  handleEvent();
}

//if (s1.health<1 || Lives<0) {
//  gameOver();
//}

void keyPressed() {
  if (key == 'x') {
    handleEvent();
  }
}

void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    Lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + Lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    Lasers.add(new Laser(s1.x-20, s1.y));
    Lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + Lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    Lasers.add(new Laser(s1.x-20, s1.y));
    Lasers.add(new Laser(s1.x+20, s1.y));
    Lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + Lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    Lasers.add(new Laser(s1.x-20, s1.y));
    Lasers.add(new Laser(s1.x+20, s1.y));
    Lasers.add(new Laser(s1.x+40, s1.y));
    Lasers.add(new Laser(s1.x+40, s1.y));
    println("Lasers:" + Lasers.size());
  }
}

void infoPanel() {
  fill(200, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(30);
  text("SPACEGAME" + "| Level:" + level + "| Score:" + score + "| health:" + s1.health + "| Lives:" + Lives + "| Ammo:" + s1.ammo, 20, 35);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Click or press key to start", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  play = false;
  noLoop();
}

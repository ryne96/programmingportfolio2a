// Ryne Nguyen | 6 Nov. 2024 | SpaceGame
import processing.sound.*;
SoundFile laser1;
int score, level, rockTime;
boolean play;
Spaceship s1;
Rock r1;
char prev = 'f';
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rTime, puTime;


void setup() {
  size(800, 800);
  laser1 = new SoundFile(this,"laser.wav");
  s1 = new Spaceship();
  r1 = new Rock ();
  rockTime = 1000;
  rTime = new Timer(rockTime);
  rTime.start();
  puTime = new Timer(1000);
  puTime.start();
  noCursor();
  level = 1;
  play = false;
  rockTime = 1000;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if(frameCount % 1000 == 0) {
      level = level + 1;
      rockTime-=50;
    }

    background(0);
    stars.add(new Star());
    for(int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if(s.reachedBottom()) {
        stars.remove(s);
      }
    }

    noCursor();

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          score+=r.diam;
          lasers.remove(laser);
          r.diam-=10;
          if (r.diam<5) {
            rocks.remove(r);
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }


    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health -=rock.diam;
        rocks.remove(rock);
        score += rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        if (pu.type == 'h') {
          s1.health += 100;
        } else if (pu.type == 'a') {
          s1.laserCount += 100;
        }
        powups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }




    infoPanel();
    s1.display();
    s1.move(mouseX, mouseY);
    if(s1.health < 1) {
      gameOver();
      noLoop();
    }
  }
}


void keyPressed() {
  if (s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}

void mousePressed() {
  if (s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}



void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(25);
  text("Score:" + score, 20, 35);
  text("Health:" + s1.health, 180, 35);
  text("Ammo:" + s1.laserCount, 360, 35);
  text("Level:" + level, 540, 35);
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome to SpaceGame!", width/2, 300);
  text("click to start..", width/2, 350);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game over!", width/2, 300);
  text("Score:" + score, width/2, 350);
  text("level:" + level, width/2, 400);
}

void ticker() {
}

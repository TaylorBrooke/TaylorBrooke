import g4p_controls.*;

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(1200, 650);
  minim = new Minim(this);
  player = minim.loadFile("Ylvis - What Does The Fox Say- (8-Bit NES Remix).mp3");
  //player = minim.loadFile("I CAN SWING MY SWORD! (Minecraft Song).mp3");
  player.play();
}
int cx = 300;
int cy = 350;
float fx = 800;
float fy = 100;
int f1 = 1;
float life = 20;
float nair = 20;
int foodplus = 2;
int level = 0;
int a = 1;
int tx = 605;
int ty = 335;
int b = 1;
float bx = 1100;
float bx2 = 1200;
float by = 60;
float by2 = 260;
int add = 1;
int m = 0;
int m1 = 0;

void draw() {
  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      level = 0;
      cy = 350;
      cx = 300;
      a = 1;
      life = 20;
      nair = 20;
      tx = 605;
      ty = 335;
    }
  }

  if (level == 0) {
    imageMode(CORNER);
    PImage background = loadImage("aquascape.png");
    PImage nimg = loadImage("narwhal2.png");
    PImage timg = loadImage("seaturtle.png");
    PImage logo = loadImage("logoaquatica.png");
    image(background, 0, 0, 1200, 650);
    image(logo,300,125);
    image(nimg, 300, 300, 200, 200);
    image(timg, 550, 294, 200, 200);
    textSize(45);
    text("Narwhal", 300, 625);
    text("Seaturtle", 550, 625);
  }
  ellipseMode(CENTER);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  fx = fx - random(0, 4);
  fy = fy + random(0, 2);
  if (keyPressed) {
    if (a == 1) {
      if (keyCode == RIGHT) {
        if (cx<1100) {
          cx = cx + 20;
        }
      }
      if (keyCode == DOWN) {
        if (cy<500) {
          cy = cy + 20;
        }
      }
      if (keyCode == LEFT) {
        if (cx>100) {
          cx = cx - 20;
        }
      }
      if (keyCode == UP) {
        if (cy>75) {
          cy = cy - 20;
        }
      }
      if (key==' ') {
        f1 = 1;
        fx = random(800, 1150);
        fy = 100;
      }
    }
  }
  if (life>0 && nair>0) {
    life = life - .025;
  }
  if (cy<=80) {
    nair = 21;
  }
  if (nair>0 && life>0) {
    nair = nair - .015;
  }
  if (fx<0) {
    f1 = 0;
  }
  if (life<=0 || nair<=0) {
    a = 0;
  }
  if (a == 0) {
    textSize(150);
    fill(0);
    stroke(0);
    text("GAME OVER!", 150, 375);
  }
  if (level == 1) {
    PImage background = loadImage("aquascape.png");
    PImage img = loadImage("narwhal2.png");
    PImage food = loadImage("fish.png");
    PImage beer = loadImage("mine.png");
    imageMode(CORNER);
    image(background, 0, 0, 1200, 650);
    imageMode(CENTER);
    image(img, cx, cy, 200, 200);
    image(beer, bx, by);

    image(beer, bx2, by2);
    bx2 = bx2 - random(2, 3);
    by2 = by2 + random(0, 1);
    bx = bx - random(2, 3);
    by = by + random(1, 2);
    if (bx<0 || by>550) {
      bx = random(800, 1200);
      by = 60;
    }
    if (bx2<0 || by2>550) {
      bx2 = 1200;
      by2 = random(160, 600);
    }
    if (bx>cx-100 && bx<cx+100 && by<cy+50 && by>cy-50) {
      bx = random(1000, 1200);
      by = 60;
      life = life - .5;
      m = millis();
    }
    if (bx2>cx-100 && bx2<cx+100 && by2<cy+50 && by2>cy-50) {
      bx2 = 1200;
      by2 = random(160, 600);
      life = life - .5;
      m = millis();
    }
    if (millis()-m<=100 && level == 1) {
      PImage nhurt = loadImage("narwhal-hurt.png");
      image(nhurt, cx, cy, 200, 200);
    }
    if (f1 == 1) {
      image(food, fx, fy);
    }
    if (fx-10<cx+100 && fy<cy+20 && fy>cy-20 && fx-10>cx+40) {
      f1 = 0;
      if (life<=19) {
        life = life + foodplus;
      }
      m1 = millis();
    }
    if (millis()-m1>=700 && millis()-m1<=750) {
      f1 = 1;
      fx = random(800, 1150);
      fy = 100;
    }
    fill(240);
    stroke(0);
    rect(9, 9, 212, 22);
    rect(299, 9, 212, 22);
    for (int i=0; i<=life; i++) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      rect(10+(i*10), 10, 10, 20);
    }
    for (int i=0; i<=nair; i++) {
      fill(0, 150, 255);
      stroke(0, 150, 255);
      rect(300+(i*10), 10, 10, 20);
    }
  }


if (level == 2) {
  background(0, 204, 204);
  fill(240);
  stroke(240);
  rect(0, 0, 1200, 50);
  fill(76, 153, 0);
  stroke(76, 153, 0);
  rect(0, 550, 1200, 100);
  imageMode(CENTER);
  PImage turtle = loadImage("seaturtle.png");
  PImage beer = loadImage("mine.png");
  image(turtle, tx, ty, 200, 200);
  image(beer, bx, by);
  image(beer, bx2, by2);
  bx2 = bx2 - random(2, 3);
  by2 = by2 + random(0, 1);
  bx = bx - random(2, 3);
  by = by + random(1, 2);
  if (bx<0 || by>550) {
    bx = random(800, 1200);
    by = 60;
  }
}
if (bx2<0 || by2>550) {
  bx2 = 1200;
  by2 = random(160, 600);
}
if (bx>tx-70 && bx<tx+50 && by<ty+30 && by>ty-60) {
  bx = random(1000, 1200);
  by = 60;
  life = life - .5;
  m = millis();
}
if (bx2>tx-70 && bx2<tx+50 && by2<ty+30 && by2>ty-60) {
  bx2 = 1200;
  by2 = random(160, 600);
  life = life - .5;
  m = millis();
}
if (millis()-m<=100 && level == 2) {
  PImage hurt = loadImage("seaturtle-hurt.png");
  image(hurt, tx, ty, 200, 200);
}
if (keyPressed) {
  if (a == 1) {
    if (keyCode == RIGHT) {
      if (tx<1130) {
        tx = tx + 4;
      }
    }
    if (keyCode == DOWN) {
      if (ty<487) {
        ty = ty + 4;
      }
    }
    if (keyCode == LEFT) {
      if (tx>70) {
        tx = tx - 4;
      }
    }
    if (keyCode == UP) {
      if (ty>65) {
        ty = ty - 4;
      }
    }
    if (key==' ') {
      f1 = 1;
      fx = random(800, 1150);
      fy = 100;
    }
  }
}
if (ty<75) {
  nair = 20;
}
fill(240);
stroke(0);
rect(9, 9, 212, 22);
rect(299, 9, 212, 22);
for (int i=0; i<=life; i++) {
  fill(255, 0, 0);
  stroke(255, 0, 0);
  rect(10+(i*10), 10, 10, 20);
}
for (int i=0; i<=nair; i++) {
  fill(0, 150, 255);
  stroke(0, 150, 255);
  rect(300+(i*10), 10, 10, 20);
}
if (f1 == 1) {
  PImage tfood = loadImage("fish.png");
  image(tfood, fx, fy);
}
if (fx<0) {
  f1 = 0;
}
if (fx-10<tx+80 && fy<ty+20 && fy>ty-10 && fx-40>tx+20) {
  f1 = 0;
  if (life<=19) {
    life = life + foodplus;
  }
  m1 = millis();
}
if (millis()-m1>=700 && millis()-m1<=750) {
  f1 = 1;
  fx = random(800, 1150);
  fy = 100;
}
if (nair>0 && life>0) {
  nair = nair - .007;
}
if (life>0 && nair>0) {
  life = life - .015;
}
if (life<=0 || nair<=0) {
  a = 0;
}
fx = fx - random(0, 4);
fy = fy + random(0, 2);
if (a == 0) {
  textSize(150);
  fill(0);
  stroke(0);
  text("GAME OVER", 150, 375);
}
}



void mousePressed() {
  if (level == 0) {
    if (mouseX>300 && mouseX<500 && mouseY>300 && mouseY<500) {
      level = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>250 && mouseY<450) {
      level = 2;
    }
  }
  if (level == 1) {
    f1 = 1;
    fx = random(800, 1150);
    fy = 100;
  }
  if (level == 2) {
    f1 = 1;
    fx = random(800, 1150);
    fy = 100;
  }
}


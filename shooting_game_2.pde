ArrayList<Bullet> bulList;
int bulSize = 10;
int isHit = -1;
int eneCount = 5;
int lifeMin = 1;
int lifeMax = 5;
int gameScene = 2; //0はプレイ中、1はゲームオーバー、2はスタート画面、3はレベル選択画面
float addStep;
int gameLevel = 1;
//int hitEneIndex = -1;
Enemy ene;
Player player;
Bullet bullet;
Score score;
Gameover gameover;
Start sta;

void setup() {
  size(600, 800);
  frameRate(120);
  ene = new Enemy();
  player = new Player();
  bullet = new Bullet(mouseX);
  score = new Score();
  gameover = new Gameover();
  sta = new Start();
  bulList = new ArrayList<Bullet>();
  ene.initEneBlock();
  noStroke();
}

void draw() {
  if (gameLevel == 2) {
    ene.e_l = width/20+25;
    addStep = 4;
    lifeMax = 6;
  } else if (gameLevel == 3) {
    ene.e_l = width/20+20;
    lifeMax = 9;
    addStep = 0.5;
  } else {
    addStep = 0.1;
  }
  background(#F7F72D);

  if (gameScene == 0) {
    for (int i=0; i<bulList.size(); i++) {
      bulList.get(i).gameLoop();
      if (bulList.get(i).b_y < 0) {
        bulList.remove(i);
      }
    }

    player.gameLoop();
    ene.gameLoop();
    if (gameScene != 3) {
      score.display();
    }


    for (int e=0; e<bulList.size(); e++) {

      float y1 = ene.e_y;
      int d1 = ene.e_l;
      int x2 = bulList.get(e).b_x;
      int y2 = bulList.get(e).b_y;
      int d2 = bullet.b_d;
      isHit = isHit(ene.xList, y1, d1, x2, y2, d2);
      if (isHit != -1) {

        ene.tmp[isHit]--;
        if (ene.tmp[isHit] < 0) {
          ene.tmp[isHit] = ene.eLife[isHit];
          ene.isDie[isHit] = false;
        }
        if (ene.tmp[isHit] == 0) {
          ene.isDie[isHit] = true;
        }
      }
      if (isHit != -1) {
        bulList.remove(e);
      }
    }



    if (judgeAllDie()) {
      ene.initEne();
      isHit = -1;
    }
    if (ene.e_y > height + ene.e_l) {
      gameScene = 1;
      bulSize = 100;
    }

    noCursor();
  } else if (gameScene == 1) {
    gameover.gameLoop();
    cursor();
  } else if (gameScene == 2) {
    sta.display();
  } else {
    sta.gameLevel();
  }
}

void mousePressed() {
  if (bulSize > bulList.size() && gameScene != 2) {
    bulList.add(new Bullet(mouseX));
  }
}







int isHit(int[] eneX, float y1, int d1, int bulX, int y2, int d2) {
  for (int i=0; i<eneX.length; i++) {
    float distance = dist(eneX[i], y1, bulX, y2);
    int sum = abs(d1 / 2 + d2 / 2);
    if (distance < sum) {
      return i;
    }
  }
  return -1;
}

boolean judgeAllDie() {
  int count = 0;
  for (int i=0; i<eneCount; i++) {
    if (ene.isDie[i]) {
      count++;
    }
  }
  if (count == eneCount) {
    score.updata();
    return true;
  } else {
    return false;
  }
}

void initGame() {
  bulSize = 10;
  score.totle = 0;
  gameScene = 2;
  ene.initEneBlock();
  ene.initEne();
  ene.eStep = 0.1;
  
    
}


boolean makeButtom(int x, int y, int w, int h, color hoverCol, String msg, int size) {
  boolean inx = isWithin(mouseX, x-w/2, x+w/2);
  boolean iny = isWithin(mouseY, y-h/2, y+h/2);
  fill(0);
  if (inx && iny) {
    fill(hoverCol);
  }
  rect(x-w/2, y-h/2, w, h);
  textAlign(CENTER);
  fill(255);
  textSize(size);
  text(msg, x, y+10);
  if (inx && iny && mousePressed) {
    return true;
  }
  return false;
}

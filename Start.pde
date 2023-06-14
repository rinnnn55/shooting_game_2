class Start {
  boolean pressed = false;
  int[] e_xList = new int[3];
  int elpres = -1;
  void startScreen() {
    background(#F4F79D);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("SHOOTING_GAME", width/2, height*0.15);
    fill(255,0,0);
    text("LEVEL "+gameLevel, width/2, height*0.3);
    if (makeButtom(width/2, height/2, 200, 50, #FA0F32, "click to start", 37)) {
      gameScene = 0;
    }
  }

  void display() {

    startScreen();
    if (makeButtom(width/2, height/2 + 60, 125, 25, #FA0F32, "level selection", 20)) {
      gameScene = 3;
    }
    
    
  }

  void gameLevel() {
    int d = 100;
    int x = width/2 - d * 2;
    int y = height/2;
    for (int i=0; i<3; i++) {
      e_xList[i] = x+d*i*2;
    }

    background(#F4F79D);
    textSize(50);
    fill(0);
    text("Select a level", width/2, 200);

    fill(255);
    textLev(e_xList, y, d);

    elpres = elpres(e_xList, y, d);
    if (elpres != -1) {
      gameLevel = elpres+1;
      println(gameLevel);
      delay(500);
      gameScene = 2;
    }
  }

  void textLev(int[] x, int y, int d) {
    for (int i=0; i<x.length; i++) {
      fill(255);
      ellipse(x[i], y, d, d);
      textAlign(CENTER);
      fill(0);
      text(i+1, x[i], y+10);
    }
  }
}



int elpres(int[] x, int y, int d) {
  for (int i=0; i<x.length; i++) {
    float distance = dist(mouseX, mouseY, x[i], y);
    if (distance < d/2 ) {
      if (mousePressed) {
        return i;
      }
    }
  }
  return -1;
}

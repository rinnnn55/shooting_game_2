class Gameover {
  void display() {
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
  }

  void makeButtom() {
    int w = 150;
    int h = 33;
    int x = width/2-w/2;
    int y = height/2+30;

    fill(0);
    if (isPressed(x, y, w, h)) {
      gameScene = 2;
      initGame();
      println(2);
    }

    textSize(24);

    rect(x, y, w, h);
    fill(255);
    text("click to restart", x+w/2, y+h/2+7);
  }

  void gameLoop() {
    display();
    makeButtom();
  }
}





boolean isWithin(int n, int low, int high) {
  if (n > low && n < high) {
    return true;
  }
  return false;
}

boolean isPressed(int r_x, int r_y, int r_w, int r_h) {
  boolean inx = isWithin(mouseX, r_x, r_x+r_w);
  boolean iny = isWithin(mouseY, r_y, r_y+r_h);
  if ((inx && iny)) {
    fill(255, 0, 0);
    if (mousePressed) {
      return true;
    }
  }
  return false;
}

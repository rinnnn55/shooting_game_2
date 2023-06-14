class Bullet {
  int b_x;
  int b_y = player.p_y;
  int b_d = 5;
  int bStep = 3;
  int mouX;
  Bullet(int _mouX) {
    b_x = _mouX;
  }
  void updata() {
    b_y -= bStep;
  }

  void display() {
    fill(0);
    ellipse(b_x, b_y, b_d, b_d);
  }

  void gameLoop() {
    updata();
    display();
  }
}

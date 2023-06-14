class Player {
  int p_x;
  int p_l = 10;
  int p_y = height - 30;

  void display() {
    p_x = mouseX - p_l / 2;
    fill(0);
    rect(p_x, p_y, p_l, p_l);
  }

  void gameLoop() {
    display();
  }
}

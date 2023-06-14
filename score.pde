class Score{
  int totle = 0;
  int addScore = 100;
  int s_w = 100;
  int s_h = 30;
  int s_x = width - s_w - 10;
  int s_y = 14;
  
  void display(){
    fill(255);
    rect(s_x, s_y, s_w, s_h);
    fill(0);
    textAlign(CENTER);
    textSize(35);
    text(totle, s_x + s_w / 2, s_y + s_h - 5);
  }
  
  void updata(){
    totle += addScore;
  }
  
}

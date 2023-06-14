class Enemy {
  int[] xList = new int[eneCount];
  int[] eLife = new int[eneCount];
  boolean[] isDie = new boolean[eneCount];
  int[] tmp ;
  int e_x = width/2;
  float e_y = 0;
  int e_l = width/20 + 30;
  float eStep = 0.1;

  void updata() {
    e_y += eStep;
  }

  void display() {
    fill(0);
    noStroke();
    for (int i=0; i<eneCount; i++) {
      if(isDie[i]){
        fill(255,0,0);
      }else{
        fill(0);
      }
      ellipse(xList[i], e_y, e_l, e_l);
    }
    
  }

  void gameLoop() {
    updata();
    display();
    displayLife();
  }

  void initEne() {
    e_y = 0;
    for (int i=0; i<eneCount; i++) {
      eLife[i] = int(random(lifeMin, lifeMax));
      isDie[i] = false;
      //xList[i] = int(random(e_l/2, width+(e_l/2)-e_l*eneCount*2));
    }
    eStep += addStep;
     println(eStep + " "+addStep);
    tmp = copyArray(eLife);
  }

  void initEneBlock() {
    for (int i=0; i<eneCount; i++) {
      xList[i] = width / 2 + (i-2)*e_l*2;
      eLife[i] = int(random(lifeMin, lifeMax));
      isDie[i] = false;
    }
    tmp = copyArray(eLife);
    
  }
  
  void displayLife(){
    for(int i=0; i<eneCount; i++){
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text(tmp[i], xList[i], e_y+10);
    }
  }
}

int[] copyArray(int[] data){
  int[] tmp = new int[data.length];
  for(int i=0; i<data.length; i++){
    tmp[i] = data[i];
  }
  return tmp;
}

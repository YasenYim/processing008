int num=20000;



void setup() {
  size(1280, 720);
  setColorParameters();
  declareArrays();
  createSeeds();
}

void draw() {

  for (int t=0; t<60; t++) {  //每帧结晶60个点，这里的for循环是为了调节程序运行速度
    generateRandomPoint();
    pointIndex=getNearestPoint();
    addNewElementIntoArray();
    drawNewElement();
    updateIndex();
  }
}


// void setup 和 void draw 是主函数




float[]xpos;
float[]ypos;
float[]rad;

int index;
float minRad=1;
float maxRad=3;

int pointIndex;
float randomX;
float randomY;
float randomRad;


void setColorParameters() {    //设定配色方案
  background(70, 40, 20);
  noStroke();
  fill(255);
}

void declareArrays() {    //初始化数组
  xpos=new float[num];
  ypos=new float[num];
  rad=new float[num];
}

void createSeeds() {        //创造10个初始种子点
  for (int i=0; i<5; i++) {
    xpos[i]=random(width);
    ypos[i]=0;
    rad[i]=random(minRad, maxRad);
    ellipse(xpos[i], ypos[i], rad[i]*2, rad[i]*2);
  }

  for (int i=5; i<10; i++) {
    xpos[i]=random(width);
    ypos[i]=height;
    rad[i]=random(minRad, maxRad);
    ellipse(xpos[i], ypos[i], rad[i]*2, rad[i]*2);
  }

  index=10;
}

void generateRandomPoint() {    //在屏幕上随机生成一个点
  randomX=random(width);
  randomY=random(height);
  randomRad=random(minRad, maxRad);
}

int getNearestPoint() {    //找到已固定的点中离指定位置最近的点
  int temp=-1;
  float minSqDist=99999999;
  float sqDist;

  for (int i=0; i<index; i++) {
    sqDist=sq(randomX-xpos[i])+sq(randomY-ypos[i]);
    if (sqDist<minSqDist) {
      minSqDist=sqDist;
      temp=i;
    }
  }
  return temp;
}


                  //把新生成的点固定到数组里，
                  //注意！不是固定在随机点出现的位置，而是固定在最近晶体点的旁边
void addNewElementIntoArray() {    
  float angle=atan2(randomY-ypos[pointIndex], randomX-xpos[pointIndex]);
  xpos[index]=xpos[pointIndex]+cos(angle)*rad[pointIndex];
  ypos[index]=ypos[pointIndex]+sin(angle)*rad[pointIndex];
  rad[index]=randomRad;
}

void drawNewElement() {
  ellipse(xpos[index], ypos[index], rad[index]*2, rad[index]*2);
}

            //更新数组里的光标，指向下一个空篮子
void updateIndex() {
  if (index<num-1) {
    index++;
  }
}

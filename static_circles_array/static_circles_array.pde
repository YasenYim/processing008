

void setup(){
  
  size(400,400);
  
  background(255);
  
  for(int x=50;x<width-40;x+=50){    //draw the circles array by nested loop
    for(int y=50;y<height-40;y+=50){
      bubble(x,y);
    }
  }
}

void draw(){
  
}


void mousePressed(){
  background(255);
  
  for(int x=50;x<width-40;x+=50){      //嵌套for循环指定阵列里每个点的位置
    for(int y=50;y<height-40;y+=50){
      bubble(x,y);
    }
  }
}


void bubble(float x,float y){    //在指定位置x,y 处画一组随机颜色的同心圆
  noStroke();
  
  for(int i=3;i>0;i--){
    fill(random(255),random(255),random(255),100);
    ellipse(x,y,i*10,i*10);
  }
}
  

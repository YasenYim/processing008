

void setup(){
  size(1000,800);
  
  background(255);
  noStroke();
  fill(#4ED0F2);
  rect(0,500,width,300);
  
  
  for(int i=0;i<10;i++){
    float x=random(width);
    float y=random(550,height-50);
    color c=color(random(255),random(255),random(255));
    boolean facing;
    if(random(1)<0.5){
      facing=true;
    }else{
      facing=false;
    }
    
    drawFish(x,y,c,facing);  //用前面随机出来的数值来绘制一条鱼
  }
}


//在位置 x,y 处，用颜色c 画一条由 facingRight 来决定左右朝向的 鱼
void drawFish(float x,float y,color c,boolean facingRight){
  pushMatrix();
  translate(x,y);
  
  if(facingRight){
    scale(-1,1);      //这里表示横轴反转，纵轴不变。运行之后，x轴将指向左边
  }
  stroke(0);
  fill(c);
  
  triangle(-14,0,12,-10,12,10);
  triangle(-60,0,0,-40,0,40);
  
  fill(255);
  ellipse(-30,-4,10,10);
  popMatrix();
}
  
  

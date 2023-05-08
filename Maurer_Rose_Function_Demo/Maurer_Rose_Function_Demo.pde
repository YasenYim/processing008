void setup() {
  size(800, 800);
  background(0);
  
  //maurerRose(400,400,200);
  
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      maurerRose(i*100+50, j*100+50, 40);
    }
  }
}

void maurerRose(float xpos, float ypos, float rad) {
  float n=random(6, 20);
  float d=random(50, 100);

  pushMatrix();  
  translate(xpos, ypos);
  strokeWeight(1);
  noFill();
  stroke(#F7A34D);
  beginShape();
  for (float i = 0; i < TWO_PI; i+= (TWO_PI / 60)) {
    float k = i * d;
    float r = rad * sin(n*k);
    float x = r * cos(k);
    float y = r * sin(k);
    vertex(x, y);
  }
  endShape();
  popMatrix();
}

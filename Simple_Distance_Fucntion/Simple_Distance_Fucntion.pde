

void setup() {
  float result=distance(33.33, 0, 0, 44.44);
  println(result);
}



float distance(float x1, float y1, float x2, float y2) {
  float d=sq(x1-x2)+sq(y1-y2);
  d=sqrt(d);
  return d;
}

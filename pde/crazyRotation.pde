float r = 0;
float r_increment = 0.5;
boolean doDraw = true;

void setup() {
  size(720, 720);
  background(200, 200, 50);
  strokeWeight(50);
}

void draw() {
  if(doDraw){
  fill(50, 200, 140, 3);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  fill(random(255), random(255), random(255));
  if(r%240==0){
    ellipse(0,0,240,240);
  }
  if(r%120==0){
    ellipse(0,0,180,180);
  }
  if(r%60==0){
    ellipse(0,0,120,120);
  }
  rotate(r);
  rect(60+r, 90, 100, 10);
  r = r+r_increment;
  if (r>300) {
    //r = r_increment=-0.5;
    r_increment=-0.5;
  }
  if (r<0) {
    r_increment=0.5;
  }
  }
}

void mousePressed(){
    doDraw = !doDraw;
}

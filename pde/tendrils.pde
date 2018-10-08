float ellipse_x = 0;
float ellipse_y = 0;
boolean doDraw=true;
int diam =50; //diameter of circle
void setup(){
    size(400,400);
    background(0,150,0);
    frameRate(300);
}

void draw() {
    if(doDraw){
    fill(random(255),random(255),random(255));
    ellipse(ellipse_x,ellipse_y,diam,diam);
    ellipse_x = (ellipse_x + random(5));
    ellipse_y = (ellipse_y+random(5));
    if(ellipse_y>height+10){
        ellipse_y=0};
    }
    if(ellipse_x>510){
        ellipse_x=0};
    }


void mousePressed(){
    doDraw=!doDraw;
    }

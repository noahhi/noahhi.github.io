float rot = 0;
float Red = random(255);
float Green = random(255);
float Blue = random(255);
boolean doDraw;


void setup() {
    smooth();
    noStroke();
    size(400,400);
    doDraw = true;
    }


 //function for rotating rectangles
void draw_rotating_rectangle(float x, float y,float r,float s) {
    translate(x, y);
    rotate(r);
    rect(0,0,s,s);
    resetMatrix();  }


void draw() {
    if(doDraw == true){
    background(Red,Green,Blue);

    float x = 0;
    while(x < 15) {
    float y = 0;
        while (y < 15) {

        draw_rotating_rectangle( x * 30,y *30, rot+x+y+10, 20);

        y = y + 1;
        }
        x = x +1;}
    rot = rot + .05;}}

  void mousePressed(){
    doDraw = !doDraw;
  }

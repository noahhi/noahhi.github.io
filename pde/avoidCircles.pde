/* @pjs pauseOnBlur="true"; *///sketch only runs when on this window

//////////////////////////global variables///////////////////

float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
float x3 = 0;
float y3 = 0;
float diam = 40;
float Score = 0;
boolean playing = true;
boolean won = false;
float r = 0;
float dest_x = 0;
float dest_y = 0;
float dest_x2 = 500;
float dest_y2 = 500;
float level = 1;




///////////////////////setup////////////////////////////

void setup() {
    size(500,500);
    stroke(255,0,0);
    noFill();
    smooth();
    frameRate(40);

    }


////////////////////////draw///////////////////////////////
void keyPressed() {
    if(key == "p") {
        playing = false

        }

    }


void draw() {


////////////////////////draw variables///////////////////

    strokeWeight(3);
    background(0);
    d = dist(x,y,mouseX,mouseY);
    d2 = dist(x2,y2,mouseX,mouseY);
    d3 = dist(x2,y2,dest_x,dest_y);
    d4 = dist(x3,y3,dest_x2,dest_y2);
    d5 = dist(x3,y3,mouseX,mouseY);
    frameRate((level * 10)+ 30);

//////////////////////////////////// Text for Score/ Level/ Frame Rate ///////////////

    if(playing){
      text("Score  " + Score,80,80);
      text("Level " + level, 80,100);
      text("FrameRate " + ((level * 10)+ 30), 80,120);}



      if(d > diam) {Score = Score + 1;}

////////////////////////// Death to Balls ////////////////////////////////

    if((d < diam) && playing) {
        Score = 0;
        strokeWeight(random(10));

        }

     if((d2 < diam) && playing && (Score > 200)) {
        Score = 0;
        strokeWeight(random(10));

        }
     if((d5 < diam) && playing) {
        Score = 0;
        strokeWeight(random(10));

        }


 //////////////////////////////// Player controlled ball and Follower //////////////

    stroke(0,150,255);
    ellipse(mouseX,mouseY,diam,diam);

    stroke(255,0,0);
    if (playing) {ellipse(x,y,diam,diam);
    x = lerp(x,mouseX,0.02) + random(-2,2);
    y = lerp(y,mouseY,0.02) + random(-2,2);}

////////////////////Some Motivation and  Radomnly Moving Ball spawns when score is 200 /////////////////

    if((Score > 200) && playing) {
        text("Keep it up!",200,100);

    ellipse(x2,y2,diam,diam);

    x2 = lerp(x2,dest_x,0.04);
    y2 = lerp(y2,dest_y,0.04);

    if(d3 < 1) {
        dest_x = random(30,width-30);
        dest_y = random(30,height-30); }
        }

///////////////////// Draw Walls when score is 400 ///////////


    if((Score > 400) && playing) {
        text("Don't Touch the Walls!",300,100);
        rect(0,0,width,30);
        rect(0,0,30,height);
        rect(470,0,30,height);
        rect(0,height-30,width,30);
        if((mouseY<50 || mouseY>450 || mouseX < 50 || mouseX >450) && playing && (Score > 450)) {
            Score = 0;
            }

   //////////////////////// More Motivational Text when score is 600////////////

        }

    if((Score > 600) && playing) {
        text("Can you get to 1000?", 200,200);
        }

  ////////////////////////// WINNER WINNER when score = 1000 /////////////////////////////////////

    if(Score >= 1000) {

        playing = false;
        won = true;

        x2 = 0;
        y2 = 0;

        textSize(40);
        text("YOU WIN!",250,250);

        textSize(15);
        text("Next Level",250,300);
        }

 ////////////////////////////////// Next Level Button  ///////////////////////////////////////////

    if(won) {

        if((mouseX > 240) & (mouseX < 320) & (mouseY < 320) & (mouseY >200)){
            rect(240,280,90,40);

            if (mousePressed == true) {
                Score = 0;
                playing = true;
                level = level + 1;
                won = false;
                }
            }

        }





    //////////////////////////////  Add Another Random Ball on Level 3 and above ///////////////////////

    if((level > 2) && playing) {
        ellipse(x3,y3,diam,diam);

    x3 = lerp(x3,dest_x2,0.04);
    y3 = lerp(y3,dest_y2,0.04);

    if(d4 < 1) {
        dest_x2 = random(width);
        dest_y2 = random(height);
        }
        }

        if (focused == false || mouseX>=width-2) {
    background(0);
    textSize(32);
    text("Click on Screen", width/2-120, height/2);
  }
    }

var canvas;
var bubbles = [];
var applyWindRight = false;
var applyWindLeft = false;
var paused = false;
var sliderRed;
var sliderGreen;
var sliderBlue;
var clock;
var button;
var buttonCounter = 0;
var buttonP;


function setup() {
    //canvas = createCanvas(windowWidth - 400, windowHeight - 100);
    canvas = createCanvas(400, 400);
    canvas.position(windowWidth/2, windowHeight/2);

    clock = createP("" + hour() + " " + minute() + " " + second());
    clock.position(1220, 5);

    sliderRed = createSlider(0, 255, 0, 1);
    sliderRed.style('width', '90px');
    sliderGreen = createSlider(0, 255, 100, 1);
    sliderGreen.style('width', '90px');
    sliderBlue = createSlider(0, 255, 190, 1);
    sliderBlue.style('width', '90px');
    createP("Set the RGB values for the sketch with sliders.")

    button = createButton("This button does nothing!");
    button.mousePressed(buttonPressed);

    for (var i = 0; i < 100; i++) {
        bubbles[i] = new Bubble();
    }
}



function buttonPressed() {
    buttonCounter += 1;
    if (buttonCounter == 10) {
        buttonP = createP("Stop pressing the button....");
    }
    if (buttonCounter == 30) {
        buttonP.html("Really?");
    }
}

function draw() {
    background(0);
    clock.html("" + hour() + " " + minute() + " " + second());
    fill(sliderRed.value(), sliderGreen.value(), sliderBlue.value());

    rect(0, 0, width, 10);
    rect(width - 10, 0, 10, height);
    rect(0, 0, 10, height);
    rect(0, height - 10, width, 10);

    if (applyWindRight == true) {
        text("WIND", 20, 55);
        triangle(60,40,60,60,150,50);
    } else if (applyWindLeft == true) {
        text("WIND", 120, 55);
        triangle(110,40,110,60,20,50);
    } else {
        text("Press Spacebar for wind!", 20, 55);
    }
    text("Press R to Reset Speeds", 20, 95);
    text("Press P to Pause", 20, 115);

    for (var i = 0; i < bubbles.length; i++) {
        bubbles[i].show();
        bubbles[i].checkEdges();
        if (!paused) {
            bubbles[i].applyGravity();
            bubbles[i].move();
            if (applyWindRight == true || applyWindLeft == true) {
                bubbles[i].applyWind();
            }
        }
    }
}

function Bubble() {
    this.x = random(15, width - 15);
    this.y = random(15, height - 30);
    this.diam = random(3, 10);
    this.ySpeed = 0;
    this.xSpeed = 0;
    this.gravity = 0.08;
    this.wind = 0.08;

    this.show = function() {
            ellipse(this.x, this.y, this.diam, this.diam);
        },

        this.move = function() {
            this.y += this.ySpeed;
            this.x += this.xSpeed;
        },

        this.applyGravity = function() {
            this.ySpeed += this.gravity;
        },

        this.applyWind = function() {
            if (applyWindRight == true) {
                this.xSpeed += this.wind;
            } else {
                this.xSpeed -= this.wind;
            }
        },

        this.resetxSpeed = function() {
            this.xSpeed = 0;
            this.ySpeed = 0;
        }

    this.checkEdges = function() {
        if (this.y >= (height - (10+this.diam))) {
            this.ySpeed = -this.ySpeed;
            this.y = height - (11+this.diam);
        }
        if (this.y <= (10)) {
            this.ySpeed = -this.ySpeed;
            this.y = 11;
        }
        if (this.x >= (width - (10+this.diam))) {
            this.xSpeed = -this.xSpeed;
            this.x = width - (11+this.diam);
        }
        if (this.x <= (10+this.diam)) {
            this.xSpeed = -this.xSpeed;
            this.x = (11+this.diam);
        }
    }
}


function keyPressed() {
    if (key == "r" || key == "R") {
        for (var i = 0; i < bubbles.length; i++) {
            bubbles[i].resetxSpeed();
        }
    }

    if (key == "p" || key == "P") {
        if (paused == false) {
            paused = true;
        } else {
            paused = false;
        }
    }

    if (key == " ") {
        if (applyWindRight == true) {
            applyWindRight = false;
            applyWindLeft = true;
        } else if (applyWindLeft == true) {
            applyWindLeft = false;
        } else {
            applyWindRight = true;
        }
    }
}

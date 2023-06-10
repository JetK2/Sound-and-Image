//Click "P" to activate party mode
//Click "R" to activate rest mode
//You can drag each one one across the x axis to change the frequency and y axis to change the amplitude
//Use 1,2,3,4 as a keyboard
//1 = sawtooth, 2 = sin, 3 = square, 4 = triangle
import processing.sound.*;

PImage img;

SawOsc saw;
SinOsc sin;
SqrOsc sqr;
TriOsc tri;

boolean party = false;

float speedxSaw = 15;
float speedySaw = 10;
float speedxSin = 13;
float speedySin = 11;
float speedxSqr = 16;
float speedySqr = 9;
float speedxTri = 14;
float speedyTri = 8;
float xSaw = 50;
float ySaw = 50;
float xSin = 850;
float ySin = 850;

float xSqr = 50;
float ySqr = 850;
float xTri = 850;
float yTri = 50;

float dist = 100;
boolean draggingSaw = false;
boolean draggingSin = false;
boolean draggingSqr = false;
boolean draggingTri = false;

void setup() {
  size(900, 900);
//Loads the background which I made in a pixelart.com
  img = loadImage("floor.png");

//Sets up the limits of the oscillators
  saw = new SawOsc(this);
  saw.freq(220);
  saw.amp(0.4);

  sin = new SinOsc(this);
  sin.freq(220);
  sin.amp(0.4);

  sqr = new SqrOsc(this);
  sqr.freq(220);
  sqr.amp(0.4);

  tri = new TriOsc(this);
  tri.freq(220);
  tri.amp(0.4);
}

void draw() {
  background(255);
  image(img, 0, 0, 900, 900);

//If statement to toggle party mode on and off using boolean
  if (party == true) {


    rectMode(CENTER);
    colorMode(HSB);
// frame count used to slow down the change between colours
    fill(frameCount % 360, 255, 255, 50);
    rect(width/2, height/2, 900, 900);

//Controls the randomised movement
    xSaw += speedxSaw;
    ySaw += speedySaw;
    xSin += speedxSin;
    ySin += speedySin;

    xSqr += speedxSqr;
    ySqr += speedySqr;
    xTri += speedxTri;
    yTri +=speedyTri;
//Bounces the circles off the edges
    if (xSaw > width || xSaw < 0) {
      speedxSaw =- speedxSaw;
    }

    if (ySaw > height || ySaw < 0 ) {
      speedySaw =- speedySaw;
    }

    //
    if (xSin > width || xSin < 0) {
      speedxSin =- speedxSin;
    }

    if (ySin > height || ySin < 0 ) {
      speedySin =- speedySin;
    }

    //
    if (xSqr > width || xSqr < 0) {
      speedxSqr =- speedxSqr;
    }

    if (ySqr > height || ySqr < 0 ) {
      speedySqr =- speedySqr;
    }

    if (xTri > width || xTri < 0) {
      speedxTri =- speedxTri;
    }

    if (yTri > height || yTri < 0 ) {
      speedyTri =- speedyTri;
    }
  }

  if (party == false) {
//if statements so the drag follows the mouse
    if (draggingSaw) {
      xSaw = mouseX;
      ySaw = mouseY;
    }

    if (draggingSin) {
      xSin = mouseX;
      ySin = mouseY;
    }

    if (draggingSqr) {
      xSqr = mouseX;
      ySqr = mouseY;
    }

    if (draggingTri) {
      xTri = mouseX;
      yTri = mouseY;
    }
  }

//circles and labels
  fill(0);
  ellipse(xSaw, ySaw, dist, dist);
  ellipse(xSin, ySin, dist, dist);
  ellipse(xSqr, ySqr, dist, dist);
  ellipse(xTri, yTri, dist, dist);
  fill(255);
  textSize(20);
  text("Saw", xSaw-15, ySaw+8);
  text("Sin", xSin-15, ySin+8);
  text("Sqr", xSqr-15, ySqr+8);
  text("Tri", xTri-13, yTri+8);
  
//The position of the circle controls the values of the freq and amp
  saw.freq(map(xSaw, 0, width, 80, 2000));
  saw.amp(map(ySaw, height, 0, -1, 1));

  sin.freq(map(xSin, 0, width, 80, 2000));
  sin.amp(map(ySin, height, 0, -1, 1));

  sqr.freq(map(xSqr, 0, width, 80, 2000));
  sqr.amp(map(ySqr, height, 0, -1, 1));

  tri.freq(map(xTri, 0, width, 80, 2000));
  tri.amp(map(yTri, height, 0, -1, 1));
}

//Using mouse pressed to activate drag
void mousePressed() {
  if (dist(xSaw, ySaw, mouseX, mouseY) < dist/2) {
    draggingSaw = true;
    draggingSin = false;
    draggingSqr = false;
    draggingTri = false;
  }

  if (dist(xSin, ySin, mouseX, mouseY) < dist/2) {
    draggingSaw = false;
    draggingSin = true;
    draggingSqr = false;
    draggingTri = false;
  }

  if (dist(xSqr, ySqr, mouseX, mouseY) < dist/2) {
    draggingSaw = false;
    draggingSin = false;
    draggingSqr = true;
    draggingTri = false;
  }

  if (dist(xTri, yTri, mouseX, mouseY) < dist/2) {
    draggingSaw = false;
    draggingSin = false;
    draggingSqr = false;
    draggingTri = true;
  }
}

//Deactivates drag when mouse released
void mouseReleased() {
  draggingSaw = false;
  draggingSin = false;
  draggingSqr = false;
  draggingTri = false;
}

//Plays oscillators
void keyPressed() {
  if (key == '1') {
    saw.play();
  } else if (key == '2') {
    sin.play();
  } else if (key == '3') {
    sqr.play();
  } else if (key == '4') {
    tri.play();
  } else if (key == 'p') {

    party = true;
  }
}

//stops oscillators when key released
void keyReleased() {
  if (key == '1') {
    saw.stop();
  } else if (key == '2') {
    sin.stop();
  } else if (key == '3') {
    sqr.stop();
  } else if (key == '4') {
    tri.stop();
  } else if (key == 'r') {
    party = false;
  }
}

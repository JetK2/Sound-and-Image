//Click mouse to redraw
void setup(){

  size(900, 900);
  strokeCap(SQUARE);
  noFill();
  noLoop();

  
}

void draw() {
  background(50);
  
  
//rainbow colour palette 
color[] palette = {
color(176,18,32),
color(202,75,19),
color(202,75,19),
color(50,139,58),
color(55,90,162),
color(173,110,121),
color(173,110,121),
color(247,198,48),
color(0,124,186),
color(122,217,152),
color(0,130,114),
color(249,190,175),
color(200,78,58),
color(213,238,246),
color(239,130,42)};

//randomises the position

  float conPosX = random(100,850);
  float conPosY = random(100,850);
  float minConPosX = random(100,850);
  float minConPosY = random(100,850);

  float circlePosX = random(100,850);
  float circlePosY = random(100,850);
  
  float semiPosX = random(100,850);
  float semiPosY = random(100,850);
  
//randomises the colours
  color randomC1 = palette[int(random(palette.length))];
  color randomC2 = palette[int(random(palette.length))];
  color randomC3 = palette[int(random(palette.length))];
  color randomC4 = palette[int(random(palette.length))];
  color randomC5 = palette[int(random(palette.length))];
  color randomC6 = palette[int(random(palette.length))];
  color randomC7 = palette[int(random(palette.length))];
  color randomC8 = palette[int(random(palette.length))];
  color randomC9 = palette[int(random(palette.length))];
  color randomC10 = palette[int(random(palette.length))];
  color randomC11 = palette[int(random(palette.length))];
  color randomC12 = palette[int(random(palette.length))];
  color randomC13 = palette[int(random(palette.length))];

//rotates the big semi circle in the middle
  push();
  translate(597,-169);
  rotate(45);
  semi_circle(randomC1,randomC2, width/2, height/2,820);
  pop();

//Calls the rainbow ring function for the outer ring
  rainbow_rings();

//Calls the concentric circle function 
  push();
  translate(width/2,height/2);
  con_circles_out(20,randomC3,3);
  con_circles_out(20,randomC4,5);
  con_circles_out(20,randomC5,7);
  pop();
  
  push();
  translate(conPosX,conPosY);
  con_circles_out(10,randomC6,1);
  con_circles_out(10,randomC7,2);
  pop();
  
  push();
  translate(minConPosX,minConPosY);
  con_circles_out(7,randomC8,1);
  con_circles_out(7,randomC9,2);
  pop();
 
//smaller semi circle 
  semi_circle(randomC10,randomC11, semiPosX, semiPosY,300);
  
//semi circle with the smaller circle in the middle 
  semi_circle(randomC12,randomC13, circlePosX, circlePosY,300);
  fill(palette[int(random(palette.length))]);
  circle(circlePosX, circlePosY,100);
}

//Semi arc function. I didn't use it in the draw function but I didn't want to remove the option of adding it in 
void semi_arc(color c1,color c2,float x,float y,int size){
  noFill();
  strokeWeight(13); 
  stroke(c1);
  arc(x, y, size, size, PI,TWO_PI);
  stroke(c2);
  arc(x, y, size, size, 0, PI);
}

//Concentric circles function. I made it so starts from out to in.
//As I used this method for the rainbow ring
void con_circles_out(int num,color c1,int spacing){
  noFill();
  strokeWeight(12);
  for(int i = num; i > 0; i -= spacing){
  stroke(c1);
  circle(0,0,i*30);
  }
}

//Semi circle function
void semi_circle(color c1,color c2,float x,float y,int size){
  fill(c1);
  noStroke();
  arc(x, y, size,size, radians(90) , radians(270));
  fill(c2);
  arc(x, y, size,size, radians(-90),radians(90));

}

void rainbow_rings(){
  push();
  colorMode(HSB);
  noFill();
  int ringCount = 34;
  int stopRingsAt = 23;
 //for loop to create the rings
  for (int i = ringCount; i > stopRingsAt; i -= 1) {
// for loop to gradient the hue across the rings
    for (int d = 0; d < 8; d+=1) {


      float redness = d * map(i, stopRingsAt, ringCount, 1, ringCount);



      strokeWeight(16);
      stroke(redness, 175, 200);

      circle(width/2, height/2, i*35);
    }
  }
  pop();
}

//regenerates when mouse pressed
void mousePressed(){
redraw();
}

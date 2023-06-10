class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector water;
  float landing = 0.05;
  float lifespan;
  float decay;
  float theta = 0;

  int radius = 10;
  //particle vectors and variables
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector();
    lifespan = 255;
    decay = 1;
  }

  //moves the particle and contains the particles expiration
  void addForce(PVector f) {

    acceleration.add(f);
  }
  boolean expired() {
    return lifespan <0;
  }
  //updates the forces on the particle
  void update() {

    // adds the vectors together
    velocity.add(acceleration);
    position.add(velocity);

    //sets acceleration to 0 so you get the floaty effect
    acceleration.mult(0);

    // when the particle hits the water it starts to decay while being moved by the current
    if (position.y+radius > height-20) {
      //x controls the water current
      velocity.x += landing;
      velocity.y *= -landing;
      //starts the decay of the lifespan
      lifespan -=decay;
    }
  }

  void display() {
    pushMatrix();
    //using translate to control the position
    translate(position.x, position.y);

    stroke(227, 173, 159, lifespan);

    //cherry blossoms
    fill(218, 125, 139, lifespan);
    circle(0, 2, radius);
    fill(249, 190, 175, lifespan);
    circle(3, 0, radius);
    circle(-3, 0, radius);

    popMatrix();
  }
}

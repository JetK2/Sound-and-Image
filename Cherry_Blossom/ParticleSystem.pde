class ParticleSystem {
  PVector origin;
  ArrayList<Particle> particles;


  ParticleSystem(float x, float y) {
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
  }
  //Creates many particles

  //adds the forces to each particle
  void addForce(PVector f) {
    for (int i = 0; i< particles.size(); i+=1) {
      particles.get(i).addForce(f);
    }
  }

  //updates the forces and lifespan for each particle in the system
  void update() {
    particles.add(new Particle(origin.x, origin.y));

    for (int i = particles.size()-1; i >= 0; i-=1 ) {
      if (particles.get(i).expired()) {
        particles.remove(i);
      }
    }


    for (int i = 0; i< particles.size(); i+=1) {
      Particle p = particles.get(i);

      p.update();
    }
  }
  //displays the system
  void display() {
    for (int i = 0; i< particles.size(); i+=1) {
      Particle p = particles.get(i);

      p.display();
    }
  }
}

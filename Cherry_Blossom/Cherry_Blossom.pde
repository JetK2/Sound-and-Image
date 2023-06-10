//Click "W" to add wind

PVector gravity, wind;
PImage tree;
ArrayList<ParticleSystem> systems;

void setup() {
  size(960, 540);
  //Loads image of the tree which I drew in photoshop
  tree = loadImage("tree.png");
  //Sets up the gravity and wind forces
  gravity = new PVector(0, 0.01);
  wind = new PVector(0.2, -0.1);

  // Sets up the particle systems
  systems = new ArrayList<ParticleSystem>();
  systems.add(new ParticleSystem(0, 60));
  systems.add(new ParticleSystem(90, 0));
}

void draw() {

  background(213, 238, 246);
  noStroke();
  image(tree, -10, -15, 900, 900);
  // displays particles
  for (ParticleSystem ps : systems) {
    ps.addForce(gravity);
    ps.update();
    ps.display();
  }
  noStroke();
  //water
  fill(94, 177, 192, 80);
  rect(0, 515, 960, 25);
}

void keyPressed() {
  //adds wind force when "w" is pressed
  if (key == 'w') {
    for (ParticleSystem ps : systems) {
      ps.addForce(wind);
    }
  }
}

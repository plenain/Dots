Population test;
PVector goal  = new PVector(40, 10);


void setup() {
  size(800, 800);
  frameRate(1000);
  test = new Population(1000);
  println("Generation: 1");
}


void draw() { 
  background(0);

  fill(255, 0, 0);
  noStroke();
  ellipse(goal.x, goal.y, 10, 10);
  
  fill(255, 255, 255);
  rect(700, 50, 10, 700);
  
  fill(255, 255, 255);
  rect(0, 600, 700, 10);
  
  fill(255, 255, 255);
  rect(500, 650, 10, 150);
  
  fill(255, 255, 255);
  rect(250, 200, 10, 400);

  fill(255, 255, 255);
  rect(50, 200, 400, 10);

  fill(255, 255, 255);
  rect(600, 0, 10, 400);

  if (test.allDotsDead()) {
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
  } else {
    test.update();
    test.show();
  }
}

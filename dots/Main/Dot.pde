class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;

  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;

  float fitness = 0;

  Dot() {
    brain = new Brain(1000);

    pos = new PVector(width/2, height- 10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }


  //-----------------------------------------------------------------------------------------------------------------
  void show() {
    if (isBest) {
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
    } else {
      fill(random(255), random(255), random(255));
      ellipse(pos.x, pos.y, 4, 4);
    }
  }

  //-----------------------------------------------------------------------------------------------------------------------
  void move() {

    if (brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }

  //-------------------------------------------------------------------------------------------------------------------
  void update() {
    if (!dead && !reachedGoal) {
      move();
      if (pos.x< 2|| pos.y<2 || pos.x>width-2 || pos.y>height -2) { 
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 5) {
        reachedGoal = true;
      } else if ((pos.x< 200 && pos.y < 260 && pos.x > 0 && pos.y > 250) || (pos.x< 550 && pos.y < 260 && pos.x > 250 && pos.y > 250) || (pos.x< 800 && pos.y < 260 && pos.x > 600 && pos.y > 250)) {
        dead = true;
      } else if ((pos.x< 375 && pos.y < 560 && pos.x > 0 && pos.y > 550) || (pos.x< 800 && pos.y < 560 && pos.x > 425 && pos.y > 550)) {
        dead = true;
      }
    }
  }


  //--------------------------------------------------------------------------------------------------------------------------------------
  void calculateFitness() {
    if (reachedGoal) {
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
    } else {
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------------------
 
  Dot gimmeBaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
}

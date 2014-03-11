class Eye
{
  color eyeColor;
  float pupilSize;
  float irisSize;
  float size;
  PVector loc;
  PVector vel;
  PVector acc;
  Eye()
  {
    eyeColor = color(0, 0, 255);
    acc = new PVector(0, 0.1);
    vel = new PVector(0, 0);
    loc = new PVector(random(width/2-10, width/2+10), random(100, 400));
    size = 50;
    irisSize = 25;
    pupilSize = 10;
  }
  void display() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, size, size);
    fill(eyeColor);
    ellipse(loc.x, loc.y, irisSize, irisSize);
    fill(0);
    ellipse(loc.x, loc.y, pupilSize, pupilSize);
  }
  void look()
  {
  }
  void interact(Eye e)
  {
    float finalV;
    float initialVx = vel.x;
    float initialVy = vel.y;
    float initialV = sqrt(sq(vel.x)+sq(vel.y));
    float mass = size;
    float eMass = e.size;
    float einitialVx = e.vel.x;
    float einitialVy = e.vel.y;
    float einitialV = sqrt(sq(e.vel.x)+sq(e.vel.y));    
    float initialMomentumx = initialVx*mass;
    float initialMomentumy = initialVy*mass;
    float eInitialMomentumx = einitialVx*eMass;
    float eInitialMomentumy = einitialVy*eMass;

    for (int i = 0; i < 360; i++)
    {
      int degree = i;
      float x = sin(degrees(degree))*(size/2)+loc.x;
      float y = cos(degrees(degree))*(size/2)+loc.y;
      strokeWeight(1);
      stroke(255, 0, 0);
      line(loc.x, loc.y, x, y);
    }
    if (dist(loc.x, loc.y, e.loc.x, e.loc.y) < (e.size + size)/2)
    {
      strokeWeight(10);
      line(loc.x, loc.y, e.loc.x, e.loc.y);
      float hyp = dist(loc.x, loc.y, e.loc.x, e.loc.y);
      float x = dist(loc.x, 0, e.loc.x, 0);
      float y = dist(0, loc.y, 0, e.loc.y);
      float theta = asin(y/hyp);
      vel.y = -(sin(theta))*y/1.1;
      vel.x = -(cos(theta))*x/1.1;
      e.vel.y = (sin(theta))*y/1.1;
      e.vel.x =  (cos(theta))*x/1.1;
      println(x);

      //      vel.y = -(initialMomentumy+eInitialMomentumy)/mass;
      //      vel.x = -(initialMomentumx+eInitialMomentumx)/mass;
    }
  }
  void move()
  {
    vel.add(acc);
    loc.add(vel);
    if (loc.y + (size/2) > height)
    {
      loc.y = height-(size/2);
      vel.y*=-.9;
    }
    else if (loc.y - (size/2) < 0)
    {
      loc.y = size/2;
      vel.y*=-.9;
    }
    if (loc.x + (size/2) > width)
    {
      loc.x = width-(size/2);
      vel.x*=-.9;
    }
    else if (loc.x - (size/2) < 0)
    {
      loc.x = size/2;
      vel.x*=-.9;
    }
  }
}


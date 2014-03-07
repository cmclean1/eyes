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
    loc = new PVector(width/2, random(100, 400));
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
    for (int i = 0; i < 360; i++)
    {
      int degree = i;
      float x = sin(degrees(degree))*(size/2)+loc.x;
      float y = cos(degrees(degree))*(size/2)+loc.y;
      stroke(255, 0, 0);
      line(loc.x, loc.y, x, y);
    }
  }
  void move()
  {
    vel.add(acc);
    loc.add(vel);
    if (loc.y + (size/2) > height)
    {
      vel.y*=-.9;
    }
    if (loc.y - (size/2) < 0)
    {
      vel.y*=-1;
    }
    if (loc.x + (size/2) > width)
    {
      vel.x*=-1;
    }
    if (loc.x - (size/2) < 0)
    {
      vel.x*=-1;
    }
  }
}


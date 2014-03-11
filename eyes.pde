Eye e;
Eye ee;
void setup()
{
  size(500, 500);
  e = new Eye();
  ee = new Eye();
  background(0);
}
void draw()
{
  background(0);
  e.display();
  ee.display();
  e.interact(ee);
  ee.interact(e);
  e.move();
  ee.move();
}
void keyPressed()
{
  if(keyCode == LEFT)
  {
    e.vel.x--;
  }
  if(keyCode == RIGHT)
  {
    e.vel.x++;
  }
  if(keyCode == UP)
  {
    e.vel.y--;
  }
  if(keyCode == DOWN)
  {
    e.vel.y++;
  }
}

Eye e;
Eye ee;
void setup()
{
  size(500,500);
  e = new Eye();
  ee = new Eye();
  background(0);
}
void draw()
{
  background(0);
  e.display();
  ee.display();
  e.move();
  ee.move();
  e.interact(ee);
}

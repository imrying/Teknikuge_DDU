class GravityController
{
  GravityController() {
  }

  PVector[] changeGravity(int p1, int p2, PVector grav1, PVector grav2)
  {
    PVector[] newG = new PVector[2];

    if (p2 == 0)
    {
      newG[0] = grav1;
    }
    if (p2 == 1)
    {
      newG[0] = new PVector(0,-0.5);
    }
    if (p2 == 2)
    {
      newG[0] = new PVector(0,0.5);
    }
    if (p2 == 3)
    {
      newG[0] = new PVector(-0.5,0);
    }
    if (p2 == 4)
    {
      newG[0] = new PVector(0.5,0);
    }
    if (p2 == 5)
    {
      newG[0] = new PVector(0,0);
    }

    if (p1 == 0)
    {
      newG[1] = grav2;
    }
    if (p1 == 1)
    {
      newG[1] = new PVector(0,-0.5);
    }
    if (p1 == 2)
    {
      newG[1] = new PVector(0,0.5);
    }
    if (p1 == 3)
    {
      newG[1] = new PVector(-0.5,0);
    }
    if (p1 == 4)
    {
      newG[1] = new PVector(0.5,0);
    }
    if (p1 == 5)
    {
      newG[1] = new PVector(0,0);
    }
    
    return newG;
  }
}

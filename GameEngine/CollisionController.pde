class CollisionController
{
  PVector[] prevpos;
  PVector playerSize;

  GameObject gravityButton;
  CollisionController(PVector p1pos, PVector p2pos, float size)
  {
    prevpos = new PVector[2];
    prevpos[0] = new PVector(p1pos.x, p1pos.y);
    prevpos[1] = new PVector(p2pos.x, p2pos.y);
    playerSize = new PVector(size, size);
  }

  int[] collisionCheck(ArrayList<GameObject> gameObjects, GameObject[] p, PVector[] g)
  {
    int[] collisionArray = new int[4];

    for (int i = 0; i < 2; i++)
    {
      for (GameObject obj : gameObjects)
      {
        if (obj.id == 1)
        {
          continue;
        }
        PVector overlap = GetOverlap(p[i], obj);
        PVector prevOverlap = GetOverlap(prevpos[i], obj);

        if (overlap.x < 0 || overlap.y < 0) // no collision
        {
          continue;
        }

        if (obj.id == 3) //kollision med gravitbutton
        {
          gravityButton = obj;
          collisionArray[i+2] = obj.direction;
        }

        if (prevOverlap.y > 0)
        {
          if ((p[i].vel.x > 0 && g[i].x > 0) || (p[i].vel.x < 0 && g[i].x < 0))
          {
            collisionArray[i] = 1; //allow jumping
          }
          p[i].vel.x = 0;
          SetXCoordinate(p[i], obj);
        } else if (prevOverlap.x > 0)
        {
          if ((p[i].vel.y > 0 && g[i].y > 0) || (p[i].vel.y < 0 && g[i].y < 0))
          {
            collisionArray[i] = 1; //allow jumping
          }
          p[i].vel.y = 0;
          SetYCoordinate(p[i], obj);
        } else
        {
          if (overlap.x > overlap.y)
          {
            SetYCoordinate(p[i], obj);
          } else
          {
            SetXCoordinate(p[i], obj);
          }
        }
        prevOverlap = GetOverlap(p[i], obj);
      }
      prevpos[i].x = p[i].pos.x;
      prevpos[i].y = p[i].pos.y;
    }
    return collisionArray;
  }

  PVector GetOverlap(GameObject g1, GameObject g2)
  {
    return new PVector(((g1.size.x + g2.size.x)/2) - abs(g1.pos.x - g2.pos.x), ((g1.size.y + g2.size.y)/2) - abs(g1.pos.y - g2.pos.y));
  }
  PVector GetOverlap(PVector g1, GameObject g2)
  {
    return new PVector(((playerSize.x + g2.size.x)/2) - abs(g1.x - g2.pos.x), ((playerSize.y + g2.size.y)/2) - abs(g1.y - g2.pos.y));
  }

  void SetXCoordinate(GameObject p, GameObject obj)
  {
    p.pos.x = obj.pos.x + ((p.pos.x-obj.pos.x)/abs(p.pos.x-obj.pos.x))*((obj.size.x+p.size.x)/2);
  }
  void SetYCoordinate(GameObject p, GameObject obj)
  {
    p.pos.y = obj.pos.y + ((p.pos.y-obj.pos.y)/abs(p.pos.y-obj.pos.y))*((obj.size.y+p.size.y)/2);
  }
}

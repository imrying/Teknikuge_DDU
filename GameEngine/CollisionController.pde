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
        //} else
        //{
        //  if (overlap.x > overlap.y)
        //  {
        //    if (p[i].vel.y > 0)
        //    {
        //      collisionArray[i] = 1; //allow jumping
        //    }
        //    p[i].vel.y = 0;
        //    SetYCoordinate(p[i], obj);
        //    collisionArray[i] = 1; //allow jumping
        //  } else
        //  {
        //    print("Case 4");
        //    SetXCoordinate(p[i], obj);
        //    p[i].vel.x = 0;
        //  }
        //}
        prevOverlap = GetOverlap(p[i], obj);
      }
      prevpos[i].x = p[i].pos.x;
      prevpos[i].y = p[i].pos.y;
    }

    //  int f1 = HandleCollision(p1, obj, gravityP1);
    //  int f2 = HandleCollision(p2, obj, gravityP2);

    //  if  (f1 == 1)
    //  {
    //    collisionArray[0] = 1;
    //  } else if  (f1 != 0)
    //  {
    //    collisionArray[2] = f1-5;
    //  }

    //  if  (f2 == 1)
    //  {
    //    collisionArray[1] = 1;
    //  } else if  (f2 != 0)
    //  {
    //    collisionArray[3] = f2-5;
    //  }
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

  //  int HandleCollision(GameObject p, GameObject obj, PVector g)
  //  {
  //    int collisionStatus = Collide(p.pos.x, p.pos.y, obj.pos.x, obj.pos.y, p.size.x, p.size.y, obj.size.x, obj.size.y);

  //    if (collisionStatus == 0)
  //    {
  //      return 0;
  //    }

  //    if (obj.id == 3)
  //    {
  //      gravityButton = obj;
  //      return obj.direction + 5;
  //    }



  //    if (collisionStatus == -1)
  //    {
  //      p.vel.x =0; //hvornår skal dette ske?
  //      if (p.pos.x < obj.pos.x)
  //      {
  //        p.pos.x = obj.pos.x - ((p.size.x + obj.size.x)/2);
  //        if (g.x > 0)
  //        {
  //          return 1;
  //        }
  //      } else if (p.pos.x > obj.pos.x)
  //      {
  //        p.pos.x = obj.pos.x + ((p.size.x + obj.size.x)/2);
  //        if (g.x < 0)
  //        {
  //          return 1;
  //        }
  //      }
  //    } else if (collisionStatus == 1)
  //    {
  //      p.vel.y =0; //hvornår skal dette ske?
  //      if (p.pos.y < obj.pos.y)
  //      {
  //        p.pos.y = obj.pos.y - ((p.size.y + obj.size.y)/2);
  //        if (g.y > 0)
  //        {
  //          return 1;
  //        }
  //      } else if (p.pos.y > obj.pos.y)
  //      {
  //        p.pos.y = obj.pos.y + ((p.size.y + obj.size.y)/2);
  //        if (g.y < 0)
  //        {
  //          return 1;
  //        }
  //      }
  //    }
  //    return 0;
  //  }

  //  int Collide(float x1, float y1, float x2, float y2, float r1x, float r1y, float r2x, float r2y)
  //  {
  //    float deltaX = abs(x1 - x2) - ((r1x + r2x)/2); //kollision hvis deltaX er negativ
  //    float deltaY = abs(y1 - y2) - ((r1y + r2y)/2);

  //    if (deltaX > 0 || deltaY > 0)
  //    {
  //      return 0;
  //    }
  //    return (deltaX < deltaY) ? 1 : -1;
  //  }
}

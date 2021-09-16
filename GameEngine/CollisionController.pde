class CollisionController
{
  GameObject gravityButton;
  CollisionController()
  {
  }

  int[] collisionCheck(ArrayList<GameObject> gameObjects, GameObject p1, GameObject p2, PVector gravityP1, PVector gravityP2)
  {
    int[] collisionArray = new int[4];
    for (GameObject obj : gameObjects)
    {
      if (obj.getClass().getName() == "GameEngine$Player")
      {
        continue;
      }
      int f1 = HandleCollision(p1, obj, gravityP1);
      int f2 = HandleCollision(p2, obj, gravityP2);

      if  (f1 == 1)
      {
        collisionArray[0] = 1;
      } else if  (f1 != 0)
      {
        collisionArray[2] = f1-5;
      }

      if  (f2 == 1)
      {
        collisionArray[1] = 1;
      } else if  (f2 != 0)
      {
        collisionArray[3] = f2-5;
      }
    }
    return collisionArray;
  }

  int HandleCollision(GameObject p, GameObject obj, PVector g)
  {
    int collisionStatus = Collide(p.pos.x, p.pos.y, obj.pos.x, obj.pos.y, p.size.x, p.size.y, obj.size.x, obj.size.y);

    if (collisionStatus == 0)
    {
      return 0;
    }

    if (obj.id == 3)
    {
      gravityButton = obj;
      return obj.direction + 5;
    }



    if (collisionStatus == -1)
    {
      p.vel.x =0; //hvornår skal dette ske?
      if (p.pos.x < obj.pos.x)
      {
        p.pos.x = obj.pos.x - ((p.size.x + obj.size.x)/2);
        if (g.x > 0)
        {
          return 1;
        }
      } else if (p.pos.x > obj.pos.x)
      {
        p.pos.x = obj.pos.x + ((p.size.x + obj.size.x)/2);
        if (g.x < 0)
        {
          return 1;
        }
      }
    } else if (collisionStatus == 1)
    {
      p.vel.y =0; //hvornår skal dette ske?
      if (p.pos.y < obj.pos.y)
      {
        p.pos.y = obj.pos.y - ((p.size.y + obj.size.y)/2);
        if (g.y > 0)
        {
          return 1;
        }
      } else if (p.pos.y > obj.pos.y)
      {
        p.pos.y = obj.pos.y + ((p.size.y + obj.size.y)/2);
        if (g.y < 0)
        {
          return 1;
        }
      }
    }
    return 0;
  }

  int Collide(float x1, float y1, float x2, float y2, float r1x, float r1y, float r2x, float r2y)
  {
    float deltaX = abs(x1 - x2) - ((r1x + r2x)/2); //kollision hvis deltaX er negativ
    float deltaY = abs(y1 - y2) - ((r1y + r2y)/2);

    if (deltaX > 0 || deltaY > 0)
    {
      return 0;
    }
    return (deltaX < deltaY) ? 1 : -1;
  }
}

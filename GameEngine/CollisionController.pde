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
      if (obj.id == 1)
      {
        continue;
      }
      int[] p1col = HandleCollision(p1, gravityP1, obj, 0);
      int[] p2col = HandleCollision(p2, gravityP2, obj, 1);

      if (p1col[0] != 0)
      {
        print("#####################################################");
        collisionArray[0] = p1col[0];
      }
      if (p1col[1] != 0)
      {
        print("#####################################################");
        collisionArray[2] = p1col[1];
      }
      if (p2col[0] != 0)
      {
        print("#####################################################");
        collisionArray[1] = p2col[0];
      }
      if (p2col[1] != 0)
      {
        print("#####################################################");
        collisionArray[3] = p2col[1];
      }
    }
    println(collisionArray[0], collisionArray[1], collisionArray[2], collisionArray[3]);
    return collisionArray;
  }

  int[] HandleCollision(GameObject p, PVector g, GameObject obj, int player)
  {
    int[] collisionArray = new int[2];

    int collisionStatus = Collide(p.pos.x, p.pos.y, obj.pos.x, obj.pos.y, p.size.x, p.size.y, obj.size.x, obj.size.y);

    if (collisionStatus == 0) //no collision occured
    {
      return collisionArray;
    }

    if (obj.id == 3) // if collision with gravityButton
    {
      collisionArray[1] = obj.direction;
      gravityButton = obj;
      return collisionArray;
    }
    if (collisionStatus == -1) //Collision in x-direction
    {
      print("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
      if ((p.pos.x < obj.pos.x && g.x >= 0) || (p.pos.x > obj.pos.x && g.x < 0)) //ovenpå objekt tyngde nedaf
      {
        p.vel.x = 0;
        collisionArray[0] = 1; //allow jumping
      }
    }

    if (collisionStatus == 1) //collision in y-direction
    {
      print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
      if ((p.pos.y < obj.pos.y && g.y > 0) || (p.pos.y > obj.pos.y && g.y < 0)) //ovenpå objekt tyngde nedaf
      {
        p.vel.x = 0;
        collisionArray[0] = 1; //allow jumping
      }
    }
    return collisionArray;
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

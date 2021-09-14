class CollisionController
{
  CollisionController() {
  }

  void collisionCheck(ArrayList<GameObject> gameObjects, GameObject p1, GameObject p2)
  {
    for (GameObject obj : gameObjects)
    {
      if (obj.getClass().getName() == "GameEngine$Player")
      {
        continue;
      }
      
      int p1col = Collide(p1.pos.x, p1.pos.y, obj.pos.x, obj.pos.y, p1.size.x, p1.size.y, obj.size.x, obj.size.y);
      int p2col = Collide(p2.pos.x, p2.pos.y, obj.pos.x, obj.pos.y, p2.size.x, p2.size.y, obj.size.x, obj.size.y);
      if (p1col == -1)
      {
        if (p1.pos.x < obj.pos.x)
        {
          p1.pos.x = obj.pos.x - ((p1.size.x + obj.size.x)/2);
        } else
        {
          p1.pos.x = obj.pos.x + ((p1.size.x + obj.size.x)/2);
        }
      } else if (p1col == 1)
      {
        if (p1.pos.y < obj.pos.y)
        {
          p1.pos.y = obj.pos.y - ((p1.size.y + obj.size.y)/2);
        } else
        {
          p1.pos.y = obj.pos.y + ((p1.size.y + obj.size.y)/2);
        }
      }

      if (p2col == 1)
      {
        if (p2.pos.x < obj.pos.x)
        {
          p2.pos.x = obj.pos.x - ((p2.size.x + obj.size.x)/2);
        } else
        {
          p2.pos.x = obj.pos.x + ((p2.size.x + obj.size.x)/2);
        }
      }
      if (p2col == -1)
      {
        if (p2.pos.y < obj.pos.y)
        {
          p2.pos.y = obj.pos.y - ((p2.size.y + obj.size.y)/2);
        } else
        {
          p2.pos.y = obj.pos.y + ((p2.size.y + obj.size.y)/2);
        }
      }
    }
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

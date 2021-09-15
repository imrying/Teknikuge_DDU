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

      int p1col = Collide(p1.pos.x, p1.pos.y, obj.pos.x, obj.pos.y, p1.size.x, p1.size.y, obj.size.x, obj.size.y);
      int p2col = Collide(p2.pos.x, p2.pos.y, obj.pos.x, obj.pos.y, p2.size.x, p2.size.y, obj.size.x, obj.size.y);

      if (p1col == -1)
      {
        if (obj.id == 3)
        {
          gravityButton = obj;
          collisionArray[2] = obj.direction;
        } else
        {
          p1.vel.x = 0;
        }
        if (p1.pos.x < obj.pos.x)
        {
          if (gravityP1.x > 0) {
            collisionArray[0] = 1;
          }

          p1.pos.x = obj.pos.x - ((p1.size.x + obj.size.x)/2);
        } else
        {
          if (gravityP1.x < 0) {

            collisionArray[0] = 1;
          }
          p1.pos.x = obj.pos.x + ((p1.size.x + obj.size.x)/2);
        }
      } else if (p1col == 1)
      {
        if (obj.id == 3)
        {
          gravityButton = obj;
          collisionArray[2] = obj.direction;
        } else
        {
          p1.vel.y = 0;
        }

        if (p1.pos.y < obj.pos.y)
        {
          if (gravityP1.y > 0) {

            collisionArray[0] = 1;
          }
          p1.pos.y = obj.pos.y - ((p1.size.y + obj.size.y)/2);
        } else
        {
          if (gravityP1.y < 0) {
            collisionArray[0] = 1;
          }
          p1.pos.y = obj.pos.y + ((p1.size.y + obj.size.y)/2);
        }
      }

      if (p2col == -1)
      {
        if (obj.id == 3)
        {
          gravityButton = obj;
          collisionArray[3] = obj.direction;
        } else {
          p2.vel.x = 0;
        }
        if (p2.pos.x < obj.pos.x)
        {
          if (gravityP2.x > 0) {

            collisionArray[1] = 1;
          }
          p2.pos.x = obj.pos.x - ((p2.size.x + obj.size.x)/2);
        } else
        {
          if (gravityP2.x < 0) {

            collisionArray[1] = 1;
          }
          p2.pos.x = obj.pos.x + ((p2.size.x + obj.size.x)/2);
        }
      } else if (p2col == 1)
      {
        if (obj.id == 3)
        {
          gravityButton = obj;
          collisionArray[3] = obj.direction;
        } else {
          p2.vel.y = 0;
        }
        if (p2.pos.y < obj.pos.y)
        {
          if (gravityP2.y > 0) {

            collisionArray[1] = 1;
          }
          p2.pos.y = obj.pos.y - ((p2.size.y + obj.size.y)/2);
        } else
        {
          if (gravityP2.x < 0) {
            collisionArray[1] = 1;
          }
          p2.pos.y = obj.pos.y + ((p2.size.y + obj.size.y)/2);
        }
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

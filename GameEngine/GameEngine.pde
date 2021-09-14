Gameengine gameengine;

void setup()
{
   gameengine = new Gameengine();
}

void draw()
{
  gameengine.main();
}

class Gameengine
{
  GameObject[] gameObjects;
  PVector gravityP1, gravityP2;
  float pace;
  
  Gameengine(){}
  
  void main()
  {
    for (GameObject obj : gameObjects)
    {
      obj.update();
    }
  }
  
  void restartLevel()
  {
    //empty for now
  }
}

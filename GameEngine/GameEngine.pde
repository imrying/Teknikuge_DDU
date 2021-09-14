Gameengine gameengine;

void setup()
{
  size(100,100);
  gameengine = new Gameengine();
}

void draw()
{
  gameengine.main();
}

class Gameengine
{
  GameObject[] gameObjects;

  InputController inputController;

  PVector gravityP1, gravityP2;
  float pace;

  Gameengine()
  {
    inputController = new InputController();
  }

  void main()
  {
    for (GameObject obj : gameObjects)
    {
      if (obj.getClass().getName() == "Player")
      {
        obj.update(inputController.getInputs(true), pace);
      }
    }
  }
  
  void restartLevel()
  {
    //empty for now
  }
}

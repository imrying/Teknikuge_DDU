Gameengine gameengine;

void setup()
{
  size(1000, 1000);
  gameengine = new Gameengine();
}

void draw()
{
  gameengine.head();
}

class Gameengine
{
  ArrayList<GameObject> gameObjects;

  InputController inputController;

  PVector gravityP1, gravityP2;
  float pace;

  Gameengine()
  {
    inputController = new InputController();
    gameObjects = new ArrayList<GameObject>();
    gameObjects.add(new Wall(700, 500, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Player(500,500,100,color(255,0,0)));
    pace = 1;
    
  }

  void head()
  {
    background(255);
    
    for (GameObject obj : gameObjects)
    {
      obj.update(inputController.getInputs(true), pace);
      obj.render();
    }
  }

  void restartLevel()
  {
    //empty for now
  }
}

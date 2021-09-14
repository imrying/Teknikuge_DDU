Gameengine gameengine;

class Gameengine
{
  ArrayList<GameObject> gameObjects;
  Boolean state;

  InputController inputController;

  PVector gravityP1, gravityP2;
  float pace;

  Gameengine()
  {
    inputController = new InputController();
    gameObjects = new ArrayList<GameObject>();
    gameObjects.add(new Wall(700, 500, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Player(500, 500, 100, color(255, 0, 0)));
    gameObjects.add(new Player(600, 500, 100, color(0, 255, 0)));
    state = true;

    pace = 1;
  }

  void head()
  {
    background(255);

    for (GameObject obj : gameObjects)
    {
      if (obj.getClass().getName() == "GameEngine$Player") {
        obj.update(inputController.getInputs(state), pace);
        state = !state;
        
        
      } else {
        obj.update(inputController.getInputs(true), pace);
      }
      obj.render();
    }
  }

  void restartLevel()
  {
    //empty for now
  }
}



void setup()
{
  size(1000, 1000);
  gameengine = new Gameengine();
}

void draw()
{
  gameengine.head();
}

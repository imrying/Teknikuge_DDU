Gameengine gameengine;

class Gameengine
{
  ArrayList<GameObject> gameObjects;
  Boolean state;

  InputController inputController;
  CollisionController collisionController;

  PVector gravityP1, gravityP2;
  float pace;

  Gameengine()
  {
    inputController = new InputController();
    collisionController = new CollisionController();
    
    gameObjects = new ArrayList<GameObject>();
    
    gameObjects.add(new Player(0, 0, 100, color(0)));
    gameObjects.add(new Player(0, 0, 100, color(255, 0, 0)));
    
    gameObjects.add(new Wall(700, 500, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Wall(100, 300, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Wall(900, 700, 250, 50, color(255, 255, 0)));

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
    }
    
    collisionController.collisionCheck(gameObjects, gameObjects.get(0), gameObjects.get(1));
    for (GameObject obj : gameObjects)
    {
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

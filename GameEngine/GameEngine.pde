Gameengine gameengine;

class Gameengine
{
  InputController inputController;
  CollisionController collisionController;

  ArrayList<GameObject> gameObjects;
  int[] collisionArray;

  PVector gravityP1, gravityP2;
  Boolean state = true;
  float pace = 1;


  Gameengine()
  {
    inputController = new InputController();
    collisionController = new CollisionController();

    gameObjects = new ArrayList<GameObject>();
    collisionArray = new int[4];

    gravityP1 = new PVector(0, 0.5);
    gravityP2 = new PVector(0, 0.5);

    gameObjects.add(new Player(0, 0, 100, color(0)));
    gameObjects.add(new Player(0, 0, 100, color(255, 0, 0)));

    gameObjects.add(new Wall(700, 500, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Wall(100, 300, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Wall(900, 700, 250, 50, color(255, 255, 0)));
    gameObjects.add(new GameObject(500, 1000, 1000, 50, color(255, 255, 0)));
    gameObjects.add(new GravityButton(800, 800, 50, 50, color(0, 255, 0), 3));
  }

  void head()
  {
    background(255);

    for (GameObject obj : gameObjects)
    {
      if (obj.id == 1) {
        if (state)
        {
          obj.update(inputController.getInputs(state, gravityP1, gravityP1), pace, gravityP1.x, gravityP1.y, collisionArray[0]);
        } else
        {
          obj.update(inputController.getInputs(state, gravityP1, gravityP2), pace, gravityP2.x, gravityP2.y, collisionArray[1]);
        }
        state = !state;
      }
      else
      {
        obj.update(inputController.getInputs(true, gravityP1, gravityP2), pace, 0, 0);
      }
    }

    collisionArray = collisionController.collisionCheck(gameObjects, gameObjects.get(0), gameObjects.get(1), gravityP1, gravityP2);
    
    if ((collisionArray[2] != 0) || (collisionArray[3] != 0))
    {
      gameObjects.remove(collisionController.gravityButton);
    }
    
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
  size(1920, 1080);
  gameengine = new Gameengine();
}

void draw()
{
  gameengine.head();
}

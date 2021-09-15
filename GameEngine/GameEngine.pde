Gameengine gameengine;

class Gameengine
{
  ArrayList<GameObject> gameObjects;
  Boolean state;

  InputController inputController;
  CollisionController collisionController;
  LevelGenerator levelGenerator;

  PVector gravityP1, gravityP2;
  float pace;

  boolean[] collisionArray;

  Gameengine()
  {
    gravityP1 = new PVector(0, 0.5);
    gravityP2 = new PVector(0, 0.5);
    inputController = new InputController();
    collisionController = new CollisionController();

    gameObjects = new ArrayList<GameObject>();
    levelGenerator = new LevelGenerator();
    
    
    

    gameObjects.add(new Player(100, 100, 75, color(0)));
    gameObjects.add(new Player(100, height/2+100, 75, color(255, 0, 0)));
    gameObjects.addAll(levelGenerator.generateLevel());
    println(gameObjects);

    collisionArray = new boolean[2];

    gameObjects.add(new Wall(700, 500, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Wall(100, 300, 250, 50, color(255, 255, 0)));
    gameObjects.add(new Wall(900, 700, 250, 50, color(255, 255, 0)));
    gameObjects.add(new GameObject(width/2, height-10, width, 20, color(0, 0, 0)));
    gameObjects.add(new GameObject(width/2, height/2, width, 40, color(0, 0, 0)));
    gameObjects.add(new GameObject(width/2, 10, width, 20, color(0, 0, 0)));


    gameObjects.add(new GravityButton(800,800, 50, 50, color(0, 255, 0), 3));



    state = true;
    pace = 1;
  }

  void head()
  {
    background(255);


    for (GameObject obj : gameObjects)
    {
      if (obj.getClass().getName() == "GameEngine$Player") {
        if (state) {
          obj.update(inputController.getInputs(state, gravityP1, gravityP1), pace, gravityP1.x, gravityP1.y, collisionArray[0]);
        } else {
          obj.update(inputController.getInputs(state, gravityP1, gravityP2), pace, gravityP2.x, gravityP2.y, collisionArray[1]);
        }
        state = !state;
      } else {
        obj.update(inputController.getInputs(true, gravityP1, gravityP2), pace, 0, 0);
      }
    }

    collisionArray = collisionController.collisionCheck(gameObjects, gameObjects.get(0), gameObjects.get(1), gravityP1, gravityP2);

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

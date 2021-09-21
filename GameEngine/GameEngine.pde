import java.util.Iterator;

Gameengine gameengine;

class Gameengine
{
  InputController inputController;
  CollisionController collisionController;
  GravityController gravityController;
  LevelGenerator levelGenerator;
  ScoreController scoreController;
  SoundController soundController;

  boolean gameStarted = false; 

  ArrayList<GameObject> gameObjects;
  int[] collisionArray;

  PVector[] gravitys;
  GameObject[] players;
  boolean state = true;
  float pace = 0;
  float speed = 3.5;
  boolean dead = false;

  GameObject removeObject;


  Gameengine()
  {
    noStroke();
    inputController = new InputController();
    gravityController = new GravityController();
    scoreController = new ScoreController();
    soundController = new SoundController();

    gravitys = new PVector[2];
    gameObjects = new ArrayList<GameObject>();
    players = new GameObject[2];

    gameObjects.add(new Player(500, 100, 75, color(0, 255, 0), speed, true));
    gameObjects.add(new Player(500, height/2+100, 75, color(255, 0, 0), speed, true));
    players[0] = gameObjects.get(0);
    players[1] = gameObjects.get(1);

    collisionController = new CollisionController(gameObjects.get(0).pos, gameObjects.get(1).pos, gameObjects.get(1).size.x);


    levelGenerator = new LevelGenerator();




    gravitys[0] = new PVector(0, 0.5);
    gravitys[1] = new PVector(0, 0.5);

    collisionArray = new int[2];

    gameObjects.add(new GameObject(width/2, height-10, width, 20, color(0, 0, 0)));
    gameObjects.add(new GameObject(width/2, height/2, width, 40, color(0, 0, 0)));
    gameObjects.add(new GameObject(width/2, 10, width, 20, color(0, 0, 0)));
  }

  void head()
  {
    background(255);

    gameObjects.addAll(levelGenerator.update(pace));

    Iterator<GameObject> itr = gameObjects.iterator();


    while (itr.hasNext())
    {
      GameObject obj = itr.next();
      if (obj.id == 1) {
        if (state)
        {
          obj.update(inputController.getInputs(state, gravitys[0], gravitys[1]), pace, gravitys[0].x, gravitys[0].y, collisionArray[0], soundController);
        } else
        {
          obj.update(inputController.getInputs(state, gravitys[0], gravitys[1]), pace, gravitys[1].x, gravitys[1].y, collisionArray[1], soundController);
        }
        state = !state;
      } else
      {
        if (obj.pos.x < -900) {
          itr.remove();
        }
        obj.update(inputController.getInputs(true, gravitys[0], gravitys[1]), pace, 0, 0);
      }
    }


    collisionArray = collisionController.collisionCheck(gameObjects, players, gravitys);

    if (collisionArray[2] != 0 || collisionArray[3] != 0)
    {
      soundController.playSound(1);
      gravitys = gravityController.changeGravity(collisionArray[2], collisionArray[3], gravitys[1], gravitys[0]);
      if (collisionArray[2] != 0)
      {
        gameObjects.get(1).vel = new PVector(0, 0);
      }
      if (collisionArray[3] != 0)
      {
        gameObjects.get(0).vel = new PVector(0, 0);
      }
    }

    if ((collisionArray[2] != 0) || (collisionArray[3] != 0))
    {
      gameObjects.remove(collisionController.gravityButton);
    }

    for (GameObject obj : gameObjects)
    {
      obj.render();
    }


    if (!dead && gameStarted) {
      pace = scoreController.update();
      gameObjects.get(0).speed = speed*pace;
      gameObjects.get(1).speed = speed*pace;
    }
    scoreController.render();


    if (inputController.restartInput()==true) {
      restartLevel();
    }

    if (gameObjects.get(0).pos.x < -37.5 || gameObjects.get(1).pos.x < -37.5 || gameObjects.get(0).pos.x > width + 137.5 || gameObjects.get(1).pos.x > width + 137.5) {
      gameOver();
      dead = true;
    }

    if ((gameObjects.get(0).pos.x > width/3 || gameObjects.get(1).pos.x > width/3) && gameStarted == false) {
      gameStarted = true;
      pace = 1;
    }
  }

  void gameOver()
  {
    gameObjects.get(0).speed = 0;
    gameObjects.get(1).speed = 0;

    pace =0;
    textSize(100);
    fill(0);
    text("GAME OVER", width/2-200, height/2-200);
    textSize(50);
    text("PRESS R TO RESTART", width/2-100, height/2-100);
  }

  void restartLevel()
  {
    speed = 3;
    pace = 0;
    gameObjects = new ArrayList<GameObject>();
    gameObjects.add(new Player(500, 100, 75, color(0, 255, 0), speed, true));
    gameObjects.add(new Player(500, height/2+100, 75, color(255, 0, 0), speed, true));
    players[0] = gameObjects.get(0);
    players[1] = gameObjects.get(1);

    gameObjects.add(new GameObject(width/2, height-10, width, 20, color(0, 0, 0)));
    gameObjects.add(new GameObject(width/2, height/2, width, 40, color(0, 0, 0)));
    gravitys[0] = new PVector(0, 0.5);
    gravitys[1] = new PVector(0, 0.5);
    gameObjects.add(new GameObject(width/2, 10, width, 20, color(0, 0, 0)));
    levelGenerator.currentNode = -1;
    levelGenerator.pos = 0;
    scoreController.currentScore = 0;
    gameStarted = false;


    dead = false;
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

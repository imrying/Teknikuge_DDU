class LevelGenerator {


  ArrayList<ArrayList<GameObject>> prefabs;

  LevelGenerator() {

    prefabs = new ArrayList<ArrayList<GameObject>>();
    for (int i=0; i<5; i++) {
      prefabs.add(new ArrayList<GameObject>());
    }

    prefabs.get(0).add(generateWall(0, 0));
    prefabs.get(0).add(generateWall(0, 1));
    prefabs.get(0).add(generateWall(0, 2));
    prefabs.get(0).add(generateWall(0, 3));
    prefabs.get(1).add(generateWall(0, 4));
    prefabs.get(0).add(generateWall(0, 5));
    prefabs.get(0).add(generateWall(0, 6));
    prefabs.get(0).add(generateWall(0, 7));
    prefabs.get(0).add(generateWall(0, 8));
    prefabs.get(0).add(generateWall(0, 9));
  }

  GameObject generateWall(int n, int z) {
    int x = 50+(100*n);
    int y = 0;

    if (z>=5) {
      y=70+(100*z)+40;
    } else {
      y=70+(100*z);
    }
    println(y);
    return(new Wall(x+width, y, 100, 100, color(0,255,255)));
  }

  ArrayList<GameObject> generateLevel() {
    return(prefabs.get(int(random(prefabs.size()))));
  }
}

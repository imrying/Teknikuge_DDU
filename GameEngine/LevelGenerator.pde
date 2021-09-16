class LevelGenerator { //<>// //<>// //<>// //<>// //<>//


  ArrayList<ArrayList<GameObject>> prefabs;
  float pos = 0;
  int levelItem = 0;

  LevelGenerator() {

    prefabs = new ArrayList<ArrayList<GameObject>>();
    for (int i=0; i<5; i++) {
      prefabs.add(new ArrayList<GameObject>());
    }
    createWalls();
  }

  GameObject generateWall(int x, int y) {
    int xcoord = 50+(100*x);
    int ycoord = 70 + 100*y;
    ycoord += (y >= 5) ? 40 : 0;
    return new Wall(xcoord + width, ycoord, 100, 100, color(0, 255, 255));
  }

  GameObject generateWall(int x1, int y1, int x2, int y2) {
    int xcoord = 50+(100*((x1+x2)/2));
    int ycoord = 70 + (100*((y1+y2)/2));
    ycoord += (y2 >= 5) ? 40 : 0;

    return new Wall(xcoord+width, ycoord, (abs(x1-x2)+1)*100, (abs(y1-y2)+1)*100, color(0, 255, 255));
  }

  GameObject generateGravityButton(int x, int y, int dir)
  {
    int xcoord = 50+(100*x);
    int ycoord = 70 + 100*y;
    ycoord += (y >= 5) ? 40 : 0;
    return new GravityButton(xcoord + width, ycoord, 100, 100, color(0, 255, 255), dir);
  }

  ArrayList<GameObject> update(float pace) {
    pos -= pace;
    if (pos < 925) {
      pos = width;
      levelItem++;
      return prefabs.get(levelItem-1) ;
    } else {
      return prefabs.get(3);
    }
  }

  void createWalls() {
    prefabs.get(0).add(generateWall(5,2,5, 2));
        prefabs.get(0).add(generateWall(5,0,5, 0));

    prefabs.get(0).add(generateWall(1, 8, 1, 9));
    prefabs.get(0).add(generateWall(2, 0, 2, 3));
    prefabs.get(0).add(generateWall(7, 0));
    prefabs.get(0).add(generateWall(7, 4));
    prefabs.get(0).add(generateWall(7, 5));
    prefabs.get(0).add(generateWall(7, 9));



    //prefabs.get(0).add(generateWall(1, 5, 1, 6));
    //prefabs.get(0).add(generateWall(1, 5, 1, 6));
  }
}

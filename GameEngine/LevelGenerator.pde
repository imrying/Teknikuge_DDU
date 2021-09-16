class LevelGenerator { //<>// //<>// //<>// //<>//


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
    prefabs.get(0).add(generateWall(2, 0));
    prefabs.get(0).add(generateWall(2, 1));
    prefabs.get(0).add(generateWall(2, 2));
    prefabs.get(0).add(generateWall(2, 3));
    prefabs.get(0).add(generateWall(1, 5));
    prefabs.get(0).add(generateWall(1, 6));
    prefabs.get(0).add(generateWall(1, 8));
    prefabs.get(0).add(generateWall(1, 9));
    prefabs.get(0).add(generateWall(4, 4));
    prefabs.get(0).add(generateWall(4, 8));
    prefabs.get(0).add(generateWall(4, 9));
    prefabs.get(0).add(generateWall(5, 7));
    prefabs.get(0).add(generateWall(5, 8));
    prefabs.get(0).add(generateWall(5, 9));
    prefabs.get(0).add(generateWall(6, 3));
    prefabs.get(0).add(generateWall(6, 4));
    prefabs.get(0).add(generateWall(7, 0));
    prefabs.get(0).add(generateWall(7, 2));
    prefabs.get(0).add(generateWall(7, 3));
    prefabs.get(0).add(generateWall(7, 4));
    prefabs.get(0).add(generateWall(7, 5));
    prefabs.get(0).add(generateWall(7, 6));
    prefabs.get(0).add(generateWall(8, 0));
    prefabs.get(0).add(generateWall(8, 2));
    prefabs.get(0).add(generateWall(8, 3));
    prefabs.get(0).add(generateWall(8, 4));
    prefabs.get(0).add(generateWall(8, 8));
    prefabs.get(0).add(generateWall(8, 9));
    prefabs.get(0).add(generateWall(9, 0));
    prefabs.get(0).add(generateWall(9, 2));
    prefabs.get(0).add(generateWall(9, 3));
    prefabs.get(0).add(generateWall(9, 4));
    ////////////////////////////////////////////////
    prefabs.get(1).add(generateWall(0, 3));
    prefabs.get(1).add(generateWall(0, 4));
    prefabs.get(1).add(generateWall(1, 4));    
    prefabs.get(1).add(generateWall(2, 8));    
    prefabs.get(1).add(generateWall(2, 9));    
    prefabs.get(1).add(generateWall(3, 0));    
    prefabs.get(1).add(generateWall(3, 1));    
    prefabs.get(1).add(generateWall(3, 3));    
    prefabs.get(1).add(generateWall(3, 4));
    prefabs.get(1).add(generateWall(3, 7));    
    prefabs.get(1).add(generateWall(3, 8));    
    prefabs.get(1).add(generateWall(3, 9));    
    prefabs.get(1).add(generateWall(5, 4));    
    prefabs.get(1).add(generateWall(6, 7));    
    prefabs.get(1).add(generateWall(6, 8));    
    prefabs.get(1).add(generateWall(6, 9));    
    prefabs.get(1).add(generateWall(6, 3));    
    prefabs.get(1).add(generateWall(6, 4));    
    prefabs.get(1).add(generateWall(6, 5));    
    prefabs.get(1).add(generateWall(7, 2));    
    prefabs.get(1).add(generateWall(7, 3));    
    prefabs.get(1).add(generateWall(7, 4));    
    prefabs.get(1).add(generateWall(7, 5));    
    prefabs.get(1).add(generateWall(7, 7));    
    prefabs.get(1).add(generateWall(7, 8));    
    prefabs.get(1).add(generateWall(7, 9)); 
    prefabs.get(1).add(generateWall(8, 7)); 
    prefabs.get(1).add(generateWall(8, 8)); 
    prefabs.get(1).add(generateWall(8, 9)); 
    prefabs.get(1).add(generateWall(8, 1));    
    prefabs.get(1).add(generateWall(8, 2));    
    prefabs.get(1).add(generateWall(8, 3));
    prefabs.get(1).add(generateWall(8, 4));    
    prefabs.get(1).add(generateWall(8, 5));    
    prefabs.get(1).add(generateWall(9, 5));
    ///////////////////////////////////////////
    prefabs.get(2).add(generateWall(0, 0));
    prefabs.get(2).add(generateWall(0, 1));
    prefabs.get(2).add(generateWall(0, 3));
    prefabs.get(2).add(generateWall(0, 4));
    prefabs.get(2).add(generateWall(0, 5));
    prefabs.get(2).add(generateWall(0, 6));
    prefabs.get(2).add(generateWall(0, 7));
    prefabs.get(2).add(generateWall(0, 8));
    prefabs.get(2).add(generateWall(2, 1));
    prefabs.get(2).add(generateWall(2, 8));
    prefabs.get(2).add(generateWall(2, 9));
    prefabs.get(2).add(generateWall(3, 1));
    prefabs.get(2).add(generateWall(3, 5));
    prefabs.get(2).add(generateWall(3, 6));
    prefabs.get(2).add(generateWall(4, 1));
    prefabs.get(2).add(generateWall(4, 2));
    prefabs.get(2).add(generateWall(4, 3));
    prefabs.get(2).add(generateWall(4, 4));
    prefabs.get(2).add(generateWall(5, 7));
    prefabs.get(2).add(generateWall(6, 1));
    prefabs.get(2).add(generateWall(7, 1));
    prefabs.get(2).add(generateWall(7, 3));
    prefabs.get(2).add(generateWall(7, 8));
    prefabs.get(2).add(generateWall(8, 1));
    prefabs.get(2).add(generateWall(8, 3));
    prefabs.get(2).add(generateWall(8, 5));
    prefabs.get(2).add(generateWall(9, 0));
    prefabs.get(2).add(generateWall(9, 1));
    prefabs.get(2).add(generateWall(9, 2));
    prefabs.get(2).add(generateWall(9, 3));
  }
}

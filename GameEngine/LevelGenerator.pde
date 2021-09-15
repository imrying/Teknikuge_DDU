class LevelGenerator { //<>//


  ArrayList<ArrayList<GameObject>> prefabs;

  LevelGenerator() {

    prefabs = new ArrayList<ArrayList<GameObject>>();
    for (int i=0; i<5; i++) {
      prefabs.add(new ArrayList<GameObject>());
    }

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
    prefabs.get(1).add(generateWall(3, 6));    
    prefabs.get(1).add(generateWall(3, 7));    
    prefabs.get(1).add(generateWall(3, 8));    
    prefabs.get(1).add(generateWall(3, 9));    

    prefabs.get(1).add(generateWall(5, 4));    
    prefabs.get(1).add(generateWall(5, 7));    
    prefabs.get(1).add(generateWall(5, 8));    
    prefabs.get(1).add(generateWall(5, 9));    
    prefabs.get(1).add(generateWall(6, 3));    
    prefabs.get(1).add(generateWall(6, 4));    
    prefabs.get(1).add(generateWall(6, 5));    
    prefabs.get(1).add(generateWall(6, 7));    
    prefabs.get(1).add(generateWall(6, 8));    
    prefabs.get(1).add(generateWall(6, 9));

    prefabs.get(1).add(generateWall(7, 2));    
    prefabs.get(1).add(generateWall(7, 3));    
    prefabs.get(1).add(generateWall(7, 4));    
    prefabs.get(1).add(generateWall(7, 5));    
    prefabs.get(1).add(generateWall(7, 7));    
    prefabs.get(1).add(generateWall(7, 8));    
    prefabs.get(1).add(generateWall(7, 9));    
    prefabs.get(1).add(generateWall(8, 1));    
    prefabs.get(1).add(generateWall(8, 2));    
    prefabs.get(1).add(generateWall(8, 3));
    prefabs.get(1).add(generateWall(8, 4));    
    prefabs.get(1).add(generateWall(8, 5));    
    prefabs.get(1).add(generateWall(9, 5));    
    prefabs.get(1).add(generateWall(9, 9));
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
    return(new Wall(x+width, y, 100, 100, color(0, 255, 255)));
  }

  ArrayList<GameObject> generateLevel() {
    return(prefabs.get(1));
  }
}

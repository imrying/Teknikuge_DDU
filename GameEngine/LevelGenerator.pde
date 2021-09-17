class LevelGenerator {  //<>// //<>// //<>//

  ArrayList<IntList> graph;

  float pos = 0;
  int currentNode = -1;

  LevelGenerator() {
    graph = new ArrayList<IntList>();

    for (int i=0; i<30; i++) {
      graph.add(new IntList());
    }
    createGraph();
    //createWalls();
  }

  GameObject generateWall(int x, int y) {
    color col;
    int xcoord = 50+(100*x);
    int ycoord = 70 + 100*y;
    ycoord += (y >= 5) ? 40 : 0;
    if (y>=5) {
      col=color(0,255, 0);
    } else {
      col = color(255,0, 0);
    }
    return new Wall(xcoord + width, ycoord, 100, 100, col);
  }


  GameObject generateWall(int x1, int y1, int x2, int y2) {
    color col;
    int xcoord = (100+100*(x1+x2))/2;
    int ycoord = (140+100*(y1+y2))/2;
    ycoord += (y2 >= 5) ? 40 : 0;
    if (y1>=5) {
      col=color(0,255, 0);
    } else {
      col = color(255,0, 0);
    }

    return new Wall(xcoord+width, ycoord, (abs(x1-x2)+1)*100, (abs(y1-y2)+1)*100, col);
  }

  GameObject generateGravityButton(int x, int y, int dir)
  {
    int xcoord = 50+(100*x);
    int ycoord = 70 + 100*y;
    ycoord += (y >= 5) ? 40 : 0;
    return new GravityButton(xcoord + width, ycoord, 50, 50, color(0, 255, 0), dir);
  }

  ArrayList<GameObject> update(float pace) {
    pos -= pace;

    if (pos < 925) {
      pos = width;

      if (currentNode == -1) {
        currentNode = 0;
        return ReturnPrefab(0);
      } else {
        IntList connections = graph.get(currentNode);
        int randomConnection = int(random(connections.size()));

        currentNode = connections.get(randomConnection);
        println(currentNode);
        return ReturnPrefab(currentNode);
      }
    } else {
      return new ArrayList<GameObject>();
    }
  }

  void createGraph() {
    graph.get(0).append(1);
    graph.get(1).append(3);
    graph.get(1).append(2);
    graph.get(2).append(4);
    graph.get(3).append(5);
    graph.get(3).append(7);
    graph.get(4).append(0);
    graph.get(5).append(0);
    graph.get(6).append(0);
    graph.get(7).append(0);
  }

  ArrayList<GameObject> ReturnPrefab(int id) {
    ArrayList<GameObject> prefab = new ArrayList<GameObject>();

    if (id == 0)
    {
      prefab.add(generateWall(1, 5, 1, 6));
      prefab.add(generateWall(1, 8, 1, 9));
      prefab.add(generateWall(2, 0, 2, 3));
      prefab.add(generateWall(4, 4));
      prefab.add(generateWall(4, 8, 5, 9));
      prefab.add(generateWall(5, 7));
      prefab.add(generateWall(6, 3, 6, 4));
      prefab.add(generateWall(7, 2, 9, 4));
      prefab.add(generateWall(7, 0, 9, 0));
      prefab.add(generateWall(7, 5, 7, 6));
      prefab.add(generateWall(8, 8, 9, 9));
    } else if (id == 1)
    {
      prefab.add(generateWall(0, 3, 0, 4));
      prefab.add(generateWall(1, 4));
      prefab.add(generateWall(3, 0, 3, 1));
      prefab.add(generateWall(3, 3, 3, 4));
      prefab.add(generateWall(2, 8, 3, 9));
      prefab.add(generateWall(6, 7, 8, 9));
      prefab.add(generateWall(6, 5, 9, 5));
      prefab.add(generateWall(5, 4, 8, 4));
      prefab.add(generateWall(6, 3, 8, 3));
      prefab.add(generateWall(7, 2, 8, 2));    
      prefab.add(generateWall(8, 1));
    } else if (id == 2)
    {
      prefab.add(generateGravityButton(0, 2, 3));
      prefab.add(generateGravityButton(0, 9, 4));
      prefab.add(generateWall(0, 0, 0, 1));    
      prefab.add(generateWall(0, 3, 0, 4));    
      prefab.add(generateWall(0, 5, 0, 8));    
      prefab.add(generateWall(2, 1, 4, 1));    
      prefab.add(generateWall(4, 2, 4, 4));     
      prefab.add(generateWall(3, 5, 3, 6));     
      prefab.add(generateWall(2, 8, 2, 9));     
      prefab.add(generateWall(5, 7));     
      prefab.add(generateWall(7, 8));  
      prefab.add(generateWall(9, 9));     
      prefab.add(generateWall(6, 1, 8, 1));     
      prefab.add(generateWall(7, 3, 8, 3));     
      prefab.add(generateWall(9, 0, 9, 3));
    } else if (id == 3)
    {
      prefab.add(generateGravityButton(1, 2, 1));
      prefab.add(generateWall(1, 3));  
      prefab.add(generateWall(3, 2));  
      prefab.add(generateWall(9, 4));  
      prefab.add(generateWall(2, 6, 2, 9));  
      prefab.add(generateWall(4, 5, 5, 5));  
      prefab.add(generateWall(5, 6));  
      prefab.add(generateWall(5, 2, 6, 2));  
      prefab.add(generateWall(6, 3, 6, 4));  
      prefab.add(generateWall(7, 5, 9, 7));  
      prefab.add(generateWall(8, 9, 9, 9));
    } else if (id == 4)
    {
      prefab.add(generateGravityButton(8, 1, 2));
      prefab.add(generateGravityButton(8, 9, 2));
      prefab.add(generateWall(2, 0));  
      prefab.add(generateWall(8, 0));  
      prefab.add(generateWall(0, 6));  
      prefab.add(generateWall(2, 5));  
      prefab.add(generateWall(4, 6));
      prefab.add(generateWall(6,5));
      prefab.add(generateWall(2, 2));  
      prefab.add(generateWall(1, 3, 3, 3));  
      prefab.add(generateWall(4, 2, 4, 4));  
      prefab.add(generateWall(6, 1, 6, 2));  
      prefab.add(generateWall(7, 2, 9, 2));  
      prefab.add(generateWall(8, 3, 9, 3));  
      prefab.add(generateWall(9, 4));  
      prefab.add(generateWall(9, 5, 9, 8));  
      prefab.add(generateWall(7, 7, 7, 9));
    } else if (id == 5)
    {
      prefab.add(generateWall(0, 1, 0, 4));
      prefab.add(generateWall(0, 5, 0, 7));
      prefab.add(generateWall(0, 9));
      prefab.add(generateWall(1, 5));
      prefab.add(generateWall(3, 0, 4, 1));
      prefab.add(generateWall(4, 2, 4, 3));
      prefab.add(generateWall(4, 5, 5, 7));
      prefab.add(generateWall(5, 8));
      prefab.add(generateWall(6, 1, 6, 4));
      prefab.add(generateWall(7, 6, 7, 9));
      prefab.add(generateWall(8, 0, 9, 3));
      prefab.add(generateWall(9, 5, 9, 8));
      prefab.add(generateGravityButton(0, 8, 1));
      prefab.add(generateGravityButton(7, 1, 2));
      prefab.add(generateGravityButton(8, 6, 2));
    } else if (id == 6)
    {
      prefab.add(generateWall(2, 2, 2, 4));
      prefab.add(generateWall(1, 4));
      prefab.add(generateWall(2, 5, 2, 6));
      prefab.add(generateWall(4, 5, 4, 7));
      prefab.add(generateWall(8, 5, 8, 8));
      prefab.add(generateWall(5, 2, 9, 2));
      prefab.add(generateWall(8, 3, 9, 4));
      prefab.add(generateGravityButton(7, 1, 2));
    } else if (id == 7)
    {
      prefab.add(generateWall(1, 3, 1, 4));
      prefab.add(generateWall(2, 5, 2, 6));
      prefab.add(generateWall(3, 2));
      prefab.add(generateWall(3, 7));
      prefab.add(generateWall(6, 1, 6, 4));
      prefab.add(generateWall(7, 7, 9, 7));    
      prefab.add(generateWall(9, 2, 9, 4));
      prefab.add(generateWall(9, 5, 9, 6));
      prefab.add(generateGravityButton(5, 4, 2));
    }
    return prefab;
  }
}

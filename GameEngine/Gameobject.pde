class GameObject
{
  PVector pos;
  GameObject() {
  }
  void update(boolean[] inputs, float pace) {
  }
  void render() {
  }
}

class Wall extends GameObject
{
  PVector position;
  PVector size;
  color c;

  Wall(float posX, float posY, int sizeX, int sizeY, color col)
  {
    position = new PVector(posX, posY);
    size = new PVector(sizeX, sizeY);
    c = col;
  }


  void update(float pace)
  
  {
    position.x = position.x - pace;
  }


  void render()
  {
    rect(position.x, position.y, size.x, size.y, c);
  }
}

class Player extends GameObject
{
  float size;
  Player(float x, float y, float size)
  {
    pos = new PVector(x, y);
    this.size = size;
  }
  
  @Override
  void update(boolean[] inputs, float pace)
  {
    pos.y -= inputs[0] ? pace : 0;
    pos.y += inputs[0] ? pace : 0;
    pos.x -= inputs[0] ? pace : 0;
    pos.x += inputs[0] ? pace : 0;
  }

  void render()
  {
    rect(pos.x, pos.y, size, size);
  }

  void collisionDetection()
  {
    
  }
}

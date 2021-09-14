class GameObject
{
  PVector pos;
  GameObject() {
  }
  void update() {
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

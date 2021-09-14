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
  
  @Override
    void update(boolean[] inputs, float pace)
  {
    position.x -= pace;
  }

  @Override
    void render()
  {
    fill(c);
    rect(position.x, position.y, size.x, size.y);
  }
}

class Player extends GameObject
{
  float size;
  color col;
  Player(float x, float y, float size, color col)
  {
    pos = new PVector(x, y);
    this.size = size;
    this.col = col;
  }

  @Override
    void update(boolean[] inputs, float pace)
  {
    //pos.x -= pace;
    pos.y -= inputs[0] ? pace*2.5 : 0;
    pos.y += inputs[1] ? pace*2.5 : 0;
    pos.x -= inputs[2] ? pace*2.5 : 0;
    pos.x += inputs[3] ? pace*2.5 : 0;
  }
  
  @Override
  void render()
  {
    fill(col);
    rect(pos.x, pos.y, size, size);
  }

  void collisionDetection()
  {
  }
}

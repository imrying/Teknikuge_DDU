class GameObject
{
  PVector pos;
  PVector size;
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
  color c;

  Wall(float posX, float posY, float sizeX, float sizeY, color col)
  {
    position = new PVector(posX, posY);
    super.size = new PVector(sizeX, sizeY);
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
  color col;
  Player(float x, float y, float size, color col)
  {
    super.pos = new PVector(x, y);
    super.size = new PVector(size,size);
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
    rect(pos.x, pos.y, size.x, size.y);
  }

  void collisionDetection()
  {
  }
}

class GameObject
{
  PVector pos;
  PVector size;
  PVector vel;
  color col;

  GameObject() {
  }

  GameObject(float posX, float posY, float sizeX, float sizeY, color col)
  {
    pos = new PVector(posX, posY);
    size = new PVector(sizeX, sizeY);
    this.col = col;
  }

  void update(boolean[] inputs, float pace, float gravX, float gravY) {
  }
  void update(boolean[] inputs, float pace, float gravX, float gravY, boolean colliding)
  {}

  void render() {
    fill(col);
    rect(pos.x-(size.x/2), pos.y-(size.y/2), size.x, size.y);
  }
}

class Wall extends GameObject
{

  Wall(float posX, float posY, float sizeX, float sizeY, color col)
  {
    super.pos = new PVector(posX, posY);
    super.size = new PVector(sizeX, sizeY);
    super.col = col;
  }

  @Override
    void update(boolean[] inputs, float pace, float gravX, float gravY)
  {
    pos.x -= pace;
  }
}



class Player extends GameObject
{
  color col;
  Player(float x, float y, float size, color col)
  {
    super.pos = new PVector(x, y);
    super.size = new PVector(size, size);
    super.col = col;
    super.vel = new PVector(0, 0);
  }

  @Override
    void update(boolean[] inputs, float pace, float gravX, float gravY, boolean colliding)
  {
    vel.add(new PVector(gravX, gravY));
    //pos.x -= pace;
    pos.y -= inputs[0] ? pace*2.5 : 0;
    pos.y += inputs[1] ? pace*2.5 : 0;
    pos.x -= inputs[2] ? pace*2.5 : 0;
    pos.x += inputs[3] ? pace*2.5 : 0;

    if (inputs[4] && colliding)
    {
      vel.add(new PVector(gravX, gravY).mult(-40));
    }
    pos.add(vel);
  }
}

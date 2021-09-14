class GameObject
{
  PVector pos;
  PVector size;
  color col;
  
  GameObject() {}
  
  void update(boolean[] inputs, float pace) {
  }
  
  void render() {
    fill(col);
    rect(pos.x-(size.x/2), pos.y-(size.y/2),size.x,size.y);
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
    void update(boolean[] inputs, float pace)
  {
    pos.x -= pace;
  }

}

class Player extends GameObject
{
  color col;
  PVector vel, grav;
  Player(float x, float y, float size, color col, float velX, float velY, float gravX, float gravY)
  {
    super.pos = new PVector(x, y);
    super.size = new PVector(size,size);
    super.col = col;
    this.vel = new PVector(velX,velY);
    this.grav = new PVector(gravX,gravY);
  }

  @Override
    void update(boolean[] inputs, float pace)
  {
    vel.add(grav);
    pos.add(vel);
    //pos.x -= pace;
    pos.y -= inputs[0] ? pace*2.5 : 0;
    pos.y += inputs[1] ? pace*2.5 : 0;
    pos.x -= inputs[2] ? pace*2.5 : 0;
    pos.x += inputs[3] ? pace*2.5 : 0;
    println(pos.x,pos.y);
  }

}

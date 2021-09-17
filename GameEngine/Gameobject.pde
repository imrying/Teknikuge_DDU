class GameObject
{
  PVector pos;
  PVector size;
  PVector vel;
  color col;
  int id;
  int direction;
  float speed;
  Player gravIndicator;

  GameObject() {
  }

  GameObject(float posX, float posY, float sizeX, float sizeY, color col)
  {
    pos = new PVector(posX, posY);
    size = new PVector(sizeX, sizeY);
    this.col = col;
    this.id = 0;
  }
  void update(boolean[] inputs, float pace, float gravX, float gravY) {
  }
  void update(boolean[] inputs, float pace, float gravX, float gravY, int colliding)
  {
  }
  void update(boolean[] inputs, float pace, float gravX, float gravY, int colliding, float speed)
  {
  }

  void update(boolean[] inputs, float pace, float gravX, float gravY, int colliding, SoundController soundController) {
  }

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
    super.id = 2;
  }

  void update(boolean[] inputs, float pace, float gravX, float gravY)
  {
    pos.x -= pace;
  }
}



class Player extends GameObject
{
  color col;
  boolean realPlayer;
  Player(float x, float y, float size, color col, float speed, boolean realPlayer)
  {
    this.realPlayer = realPlayer;
    super.pos = new PVector(x, y);
    super.size = new PVector(size, size);
    super.col = col;
    super.vel = new PVector(0, 0);
    super.id = 1;
    super.speed = speed;
    if (realPlayer)
    {
      gravIndicator = new Player(x, y, 25, col, 0, false);
    }
  }

  void update(boolean[] inputs, float pace, float gravX, float gravY, int colliding, SoundController soundController)
  {
    vel.add(new PVector(gravX, gravY));
    pos.x -= pace;
    pos.y -= inputs[0] ? speed : 0;
    pos.y += inputs[1] ? speed : 0;
    pos.x -= inputs[2] ? speed : 0;
    pos.x += inputs[3] ? speed : 0;

    if (inputs[4] && colliding == 1)
    {
      vel.add(new PVector(gravX, gravY).mult(-30));
      soundController.playSound(0);
      gravIndicator.vel.x = vel.x*1.12;
      gravIndicator.vel.y = vel.y*1.12;
    }
    pos.add(vel);

    if (realPlayer)
    {
      boolean[] fakeInputs = new boolean[5];
      for (int i = 0; i < 5; i++)
      {
        fakeInputs[i] = false;
      }
      gravIndicator.update(fakeInputs, pace, gravX*1.1, gravY*1.1, 0, soundController);

      if (gravIndicator.pos.x < (pos.x - 12))
      {
        gravIndicator.pos.x = pos.x-12;
        gravIndicator.vel.x = vel.x*1.1;
      } else if (gravIndicator.pos.x > (pos.x +12))
      {
        gravIndicator.pos.x = pos.x+12;
        gravIndicator.vel.x = vel.x*1.1;
      }

      if (gravIndicator.pos.y < (pos.y - 12))
      {
        gravIndicator.pos.y = pos.y-12;
        gravIndicator.vel.y = vel.y*1.1;
      } else if (gravIndicator.pos.y > (pos.y + 12))
      {
        gravIndicator.pos.y = pos.y+12;
        gravIndicator.vel.y = vel.y*1.1;
      }

      if (gravX == 0)
      {
        gravIndicator.pos.x = pos.x;
      }
      if (gravY == 0)
      {
        gravIndicator.pos.y = pos.y;
      }
    }
  }

  void render()
  {
    fill(super.col);
    rect(pos.x-(size.x/2), pos.y-(size.y/2), size.x, size.y);

    if (realPlayer)
    {
      fill(255);
      rect(pos.x-(size.x*0.65/2), pos.y-(size.y*0.65/2), size.x*0.65, size.y*0.65);
      gravIndicator.render();
    }
  }
}

class GravityButton extends GameObject {
  GravityButton(float posX, float posY, float size_x, float size_y, color col, int direct) 
  { 
    super.pos = new PVector(posX, posY); 
    super.size = new PVector(size_x, size_y); 
    super.col = col; 
    super.direction = direct;
    super.id = 3;
  } 

  @Override 
    void update(boolean[] inputs, float pace, float gravX, float gravY) 
  { 
    pos.x -= pace;
  } 

  @Override  
    void render() { 
    fill(col); 
    rect(pos.x-(size.x/2), pos.y-(size.y/2), size.x, size.y, 20); 

    if (direction == 1) { //up 
      fill(0); 
      rect(pos.x-(size.x*0.3/2), pos.y-(size.y*0.3/2)-size.y*0.3, size.x*0.3, size.y*0.3, 20);
    } 
    if (direction == 2) { //down 
      fill(0); 
      rect(pos.x-(size.x*0.3/2), pos.y-(size.y*0.3/2)+size.y*0.3, size.x*0.3, size.y*0.3, 20);
    } 

    if (direction == 3) { //left 
      fill(0); 
      rect(pos.x-(size.x*0.3/2)-size.x*0.3, pos.y-(size.y*0.3/2), size.x*0.3, size.y*0.3, 20);
    }     

    if (direction == 4) { //right 
      fill(0); 
      rect(pos.x-(size.x*0.3/2)+size.x*0.3, pos.y-(size.y*0.3/2), size.x*0.3, size.y*0.3, 20);
    }
    if (direction == 5) { //null 
      fill(0); 
      rect(pos.x-(size.x*0.3/2), pos.y-(size.y*0.3/2), size.x*0.3, size.y*0.3, 20);
    }
  }
} 

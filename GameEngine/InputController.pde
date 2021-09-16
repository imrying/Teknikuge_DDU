boolean w, a, s, d, up, down, left, right, restart;

class InputController {
  InputController () {
  }
  boolean[] getInputs(boolean p1, PVector gP1, PVector gP2) {
    boolean[] inputs = new boolean[6];

    if (p1) {
      inputs[0] = (gP1.y > 0) ? false : w;
      inputs[1] = (gP1.y < 0) ? false : s;
      inputs[2] = (gP1.x > 0) ? false : a;
      inputs[3] = (gP1.x < 0) ? false : d;
      if (gP1.y > 0)
      {
        inputs[4] = w;
      }
      if (gP1.y < 0)
      {
        inputs[4] = s;
      }
      if (gP1.x > 0)
      {
        inputs[4] = a;
      }
      if (gP1.x < 0)
      {
        inputs[4] = d;
      }
    } else {
      inputs[0] = (gP2.y != 0) ? false : up;
      inputs[1] = (gP2.y != 0) ? false : down;
      inputs[2] = (gP2.x != 0) ? false : left;
      inputs[3] = (gP2.x != 0) ? false : right;
      if (gP2.y > 0)
      {
        inputs[4] = up;
      }
      if (gP2.y < 0)
      {
        inputs[4] = down;
      }
      if (gP2.x > 0)
      {
        inputs[4] = left;
      }
      if (gP2.x < 0)
      {
        inputs[4] = right;
      }
    }
    
    return inputs;
  }
  
  boolean restartInput(){
  return restart;
}
}




void keyPressed() {
  if  (keyCode == UP) {
    up = true;
    down = false;
  } 
  if (keyCode == DOWN) {
    down = true;
    up = false;
  }
  if (keyCode == LEFT) {
    left = true;
    right = false;
  }
  if (keyCode == RIGHT) {
    right = true;
    left = false;
  }

  if (key == 'w') {
    w = true;
    s = false;
  } 
  if (key == 's') {
    s = true;
    w = false;
  }
  if (key == 'a') {
    a = true;
    d = false;
  }
  if (key == 'd') {
    d = true;
    a = false;
  }
  if (key == 'r') {
    restart = true;
  }
}

void keyReleased() {
  if  (keyCode == UP) {
    up = false;
  }
  if (keyCode == DOWN) {
    down = false;
  }
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (key == 'w') {
    w = false;
  }  
  if (key == 's') {
    s = false;
  }  
  if (key == 'a') {
    a = false;
  }  
  if (key == 'd') {
    d = false;
  }
  if (key == 'r') {
    restart = false;
  }
}

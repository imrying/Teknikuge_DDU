boolean w, a, s, d, up, down, left, right;

class InputController {
  InputController () {
  }
  boolean[] getInputs(boolean p1) {
    boolean[] inputs = new boolean[4];

    if (p1) {
      inputs[0] = w;
      inputs[1] = s;
      inputs[2] = a;
      inputs[3] = d;
    } else {
      inputs[4] = up;
      inputs[5] = down;
      inputs[6] = left;
      inputs[7] = right;
    }
    return inputs;
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
}

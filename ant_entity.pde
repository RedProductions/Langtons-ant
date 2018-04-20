class ant {

  int x, y;
  int dir;

  ant() {

    x = w/2;
    y = h/2;
    dir = 0;
  }
  ant(int nx, int ny) {

    x = nx;
    y = ny;
    dir = 0;
  }
  ant(int nx, int ny, int ndir) {

    x = nx;
    y = ny;
    dir = ndir;
  }


  int get_x() {
    return x;
  }
  int get_y() {
    return y;
  }
  int get_dir() {
    return dir;
  }

  void set_x(int nx) {
    x = nx;
  }
  void set_y(int ny) {
    y = ny;
  }
  void set_dir(int ndir) {
    dir = ndir;
  }


  void moveAnt() {

    grid[x][y]--;

    if (grid[x][y] < 0) {
      grid[x][y] = 11;
    }

    switch(dir) {

      case(A_UP): 
      y -= speed; 
      break;
      case(A_RIGHT): 
      x += speed; 
      break;
      case(A_DOWN): 
      y += speed; 
      break;
      case(A_LEFT): 
      x -= speed;
      break;
      case(A_UR):
      x += speed;
      y -= speed;
      break;
      case(A_DR):
      x += speed;
      y += speed;
      break;
      case(A_DL):
      x -= speed;
      y += speed;
      break;
      case(A_UL):
      x -= speed;
      y -= speed;
      break;
    }

    if (x < 0) {
      x = w - 1;
    } else if (x > w - 1) {
      x = 0;
    }

    if (y < 0) {
      y = h - 1;
    } else if (y > h - 1) {
      y = 0;
    }
  }

  void moveRight() {

    dir++;

    if (dir > BIGGEST_DIR) {
      dir = SMALLEST_DIR;
    }
  }

  void moveLeft() {

    dir--;

    if (dir < SMALLEST_DIR) {
      dir = BIGGEST_DIR;
    }
  }

  void move2Right() {

    dir += 2;

    if (dir > BIGGEST_DIR) {
      dir -= BIGGEST_DIR + 1;
    }
  }

  void move2Left() {

    dir -= 2;

    if (dir < SMALLEST_DIR) {
      dir = BIGGEST_DIR - abs(dir) + 1;
    }
  }
}
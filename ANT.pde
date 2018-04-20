int[][] grid;

ArrayList<ant> a = new ArrayList<ant>();

final int A_UP = 0;
final int A_UR = 1;
final int A_RIGHT = 2;
final int A_DR = 3;
final int A_DOWN = 4;
final int A_DL = 5;
final int A_LEFT = 6;
final int A_UL = 7;

final int BIGGEST_DIR = A_UL;
final int SMALLEST_DIR = A_UP;

int w, h;

int Ratio = 5;

int stepSize = 1;
int speed = 1;

int popCap = 100;

void setup() {

  size(800, 800);

  //fullScreen();

  grid = new int[width/Ratio][height/Ratio];

  w = grid.length;
  h = grid[0].length;

  a.add(new ant());
}



void draw() {

  timeCalc();

  loadPixels();

  for (int currentStep = 0; currentStep < stepSize; currentStep++) {
    for (int index = a.size() - 1; index >= 0; index--) {


      ant part;

      try {
        part = a.get(index);

        int x = part.get_x();
        int y = part.get_y();

        if (grid[x][y]%4 == 3) {
          part.moveRight();
        } else if (grid[x][y]%4 == 2) {
          part.moveLeft();
        } else if (grid[x][y]%4 == 1) {
          part.move2Right();
        } else if (grid[x][y]%4 == 0) {
          part.move2Left();
        }

        part.moveAnt();

        int offset = 0;

        boolean stillAlive = true;

        for (int index2 = a.size() - 1; index2 >= 0; index2--) {

          int nindex = index2 - offset;

          if (index != nindex && stillAlive) {

            ant part2 = a.get(nindex);

            if (part2.get_x() == x && part2.get_y() == y) {

              a.remove(index);
              if (index > nindex) {
                a.remove(nindex);
              } else {
                a.remove(nindex-1);
                offset++;
              }

              stillAlive = false;
            }
          }
        }


        if (a.size() < popCap) {
          a.add(new ant(x, y));
        }


        int loc;

        for (int i = 0; i < Ratio; i++) {
          for (int j = 0; j < Ratio; j++) {

            loc = (x * Ratio + i) + width * (y * Ratio + j);

            setColor(loc, x, y);
          }
        }
      }
      catch(IndexOutOfBoundsException e) {
      }
    }
  }

  if (currentTime - lastSpawned >= spawnRate && a.size() < popCap) {
    a.add(new ant());

    lastSpawned = currentTime;
  }

  updatePixels();
}




void setColor(int loc, int x, int y) {

  switch(grid[x][y]) {

    case(11):
    pixels[loc] = color(0, 85, 255);
    break;
    case(10):
    pixels[loc] = color(0, 170, 255);
    break;
    case(9):
    pixels[loc] = color(0, 255, 255);
    break;
    case(8):
    pixels[loc] = color(0, 255, 0);
    break;
    case(7):
    pixels[loc] = color(85, 255, 0);
    break;
    case(6):
    pixels[loc] = color(170, 255, 0);
    break;
    case(5):
    pixels[loc] = color(255, 255, 0);
    break;
    case(4):
    pixels[loc] = color(255, 0, 0);
    break;
    case(3):
    pixels[loc] = color(255, 85, 0);
    break;
    case(2):
    pixels[loc] = color(255, 170, 0);
    break;
    case(1):
    pixels[loc] = color(255, 255, 0);
    break;
    case(0):
    pixels[loc] = color(0, 0, 255);
    break;
  }
}
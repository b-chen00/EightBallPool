Table t;

void mousePressed() {
  if (!(t.gameOver) && t.onTable[0] != null && mouseButton == LEFT && t.onTable[0].position.x > 100 && mouseX > t.onTable[0].position.x-30 && mouseX < t.onTable[0].position.x+30 &&
    mouseY > t.onTable[0].position.y-30 && mouseY < t.onTable[0].position.y+30 && !(t.isStillMoving)) {
    t.onTable[0].isSelected = true;
    t.selected = t.onTable[0];
    t.resetFindFirstContact();
  }
}

void mouseReleased() {
  if (t.selected != null) {
    PVector mouseV = new PVector(mouseX, mouseY);
    PVector newSpeed = PVector.sub(t.selected.position, mouseV).div(7);
    t.selected.speed = newSpeed;
    t.selected.isSelected = false;
    t.selected = null;
    t.changeTurn();
    t.changeMoveable(false);
  }
}

void setup() {
  size(1200, 600); //1800 900
  t = new Table();
}

void draw() {
  t.start();
  t.display();
  t.update();
  t.moveWhite();
}

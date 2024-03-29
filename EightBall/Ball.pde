class Ball {
  PVector position, speed;
  boolean stripe;
  boolean solid;
  boolean eightball;
  float radius = 20;
  int num;
  float dec = 0.98;
  color ballColor;
  boolean isSelected;
  boolean isMoving;
  Ball(float newX, float newY, boolean str, boolean sol, boolean ei, int n, color c) {
    position = new PVector(newX, newY);
    speed = new PVector(0, 0);
    stripe = str;
    solid = sol;
    eightball = ei;
    num = n;
    ballColor = c;
    isSelected = false;
    isMoving = false;
  }

  void display() {
    fill(ballColor);
    ellipse(position.x, position.y, radius, radius);
    if (num != 0) {
      fill(255, 255, 255);
      ellipse(position.x, position.y, 8.33, 8.33);
    }
    if (stripe) {
      arc(position.x, position.y-4.83, 16, 11, PI, TWO_PI);
      arc(position.x, position.y+4.83, 16, 11, 0, PI);
    }
    if (num != 0) {
      if (num > 9) {
        textSize(6.7);
        fill(#000000);
        text("" + num, position.x-4.7, position.y+3.3);
      } else {
        textSize(8.3);
        fill(#000000);
        text("" + num, position.x-2.7, position.y+3.3);
      }
    }
    
    if (position.x < 266.3 && position.y < 130){
      position.x = 266.3;
      position.y = 130;
    }
    if (position.x < 266.3 && position.y > 470){
      position.x = 266.3;
      position.y = 470;
    }
    if (position.x > 573.3 && position.x < 613.3 && position.y < 130){
      position.x = 593.3;
      position.y = 130;
    }
    if (position.x > 573.3 && position.x < 613.3 && position.y > 470){
      position.x = 593.3;
      position.y = 470;
    }
    if (position.x > 933.3 && position.y < 130){
      position.x = 933.3;
      position.y = 130;
    }
    if (position.x > 933.3 && position.y > 470){
      position.x = 933.3;
      position.y = 470;
    }
    
    if (position.y < 143.3 && position.x > 283.3 && position.x < 566.7){
      speed.y *= -1;
      position.y = 143.3;
    }
    if (position.y < 143.3 && position.x > 616.7 && position.x < 910){
      speed.y *= -1;
      position.y = 143.3;
    }
    if (position.y > 456.7 && position.x > 283.3 && position.x < 566.7){
      speed.y *= -1;
      position.y = 456.7;
    }
    if (position.y > 455.7 && position.x > 616.7 && position.x < 910){
      speed.y *= -1;
      position.y = 456.7;
    }
    if (position.x < 276.7 && position.y > 153.3 && position.y < 446.7){
      speed.x *= -1;
      position.x = 276.7;
    }
    if (position.x > 923.3 && position.y > 153.3 && position.y < 446.7){
      speed.x *= -1;
      position.x = 923.3;
    }
    if (isSelected) {
      line(position.x, position.y, mouseX, mouseY);
    }
  }

  public void move() {
    if (speed.mag() < 0.1) {
      speed.set(0, 0);
      isMoving = false;
    } else {
      isMoving = true;
    }
    position.add(speed);
    speed.mult(dec);
  }

  public PVector polar(float radius, float angle) {
    PVector polar = new PVector(radius*cos(angle), radius*sin(angle));
    return polar;
  }

  void collide(Ball other, float xDis, float yDis, float dist) {
    float normX = xDis / dist;
    float normY = yDis / dist;
    float midX = (this.position.x + other.position.x)/2;
    float midY = (this.position.y + other.position.y)/2;
    this.position.x = midX - normX * 10;
    this.position.y = midY - normY * 10;
    other.position.x = midX + normX * 10;
    other.position.y = midY + normY * 10;
    float dVector = (this.speed.x - other.speed.x) * normX;
    dVector += (this.speed.y - other.speed.y) * normY;
    float dvx = dVector * normX;
    float dvy = dVector * normY;
    this.speed.x -= dvx;
    this.speed.y -= dvy;
    other.speed.x += dvx;
    other.speed.y += dvy;
    other.speed.x *= 0.98;
    other.speed.y *= 0.98;
    this.speed.x *= 0.95;
    this.speed.y *= 0.95;
  }
}

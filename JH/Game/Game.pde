 /*
  Assignment: OOP EXERCISE
  Student: *Name Here*
  Pasadena City College, Fall 2024
  Course Name: DMA60 Creative Coding
  Prof. George McKinney
  Project Description: This program .... (describe it!)
  Last Modified: November 6, 20XX
  */

Character player;
Obstacle obstacle;

void setup() {
  size(400, 400);
player = new Character(50, height / 2, 30);
obstacle = new Obstacle(width - 50, height / 2, 40);
}

void draw() {
  background(255);

  if (keyPressed) {
    if (key == 'a') {
      player.move(-2, 0);
    } else if (key == 'd') {
      player.move(2, 0);
    } else if (key == 'w') {
      player.move(0, -2);
    } else if (key == 's') {
      player.move(0, 2);
    }
  }

  player.display();
  obstacle.display();

  if (player.collidesWith(obstacle)) {
    textSize(32);
    fill(0);
    text("Game Over!", width / 2 - 100, height / 2);
  }
}
void mousePressed(){
    println(mouseX,mouseY);
}
class Character {
  float x, y;
  float size;
  
  Character(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void move(float xSpeed, float ySpeed) {
    x += xSpeed;
    y += ySpeed;
  }
  
  boolean collidesWith(Obstacle obstacle) {
    float distance = dist(x, y, obstacle.x, obstacle.y);
    return distance < (size + obstacle.size) / 2;
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }
}class Obstacle {
  float x, y;
  float size;
  
  Obstacle(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void display() {
    fill(0, 0, 255);
    rect(x, y, size, size);
  }
}

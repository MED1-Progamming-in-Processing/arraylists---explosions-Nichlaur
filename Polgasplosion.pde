ArrayList<Circle> circles = new ArrayList<Circle>();

PImage Polga;

final int Circle = 0;
final int Rectangle = 1;
final int Polgas = 2;

int currentShape = Polgas;

void setup() {
  size(500, 500);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  
  Polga = loadImage("Polga.png");
}

void mousePressed(){
  for(int i = 0; i < 100; i++){
    circles.add(new Circle(mouseX, mouseY));   
  }
  if (currentShape<2){
    currentShape++;
  } else if (currentShape==2){
    currentShape=0;
  }
}


void draw() {
  background(200);

  for (int i = circles.size()-1; i >= 0; i--) {
    circles.get(i).move();
    circles.get(i).display();
    
    if(circles.get(i).isOffScreen()){
      circles.remove(i);
    }
  }
}

class Circle {

  float x;
  float y;
  float xSpeed = random(-6, 6);
  float ySpeed = random(-6, 6);
  
  final float Gravity = 0.15;
  
  Circle(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void move() {
    ySpeed += Gravity;
    
    x += xSpeed;
    y += ySpeed;
    
  }

  void display() {
    if (currentShape==Circle){
      ellipse(x, y, 20, 20);
    }
    if (currentShape==Rectangle){
      rect(x, y, 20, 20);
    }
    if (currentShape==Polgas){
      image(Polga, x, y, 20, 20);
    }
  }
  
  boolean isOffScreen(){
    return x < 0 || x > width || y < 0 || y > height;
  }
}

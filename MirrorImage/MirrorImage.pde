PImage img;

void setup() {
  size(600, 600);
  img = loadImage("trazo.png");
  imageMode(CENTER);
}

void draw() {
  //background(255);
  if (mouseX<pmouseX) {
    scale(1, 1);
    image(img, width/2, height/2);
  } else if (mouseX>pmouseX) {
    scale(-1, 1);
    image(img, -width/2, height/2);//draw offset
  }
}

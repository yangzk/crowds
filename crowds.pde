ArrayList<Circle> circles = new ArrayList<Circle>();

int min = width/10;
int max = width/5;
 
/* Our object */
Circle c = new Circle(new PVector(0, 0), 20);
 
void setup() {
  size(640, 640);
  background(255);
  //frameRate(); 
 

for(int i=0;i<1000;i++){  
  PVector newLoc = new PVector(random(width), random(height));
  float newD = (int) random(min, max);
  
  /* Detect whether if we use these these values if it will intersect the other objects. */
  while (detectAnyCollision(circles, newLoc, newD)) {
    /* If the values do interect make new values. */
    newLoc = new PVector(random(width), random(height));
    newD = (float) random(min, max);
  }
 
  /* Once we have our values that do not intersect, add a circle. */
  c = new Circle(newLoc, newD);
  circles.add(c);
}  
}
 
void draw() {
  for(Circle c : circles){
    c.draw();
  }
}
 
static boolean detectAnyCollision(ArrayList<Circle> circles, PVector newLoc, float newR) {
  for (Circle c : circles) {
    if (c.detectCollision(newLoc, newR)   ) {
      return true;
    }
  }
  return false;
}
 
 

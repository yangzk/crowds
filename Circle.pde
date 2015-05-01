class Circle {
  PVector loc;
  float d;
 
  Circle(PVector loc, float d) {
    this.loc = loc;
    this.d = d;
  }
 
  void draw() {
    /* Random color to add some spice */
    stroke(0);
    strokeWeight(2);
    noFill();
    ellipse(loc.x, loc.y, d, d);
  }
 
  boolean detectCollision(PVector newLoc, float newD) {
    return dist(loc.x, loc.y, newLoc.x, newLoc.y) < ((d + newD)/2);
  }
  
  boolean detectCenter(float newD) {
    return dist(loc.x, loc.y, width/2, height/2) > ((d + newD)/2);
  }
}

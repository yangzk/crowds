class Circle {
  PVector loc;
  float d;
  PVector eyeLoc;
  float eyeD;
  PVector speed;
  float startArc = - 3*PI/4;
float endArc = - PI/4;
 
  Circle(PVector loc, float d) {
    this.loc = loc;
    this.d = d;
    eyeD = d/2.5;
  }
 
  void drawCircle() {
    /* Random color to add some spice */
    stroke(0);
    strokeWeight(0.5);
    noFill();
    fill(255);
    ellipse(loc.x, loc.y, d, d);
    
  }
  
  void drawEye(){
    noStroke();
    fill(0);
    ellipse(eyeLoc.x, eyeLoc.y, eyeD, eyeD);
  }
  
  void drawBlink(){
    noStroke();
    fill(255);
    ellipse(eyeLoc.x + eyeD/5, eyeLoc.y - eyeD/5, eyeD/5, eyeD/5);
  }
  
  void drawArc(){
    
   /* 
    noStroke();
    fill(255);
    fill(255);
    stroke(0);*/
    fill(255);
    strokeWeight(1);
    stroke(0);
    arc(loc.x, loc.y, d, d, -PI+QUARTER_PI, -QUARTER_PI);
    
   
  }
  
  void createDestination(){
    PVector moveDist = new PVector(random((eyeD-d)/2,(d-eyeD)/2),random((eyeD-d)/2,(d-eyeD)/2));
    
    if(this.eyeInCircle( moveDist) && random(1) > 0.8 ){  
     this.speed = PVector.div(moveDist,10);
    }else{
      this.speed = new PVector(0,0);
    }
  }
  
  void move(){
     
  }
 
 boolean eyeInCircle(PVector moveDist){
   return dist(loc.x, loc.y, eyeLoc.x + moveDist.x, eyeLoc.y+ moveDist.y) <= ((d-eyeD)/2);
 }
 
  boolean detectCollision(PVector newLoc, float newD) {
    return dist(loc.x, loc.y, newLoc.x, newLoc.y) <= ((d + newD)/2);
  }
  
  boolean detectCenter(float newD) {
    return dist(loc.x, loc.y, width/2, height/2) > ((d + newD)/2);
  }
}

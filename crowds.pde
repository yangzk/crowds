 

ArrayList<Circle> circles = new ArrayList<Circle>();

int min = 10;
int max = 100;
float stopTime;
float wait = 1000;

 
 
void setup() {
  //frameRate(60);
  size(640, 640);
  background(255);
    
  stopTime = millis(); 
  
for(int i=0;i<100000;i++){  
  PVector newLoc = new PVector(random(width), random(height));
  float newD =  random(min, max);
  
  /* Detect whether if we use these these values if it will intersect the other objects. */
  while (detectAnyCollision(circles, newLoc, newD)) {
     
    /* If the values do interect make new values. */
    newLoc = new PVector(random(width), random(height));
    newD = (float) random(min, max);
   }
 
    
  /* Once we have our values that do not intersect, add a circle. */
  Circle c = new Circle(newLoc, newD);
      
  c.eyeLoc = new PVector(random(c.eyeD/2 - c.d/2, c.d/2 - c.eyeD/2), random(c.eyeD/2 - c.d/2 , c.d/2 - c.eyeD/2));
  c.eyeLoc.add(c.loc);
 
 if( dist(c.loc.x, c.loc.y, width/2, height/2) <= width/2 *0.9 ){
  circles.add(c);
 }
 
}  
}


int nstep = 0;
void draw() {
   
  background(0);
  smooth();
  for(Circle c : circles){
    c.drawCircle();
    c.drawEye();    
    c.drawBlink();
    c.drawArc();
    //arc(c.loc.x, c.loc.y, c.d, c.d, -PI+QUARTER_PI, -QUARTER_PI, CHORD);
    
    if(nstep==0){
    c.createDestination();
    }

  }
  
  if(nstep <10){
  for(Circle c : circles){       
    c.eyeLoc.add(c.speed);
  }
  nstep++;  
  }
  
  if(nstep == 10){
    nstep = 0;
  }
 
}
 
static boolean detectAnyCollision(ArrayList<Circle> circles, PVector newLoc, float newR) {
  for (Circle c : circles) {
    if (c.detectCollision(newLoc, newR) ) {
      return true;
    }
  }
  return false;
}
 
 

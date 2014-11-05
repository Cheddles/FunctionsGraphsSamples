color xColour = color(0,50,255);
color yColour = color(205,50,0);

int xMin=-1;
int xMax=15;
int yMin=-1;
int yMax=11;

int xSteps=16;  //number of tick marks between xMmin and xMax
int ySteps=12;  //number of tick marks between yMmin and yMax

Point point1 = new Point();


void setup(){
  size(800,600);
  
  if (frame != null) {
    frame.setResizable(true);
  }
  
  //starting points hard-coded
  point1.xLoc=3;
  point1.yLoc=2;
}

void draw(){
  background(255);
  drawAxes();
  point1.drag(mouseX,mouseY);
  point1.display();
}

void mousePressed(){
  point1.click(mouseX, mouseY);
}

void mouseReleased(){
  point1.dragging=false;
}

void drawAxes(){
  strokeWeight(3);
  stroke(yColour);
  fill(yColour);
  if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
    line(max(2,map(0,xMin,xMax,0,width)),map(yMax-0.5,yMin,yMax,height,0),max(2,map(0,xMin,xMax,0,width)),map(0,yMin,yMax,height,0));  // draw y-axis
    arrowHead(int(map(0,xMin,xMax,0,width)), int(map(yMax,yMin,yMax,height,0)), 0, height/(2*ySteps));
  }
  stroke(yColour);
  for(int i=1; i<ySteps; i++){  //draw tick marks for y axis
    line(map(0,xMin,xMax,0,width),map(i,0,ySteps,0,height),map(0,xMin,xMax,0,width)-(height+width)/300, map(i,0,ySteps,0,height));
    //fill(0);
    textAlign(CENTER, CENTER);
    textSize(height/(2*(yMax-yMin)));
    if (i<12) text(str(11-i),map(0,xMin,xMax,0,width)/2,map(i,0,ySteps,0,height));
  }
  stroke(xColour);
  fill(xColour);
  if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
    line(map(0,xMin,xMax,0,width), map(0,yMin,yMax,height,0),map(xMax-0.5,xMin,xMax,0,width),map(0,yMin,yMax,height,0));
    arrowHead(int(map(xMax,xMin,xMax,0,width)), int(map(0,yMin,yMax,height,0)), PI/2, width/(2*xSteps));
  }
  stroke(xColour);
  for(int i=1; i<(xSteps); i++){  //draw tick marks for x axis
    line(map(i,0,xSteps,0,width),map(0,yMin,yMax,height,0), map(i,0,xSteps,0,width), map(0,yMin,yMax,height,0)+(height+width)/300);
    //fill(0);
    textAlign(CENTER, CENTER);
    if (i<15) text(str(i),map(i,xMin,xMax,0,width),map(yMin+0.5,yMin,yMax,height,0));
  } 
}

void arrowHead(int x, int y, float angle, int headLength){
  noStroke();
  pushMatrix();
    translate(x,y);
    rotate(angle);
    beginShape();
      vertex(0,0);
      vertex(-headLength/3,headLength);
      vertex(headLength/3,headLength);
    endShape(CLOSE);
  popMatrix();
}

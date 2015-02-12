color xColour = color(0,50,255);
color yColour = color(205,50,0);

int xMin=-10;
int xMax=10;
int yMin=-7;
int yMax=7;

int xSteps=20;  //number of tick marks between xMmin and xMax
int ySteps=14;  //number of tick marks between yMmin and yMax

Point point1 = new Point(-2,2);
Point point2 = new Point(3,3);
Point point3 = new Point(-4,-3);
Point point4 = new Point(4,-2);

Line line1 = new Line();
Line line2 = new Line();

void setup(){
  size(800,600);
  
  if (frame != null) {
    frame.setResizable(true);
  }
}

void draw(){
  background(255);
  drawAxes();
  point1.drag(mouseX,mouseY);
  point2.drag(mouseX,mouseY);
  point3.drag(mouseX,mouseY);
  point4.drag(mouseX,mouseY);
  point1.display();
  point2.display();
  point3.display();
  point4.display();
  
  fill(0);
  strokeWeight(30);
  textSize(20);
}

void mousePressed(){
  point1.click(mouseX, mouseY);
  point2.click(mouseX, mouseY);
  point3.click(mouseX, mouseY);
  point4.click(mouseX, mouseY);
}

void mouseReleased(){
  point1.dragging=false;
  point2.dragging=false;
  point3.dragging=false;
  point4.dragging=false;
}

void drawAxes(){
  strokeWeight(3);
  stroke(yColour);
  if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
    line(map(0,xMin,xMax,0,width),0,map(0,xMin,xMax,0,width),height);  // draw y-axis
  }
  for(int i=0; i<ySteps; i++){  //draw tick marks for y axis
    line(map(0,xMin,xMax,0,width),map(i,0,ySteps,0,height),map(0,xMin,xMax,0,width)+(height+width)/300, map(i,0,ySteps,0,height));
  }
    stroke(xColour);
  if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
    line(0, map(0,yMin,yMax,height,0),width,map(0,yMin,yMax,height,0));
  }
  for(int i=0; i<xSteps; i++){  //draw tick marks for y axis
    line(map(i,0,xSteps,0,width),map(0,yMin,yMax,height,0), map(i,0,xSteps,0,width), map(0,yMin,yMax,height,0)+(height+width)/300);
  }
  fill(255,255,255,150);
  noStroke();
  rect(0,0,width,height);
}

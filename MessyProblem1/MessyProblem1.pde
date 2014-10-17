float xMin=0;
float xMax=2000;
float yMin=0;
float yMax=250;

int xSteps=20;  //number of tick marks between xMmin and xMax
int ySteps=20;  //number of tick marks between yMmin and yMax

Point point1 = new Point();
Point point2 = new Point();
Point point3 = new Point();

Line line12= new Line();
Line line23= new Line();

String testDebug="test";

void setup(){
  size(800,600);
  
  if (frame != null) {
    frame.setResizable(true);
  }
  
  //starting points hard-coded
  point1.xLoc=0;
  point1.yLoc=0;
  point2.xLoc=1300;
  point2.yLoc=100;
  point3.xLoc=2000;
  point3.yLoc=250;  
}

void draw(){
  background(255);
  drawAxes();
  point1.drag(mouseX,mouseY);
  point2.drag(mouseX,mouseY);
  point3.drag(mouseX,mouseY);
  point1.display();
  point2.display();
  point3.display();
  line12.display(point1, point2, "top");
  line23.display(point2, point3, "bottom");
  
  fill(0);
  strokeWeight(30);
  textSize(20);
  //text(testDebug,600,400);
}

void mousePressed(){
  point1.click(mouseX, mouseY);
  point2.click(mouseX, mouseY);
  point3.click(mouseX, mouseY);
}

void mouseReleased(){
  point1.dragging=false;
  point2.dragging=false;
  point3.dragging=false;
}

void drawAxes(){
  stroke(150);
  strokeWeight(3);
  if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
    line(map(0,xMin,xMax,0,width),0,map(0,xMin,xMax,0,width),height);  // draw y-axis
  }
  for(int i=0; i<ySteps; i++){  //draw tick marks for y axis
    line(map(0,xMin,xMax,0,width),map(i,0,ySteps,0,height),map(0,xMin,xMax,0,width)+(height+width)/300, map(i,0,ySteps,0,height));
  }
  if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
    line(0, map(0,yMin,yMax,height,0),width,map(0,yMin,yMax,height,0));
  }
  for(int i=0; i<xSteps; i++){  //draw tick marks for y axis
    line(map(i,0,xSteps,0,width),map(0,yMin,yMax,height,0), map(i,0,xSteps,0,width), map(0,yMin,yMax,height,0)+(height+width)/300);
  }
}

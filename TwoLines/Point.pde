class Point{
  int xLoc;  //xlocation in cartesian coordinates
  int yLoc;  //ylocation in cartesian coordinates
  int dDisp=10;  //display diameter of point
  boolean dragging=false;
  int xOffset;  //in pixels
  int yOffset;  //in pixels
  
  Point(){
  }
  
  void display(){
    dDisp=height/15;
    stroke(0);
    if (dragging) drawGuides();
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    if ((contains(mouseX, mouseY))||dragging) fill(150);
    ellipse(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0), dDisp, dDisp);
    if (dragging){
      displayCoordinates();
    }
  }
  
  boolean contains(int x, int y){
    int rTouch=dDisp*2/3;  // acceptable touch radius from point (in pixels)
    int xPix = int(map(xLoc,xMin,xMax,0,width));
    int yPix = int(map(yLoc,yMin,yMax,height,0));
    if ((rTouch*rTouch)>((x-xPix)*(x-xPix)+(y-yPix)*(y-yPix))) return true;
    else return false;
  }
  
  boolean click(int x, int y){
    if (contains(x,y)){
      dragging=true;
      xOffset=int(x-map(xLoc,xMin,xMax,0,width));
      //testDebug=str(xOffset);
      yOffset=int(y-map(yLoc,yMin,yMax,height,0));
      return true;
    } else return false;
  }
  
  void drag(int x, int y){
    if (dragging){
      xLoc=xMin+int((float(x-xOffset)/width)*(xMax-xMin)+0.5);
      yLoc=yMax-int((float(y-yOffset)/height)*(yMax-yMin)+0.5);
    }
  }
  
  void displayCoordinates(){
    textSize(height/30);
    int vertOffset=0;
    int horizOffset=0;
    textSize(dDisp);

    if (yLoc<0){
      vertOffset=-height/20;
    }
    else {
      vertOffset=height/25;
    }
    if (xLoc<0){
      horizOffset=3*dDisp/5;
    }
    else {
      //vertOffset=30;
      horizOffset=-3*dDisp/4-int(textWidth("("+str(xLoc)+","+str(yLoc)+")"));      
    }
    textAlign(LEFT,CENTER);
    fill(255);
    text("("+str(xLoc)+","+str(yLoc)+")",map(xLoc,xMin, xMax, 0, width)+horizOffset+2, map(yLoc,yMin, yMax, height,0)+vertOffset+2);
    fill(0);
    text("(",map(xLoc,xMin, xMax, 0, width)+horizOffset, map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(xColour);
    text(str(xLoc),map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("), map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(0);
    text(",",map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("+str(xLoc)), map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(yColour);
    text(str(yLoc),map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("+str(xLoc)+","), map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(0);
    text(")",map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("+str(xLoc)+","+str(yLoc)), map(yLoc,yMin, yMax, height,0)+vertOffset);
  }
  
  void drawGuides(){
    strokeWeight(1);
    stroke(0);
    line(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0),map(0,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0));
    line(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0),map(xLoc,xMin,xMax,0,width),map(0,yMin,yMax,height,0));
  }
}  

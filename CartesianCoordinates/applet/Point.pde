class Point{
  float xLoc;  //xlocation in cartesian coordinates
  float yLoc;  //ylocation in cartesian coordinates
  int dDisp=16;  //display diameter of point
  boolean dragging=false;
  int xOffset;  //in pixels
  int yOffset;  //in pixels
  
  Point(){
  }
  
  void display(){
    dDisp=height/20;
    stroke(0);
    if (dragging) drawGuides();
    noStroke();
    fill(0,0,255);
    ellipseMode(CENTER);
    if (contains(mouseX, mouseY)) fill(0,255,0);
    ellipse(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0), dDisp, dDisp);
    displayCoordinates();
  }
  
  boolean contains(int x, int y){
    int rTouch=20;  // acceptable touch radius from point (in pixels)
    int xPix = int(map(xLoc,xMin,xMax,0,width));
    int yPix = int(map(yLoc,yMin,yMax,height,0));
    if ((rTouch*rTouch)>((x-xPix)*(x-xPix)+(y-yPix)*(y-yPix))) return true;
    else return false;
  }
  
  void click(int x, int y){
    if (contains(x,y)){
      dragging=true;
      xOffset=int(x-map(xLoc,xMin,xMax,0,width));
      //testDebug=str(xOffset);
      yOffset=int(y-map(yLoc,yMin,yMax,height,0));
    }
  }
  
  void drag(int x, int y){
    if (dragging){
      xLoc = map(float(x-xOffset),0,width,xMin,xMax);
      yLoc = map(float(y-yOffset),height,0,yMin,yMax);
    }
  }
  
//  void displayCoordinates(){
//    textSize(height/30);
//    int vertOffset=0;
//    int horizOffset=0;
//    
////    if (xLoc<((xMin+xMax)/2)){
////      horizOffset=10;
////      textAlign(LEFT);
////    } else{
////      horizOffset=-10;
////      textAlign(RIGHT);
////    }
//    
////    if (yLoc<((yMin+yMax)/2)){
////      vertOffset=30;
////    } else{
////      vertOffset=-30;
////    }
//    textSize(dDisp);
//    if (xLoc<0){
//      //vertOffset=30;
//      horizOffset=3*dDisp/4;
//      textAlign(LEFT,CENTER);
//    }
//    else {
//      //vertOffset=30;
//      horizOffset=-3*dDisp/4;
//      textAlign(RIGHT, CENTER);
//    }
//    if (yLoc<0){
//      vertOffset=-height/25;
//      //horizOffset=20;
//      //textAlign(LEFT);
//    }
//    else {
//      vertOffset=height/30;
//      //horizOffset=-20;
//      //textAlign(RIGHT);
//    }
//    fill(255);
//    text("("+String.format("%.2f",xLoc)+","+String.format("%.2f",yLoc)+")",map(xLoc,xMin, xMax, 0, width)+horizOffset+2, map(yLoc,yMin, yMax, height,0)+vertOffset+2);
//    fill(0);
//    text("("+String.format("%.2f",xLoc)+","+String.format("%.2f",yLoc)+")",map(xLoc,xMin, xMax, 0, width)+horizOffset, map(yLoc,yMin, yMax, height,0)+vertOffset); 
//  }

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
      horizOffset=-3*dDisp/4-int(textWidth("("+String.format("%.2f",xLoc)+","+String.format("%.2f",yLoc)+")"));      
    }
    textAlign(LEFT,CENTER);
    fill(255);
    text("("+String.format("%.2f",xLoc)+","+String.format("%.2f",yLoc)+")",map(xLoc,xMin, xMax, 0, width)+horizOffset+2, map(yLoc,yMin, yMax, height,0)+vertOffset+2);
    fill(0);
    text("(",map(xLoc,xMin, xMax, 0, width)+horizOffset, map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(xColour);
    text(String.format("%.2f",xLoc),map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("), map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(0);
    text(",",map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("+String.format("%.2f",xLoc)), map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(yColour);
    text(String.format("%.2f",yLoc),map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("+String.format("%.2f",xLoc)+","), map(yLoc,yMin, yMax, height,0)+vertOffset);
    fill(0);
    text(")",map(xLoc,xMin, xMax, 0, width)+horizOffset+textWidth("("+String.format("%.2f",xLoc)+","+String.format("%.2f",yLoc)), map(yLoc,yMin, yMax, height,0)+vertOffset);
  }
  
  void drawGuides(){
    strokeWeight(1);
    stroke(0);
    line(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0),map(0,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0));
    line(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0),map(xLoc,xMin,xMax,0,width),map(0,yMin,yMax,height,0));
  }
}  

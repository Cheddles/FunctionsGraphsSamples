class Point{
  String name;
  int index;    //which point is this in the collection
  float xValue;  //xlocation in cartesian coordinates
  float yValue;  //ylocation in cartesian coordinates
  int dDisp=16;  //display diameter of point
  boolean dragging=false;
  int xOffset;  //in pixels
  int yOffset;  //in pixels
  color colour;  // display colour for the point
  float lastLength;  // width of the coordinates at the previous iteration
  
  Point(String label, float xInit, int count){
    name=label;
    xValue=xInit;
    index=count;
  }
  
  void display(){
    int yPlot=YCoordToPix(yValue);  //calculate a vertical screen position for the dot from the y value
    int xPlot=XCoordToPix(xValue);  //calculate a horizontal screen position for the dot from the x value
    int dotSize=XCoordToPix(xMin+2*xIncrement);
    dDisp=int(width*(xIncrement/(xMax-xMin)))+1;
    stroke(0);
    noStroke();
    fill(colour);
    ellipseMode(CENTER);
    ellipse(xPlot,yPlot, dDisp, dDisp);
    displayCoordinates();
  }

  void displayCoordinates(){
    int textHeight=height/25;
    textSize(textHeight);
    int xPos=textHeight/3;              //screen location in pixels
    int yPos=int(1.5*textHeight*(1+index)); //screen location in pixels
    
    rectMode(CENTER);
    fill(255);
    rect(xPos+lastLength/2, yPos,1.2*lastLength, 1.2*textHeight);
    
    textAlign(LEFT,CENTER);
    fill(colour);
    text(name, xPos, yPos);
    fill(0);
    text(": (",xPos+textWidth(name), yPos);
    fill(xColour);
    text(String.format("%.2f",xValue),xPos+textWidth(name+": ("), yPos);
    fill(0);
    text(",",xPos+textWidth(name+": ("+String.format("%.2f",xValue)), yPos);
    fill(yColour);
    text(String.format("%.2f",yValue),xPos+textWidth(name+": ("+String.format("%.2f",xValue)+","), yPos);
    fill(0);
    text(")",xPos+textWidth(name+": ("+String.format("%.2f",xValue)+","+String.format("%.2f",yValue)), yPos);
    lastLength=textWidth(name+": ("+String.format("%.2f",xValue)+","+String.format("%.2f",yValue)+")");
  }
  
  int XCoordToPix(float coordinate){
    int pix;  //location in pixels
    pix=int(map(coordinate,xMin,xMax,0,width));
    return pix;
  }
  
  int YCoordToPix(float coordinate){
    int pix;  //location in pixels
    pix=int(map(coordinate,yMin,yMax,height,0));
    return pix;
  }
}  

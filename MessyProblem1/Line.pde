class Line{
  float m;  // slope of line
  float c;  // y-intercept of the line (x-intercept for vertical line)
  boolean vertical;  // true if vertical line
  
  Line(){ 
  }
  
  void display(Point point1, Point point2, String eqnLoc){
    String eqn;
    stroke(255,0,0);
    strokeWeight(3);
    fill(0);
    textSize(30);
    textAlign(LEFT);
    if ((point1.xLoc==point2.xLoc)&&(point1.yLoc==point2.yLoc)){
      eqn="no defined equation";
    }
    else{
      if (point1.xLoc==point2.xLoc){
        c=point1.xLoc;
        line(map(c,xMin,xMax,0,width),0,map(c,xMin,xMax,0,width),height);
        eqn="x="+String.format("%.2f",c);
      }else{
        m=(point1.yLoc-point2.yLoc)/(point1.xLoc-point2.xLoc);
        c=point1.yLoc-(m*point1.xLoc);
        line(0, map(m*xMin+c,yMin,yMax,height,0), width, map(m*xMax+c,yMin,yMax,height,0));
        if (c<0) eqn="y="+String.format("%.4f",m)+"x-"+String.format("%.2f",-c);
        else eqn="y="+String.format("%.4f",m)+"x+"+String.format("%.2f",c);
      }
      // display equation
      
    }
    if (eqnLoc=="top"){
      textAlign(LEFT);
      text(eqn, 10,30);
    }else{
      textAlign(RIGHT);
      text(eqn, width-10,height-30);      
    }
  }
}

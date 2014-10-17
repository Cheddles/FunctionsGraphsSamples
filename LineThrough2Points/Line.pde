class Line{
  float m;  // slope of line
  float c;  // y-intercept of the line (x-intercept for vertical line)
  boolean vertical;  // true if vertical line
  
  Line(){ 
  }
  
  void display(){
    stroke(255,0,0);
    strokeWeight(3);
    fill(0);
    textSize(20);
    textAlign(LEFT);
    if ((point1.xLoc==point2.xLoc)&&(point1.yLoc==point2.yLoc)){
      text("no defined equation",10,30);
    }
    else{
      if (point1.xLoc==point2.xLoc){
        c=point1.xLoc;
        line(map(c,xMin,xMax,0,width),0,map(c,xMin,xMax,0,width),height);
        text("x="+String.format("%.2f",c),10,30);
      }else{
        m=(point1.yLoc-point2.yLoc)/(point1.xLoc-point2.xLoc);
        c=point1.yLoc-(m*point1.xLoc);
        line(0, map(m*xMin+c,yMin,yMax,height,0), width, map(m*xMax+c,yMin,yMax,height,0));
        if (c<0) text("y="+String.format("%.2f",m)+"x-"+String.format("%.2f",-c),10,30);
        else text("y="+String.format("%.2f",m)+"x+"+String.format("%.2f",c),10,30);
      }
      // display equation
      
    }
  }
}

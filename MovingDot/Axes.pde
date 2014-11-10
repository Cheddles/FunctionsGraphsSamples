class Axes{
  float xIntercept=0;  // x-value of the y axis
  float yIntercept=0;  // y-value of the x axis
  
  Axes(){
    if (xMin>0) xIntercept=xMin;
    else if (xMax<0) xIntercept=xMax;
    
    if (yMin>0) yIntercept=yMin;
    else if (yMax<0) yIntercept=yMax;
  }
  
  void display(){
    float xGridStart;  // minimum x value of vertical grid lines
    float yGridStart;  // minimum y value of horizontal grid lines
    int arrowLength=(height+width)/70;
    
    //draw gridlines first to ensure that they are on the bottom layer
    strokeWeight(1);
    stroke(200);      
    if((yMin<=0)&&(yMax>=0)) yGridStart=yMin+(-yMin%yInterval);
    else yGridStart=yMin;
    for(int i=1; i<=int((yMax-yMin)/yInterval); i++){  //horizontal gridlines
      line(0,map(yMin+yInterval*i,yMin,yMax,height,0),width, map(yMin+yInterval*i,yMin,yMax,height,0)); // grid lines
    }
    if((xMin<=0)&&(xMax>=0)) xGridStart=xMin+(-xMin%xInterval);
    else xGridStart=xMin;
    for(int i=1; i<=int((xMax-xMin)/xInterval); i++){  //vertical gridlines
      line(map(xMin+xInterval*i,xMin,xMax,0,width),0, map(xMin+xInterval*i,xMin,xMax,0,width),height ); // grid lines
    }
    
    strokeWeight(3);
    stroke(yColour);
    fill(yColour);
    if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
      line(max(2,map(0,xMin,xMax,0,width)),arrowLength,max(2,map(0,xMin,xMax,0,width)),height-arrowLength);  // draw y-axis
      arrowHead(int(map(0,xMin,xMax,0,width)), 0, 0, arrowLength);
      arrowHead(int(map(0,xMin,xMax,0,width)), height, PI, arrowLength);
    }
//    stroke(yColour);
//    int i=xIntercept
//    while (){
//      
//    }

    stroke(xColour);
    fill(xColour);
    if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
      line(arrowLength, map(0,yMin,yMax,height,0),width-arrowLength,map(0,yMin,yMax,height,0));
      arrowHead(int(map(xMax,xMin,xMax,0,width)), int(map(0,yMin,yMax,height,0)), PI/2, arrowLength);
      arrowHead(0, int(map(0,yMin,yMax,height,0)), 1.5*PI, arrowLength);
    }
//    stroke(xColour);
//    for(int i=1; i<(xSteps); i++){  //draw tick marks for x axis
//      line(map(i,0,xSteps,0,width),map(0,yMin,yMax,height,0), map(i,0,xSteps,0,width), map(0,yMin,yMax,height,0)+(height+width)/300);
//      //fill(0);
//      textAlign(CENTER, CENTER);
//      if (i<15) text(str(i),map(i,xMin,xMax,0,width),map(yMin+0.5,yMin,yMax,height,0));
//    } 
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
}



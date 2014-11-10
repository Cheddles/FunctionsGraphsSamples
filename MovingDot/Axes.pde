class Axes{
  float xIntercept=0;  // x-value of the y axis
  float yIntercept=0;  // y-value of the x axis
  int textHeight;    // text size for axis value display
  float xOffset;    // correction factor for rounding axis scale numbers to nearest integer
  float yOffset;    // correction factor for rounding axis scale numbers to nearest integer
  
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
    textHeight=min(int(yInterval/(2*(yMax-yMin))*height), height/30);
    textSize(textHeight);
    textAlign(CENTER,CENTER);
    
    //draw gridlines, tick marks and numbers first to ensure that they are on the bottom layer
    if((xMin<=0)&&(xMax>=0)) xGridStart=xMin+(-xMin%xInterval);
    else xGridStart=xMin;
    if((yMin<=0)&&(yMax>=0)) yGridStart=yMin+(-yMin%yInterval);
    else yGridStart=yMin;
    for(int i=1; i<int((yMax-yMin)/yInterval); i++){
      if ((yGridStart+yInterval*i)>0) yOffset=0.5;
      else yOffset=-0.5;
      strokeWeight(1);
      stroke(200);
      line(0,map(yGridStart+yInterval*i,yMin,yMax,height,0),width, map(yGridStart+yInterval*i,yMin,yMax,height,0)); // grid lines
      strokeWeight(3);
      stroke(yColour);
      //if((xMin<-xInterval)&&(xMax>=0)){
      if((xMin<0)&&(xMax>=0)){
        line(map(0,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0),map(-xInterval/5,xMin,xMax,0,width), map(yGridStart+yInterval*i,yMin,yMax,height,0)); // tick marks
        if (abs(yGridStart+yInterval*i)>0.5*yInterval){
          fill(255);
          rectMode(CENTER);
          noStroke();
          rect(map(-0.5*xInterval,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0),textWidth(str(int(yGridStart+yInterval*i+yOffset))),textHeight);
          fill(yColour);
          text(str(int(yGridStart+yInterval*i+yOffset)),map(-0.5*xInterval,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0));
        }
      } else {
        line(map(xGridStart,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0),map(xGridStart+xInterval/5,xMin,xMax,0,width), map(yGridStart+yInterval*i,yMin,yMax,height,0)); // tick marks
        if (abs(yGridStart+yInterval*i)>0.5*yInterval){
          fill(255);
          rectMode(CENTER);
          noStroke();
          rect(map(0.5*xInterval,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0),textWidth(str(int(yGridStart+yInterval*i+yOffset))),textHeight);
          fill(yColour);
          text(str(int(yGridStart+yInterval*i+yOffset)),map(0.5*xInterval,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0));
        }
      }      
    }
    for(int i=1; i<int((xMax-xMin)/xInterval); i++){  //vertical gridlines, etc
      if ((xGridStart+xInterval*i)>0) xOffset=0.5;
      else xOffset=-0.5;
      strokeWeight(1);
      stroke(200);
      line(map(xGridStart+xInterval*i,xMin,xMax,0,width),0, map(xGridStart+xInterval*i,xMin,xMax,0,width),height ); // grid lines
      strokeWeight(3);
      stroke(xColour);
      //if((yMin<-yInterval)&&(yMax>=0)){  // check that the x-axis is in the "middle" of the window to put ticks marks and text below
      if((yMin<=-yInterval)&&(yMax>=0)){  // check that the x-axis is in the "middle" of the window to put ticks marks and text below
        if (abs(xGridStart+xInterval*i)>0.2*xInterval){  //check that the current point is sufficiently far from y-axis
          line(map(xGridStart+xInterval*i,xMin,xMax,0,width),map(0,yMin,yMax,height,0),map(xGridStart+xInterval*i,xMin,xMax,0,width), map(-yInterval/5,yMin,yMax,height,0)); // tick marks
          fill(255);
          rectMode(CENTER);
          noStroke();
          rect(map(xGridStart+xInterval*i,xMin,xMax,0,width), map(0,yMin,yMax,height,0)+1.3*textHeight,textWidth(str(int(xGridStart+xInterval*i+xOffset))),textHeight);
          fill(xColour);
          text(str(int(xGridStart+xInterval*i+xOffset)),map(xGridStart+xInterval*i,xMin,xMax,0,width), map(0,yMin,yMax,height,0)+1.5*textHeight);
        }
      } else {
        //line(map(xGridStart,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0),map(xGridStart+xInterval/5,xMin,xMax,0,width), map(yGridStart+yInterval*i,yMin,yMax,height,0)); // tick marks
        line(map(xGridStart+xInterval*i,xMin,xMax,0,width),map(0,yMin,yMax,height,0),map(xGridStart+xInterval*i,xMin,xMax,0,width), map(yInterval/5,yMin,yMax,height,0)); // tick marks
        fill(255);
        rectMode(CENTER);
        noStroke();
        rect(map(-0.5*xInterval,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0),textWidth(str(int(xGridStart+xInterval*i+xOffset))),textHeight);
        fill(xColour);
        text(str(int(xGridStart+xInterval*i+xOffset)),map(-0.5*xInterval,xMin,xMax,0,width),map(yGridStart+yInterval*i,yMin,yMax,height,0));
      }
    }
    
    strokeWeight(3);
    stroke(yColour);
    fill(yColour);
    if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
      line(max(2,map(0,xMin,xMax,0,width)),arrowLength,max(2,map(0,xMin,xMax,0,width)),height-arrowLength);  // draw y-axis
      arrowHead(int(map(0,xMin,xMax,0,width)), 0, 0, arrowLength);
      arrowHead(int(map(0,xMin,xMax,0,width)), height, PI, arrowLength);
    }

    stroke(xColour);
    fill(xColour);
    if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
      line(arrowLength, map(0,yMin,yMax,height,0),width-arrowLength,map(0,yMin,yMax,height,0));  // draw x-axis
      arrowHead(int(map(xMax,xMin,xMax,0,width)), int(map(0,yMin,yMax,height,0)), PI/2, arrowLength);
      arrowHead(0, int(map(0,yMin,yMax,height,0)), 1.5*PI, arrowLength);
    }
    stroke(255);
    strokeWeight(1);
    line(map(x-xIncrement,xMin,xMax,0,width),0,map(x-xIncrement,xMin,xMax,0,width),height);
    stroke(0);
    strokeWeight(1);
    line(map(x,xMin,xMax,0,width),0,map(x,xMin,xMax,0,width),height);
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



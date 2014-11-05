import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CartesianCoordinates_WholeNumbers_ extends PApplet {

int xColour = color(0,50,255);
int yColour = color(205,50,0);

int xMin=-10;
int xMax=10;
int yMin=-7;
int yMax=7;

int xSteps=20;  //number of tick marks between xMmin and xMax
int ySteps=14;  //number of tick marks between yMmin and yMax

Point point1 = new Point();


public void setup(){
  size(800,600);
  
  if (frame != null) {
    frame.setResizable(true);
  }
  
  //starting points hard-coded
  point1.xLoc=3;
  point1.yLoc=2;
}

public void draw(){
  background(255);
  drawAxes();
  point1.drag(mouseX,mouseY);
  point1.display();
  
  fill(0);
  strokeWeight(30);
  textSize(20);
}

public void mousePressed(){
  point1.click(mouseX, mouseY);
}

public void mouseReleased(){
  point1.dragging=false;
}

public void drawAxes(){
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
//class Line{
//  float m;  // slope of line
//  float c;  // y-intercept of the line (x-intercept for vertical line)
//  boolean vertical;  // true if vertical line
//  
//  Line(){ 
//  }
//  
//  void display(){
//    stroke(255,0,0);
//    strokeWeight(3);
//    fill(0);
//    textSize(20);
//    textAlign(LEFT);
//    if ((point1.xLoc==point2.xLoc)&&(point1.yLoc==point2.yLoc)){
//      text("no defined equation",10,30);
//    }
//    else{
//      if (point1.xLoc==point2.xLoc){
//        c=point1.xLoc;
//        line(map(c,xMin,xMax,0,width),0,map(c,xMin,xMax,0,width),height);
//        text("x="+String.format("%.2f",c),10,30);
//      }else{
//        m=(point1.yLoc-point2.yLoc)/(point1.xLoc-point2.xLoc);
//        c=point1.yLoc-(m*point1.xLoc);
//        line(0, map(m*xMin+c,yMin,yMax,height,0), width, map(m*xMax+c,yMin,yMax,height,0));
//        if (c<0) text("y="+String.format("%.2f",m)+"x-"+String.format("%.2f",-c),10,30);
//        else text("y="+String.format("%.2f",m)+"x+"+String.format("%.2f",c),10,30);
//      }
//      // display equation
//      
//    }
//  }
//}
class Point{
  int xLoc;  //xlocation in cartesian coordinates
  int yLoc;  //ylocation in cartesian coordinates
  int dDisp=16;  //display diameter of point
  boolean dragging=false;
  int xOffset;  //in pixels
  int yOffset;  //in pixels
  
  Point(){
  }
  
  public void display(){
    dDisp=height/15;
    stroke(0);
    if (dragging) drawGuides();
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    if ((contains(mouseX, mouseY))||dragging) fill(150);
    ellipse(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0), dDisp, dDisp);
    displayCoordinates();
  }
  
  public boolean contains(int x, int y){
    int rTouch=20;  // acceptable touch radius from point (in pixels)
    int xPix = PApplet.parseInt(map(xLoc,xMin,xMax,0,width));
    int yPix = PApplet.parseInt(map(yLoc,yMin,yMax,height,0));
    if ((rTouch*rTouch)>((x-xPix)*(x-xPix)+(y-yPix)*(y-yPix))) return true;
    else return false;
  }
  
  public void click(int x, int y){
    if (contains(x,y)){
      dragging=true;
      xOffset=PApplet.parseInt(x-map(xLoc,xMin,xMax,0,width));
      //testDebug=str(xOffset);
      yOffset=PApplet.parseInt(y-map(yLoc,yMin,yMax,height,0));
    }
  }
  
  public void drag(int x, int y){
    if (dragging){
      xLoc=xMin+PApplet.parseInt((PApplet.parseFloat(x-xOffset)/width)*(xMax-xMin)+0.5f);
      yLoc=yMax-PApplet.parseInt((PApplet.parseFloat(y-yOffset)/height)*(yMax-yMin)+0.5f);
    }
  }
  
  public void displayCoordinates(){
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
      horizOffset=-3*dDisp/4-PApplet.parseInt(textWidth("("+str(xLoc)+","+str(yLoc)+")"));      
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
  
  public void drawGuides(){
    strokeWeight(1);
    stroke(0);
    line(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0),map(0,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0));
    line(map(xLoc,xMin,xMax,0,width),map(yLoc,yMin,yMax,height,0),map(xLoc,xMin,xMax,0,width),map(0,yMin,yMax,height,0));
  }
}  
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CartesianCoordinates_WholeNumbers_" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

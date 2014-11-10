float xMin=0;  // left side of the display region
float xMax=20;   // right side of the display region
float xInterval=2;  // how far apart tick marks and grid lines are along the x-axis
float yMin=-50;  // bottom of the display region
float yMax=200;  // top of the display region
float yInterval=50;  // how far apart tick marks and grid lines are along the y-axis
float xIncrement=0.5;  // how much the x value of the dot increases each step
float x;          // x value of the current trace (for all points)

color yColour = color(255,0,0);  // set a colour linked to the y-axis and y-values
color xColour = color(0,0,255);  // set a colour linked to the y-axis and y-values

Axes axes = new Axes();    // create the x-axis, y-axis and gridline system
Point point1 = new Point("f(x)", xMin,0);  // create a new point with x-coordinate set to the left side of the display region
Point point2 = new Point("g(x)", xMin,1);  // create a new point with x-coordinate set to the left side of the display region
Point point3 = new Point("f(g(x))", xMin,2);  // create a new point with x-coordinate set to the left side of the display region


void setup(){
  size(800,600);               // set an initial window size (width,height)
  background(255);             // make the background white
  
  if (frame != null) {         // check if the program is running in a frame
    frame.setResizable(true);  // allow the user to resize (and maximise) the window 
  }
  frameRate(15);  // set the number of times per second that the draw() method is run
  
  x=xMin;    // set x to far left of window
  point1.colour=color(0,0,0); // set point1 to be displayed in black
  point2.colour=color(150,0,150); // set point2 to be displayed in purple
  point3.colour=color(0,150,0); // set point3 to be displayed in dark green
}

void draw(){
  fadeScreen(min(1,2*xInterval/(xMax-xMin)));  // cover the whole window with a translucent rectangle to "fade out" previously-drawn items
  
  // Calculate the y values of the point(s)
  point1.yValue=f(x);  // calculate the y value as a function of its current x value
  point2.yValue=g(x);  // calculate the y value as a function of its current x value
  point3.yValue=f(g(x));  // calculate the y value as a function of its current x value

  axes.display();    // display the background axes (including gridlines)
  point1.display();  // display the point(s)
  point2.display();  // display the point(s)
  point3.display();  // display the point(s)
  
  x = x + xIncrement;  // increase the x value by the x increment for the next draw cycle
  if (x>xMax) x=xMin;  // if the maximum x value has been exceeded, reset the value to the minimum value
}

float f(float x){  //  This is the function f(x) that is used to calculate a value from a provided input value
  float output;

  // put your function here
  output=x*x/5;  // calculate the utput value using the provided input value
  // end of user function

  return output;  // returns the value calculated above
}

float g(float x){  //  This is the function f(x) that is used to calculate a value from a provided input value
  float output;

  // put your function here
  output=2*x-10;  // calculate the output value using the provided input value
  // end of user function

  return output;  // returns the value calculated above
}

void fadeScreen(float proportion){
  if (proportion>1) proportion=1;
  if (proportion<0) proportion=0;
  fill(255, map(proportion,0,1,0,255));  // set a white fill with transparency set by indicated percentage
  noStroke();
  rectMode(NORMAL);
  rect(0,0,width,height);
}



float xMin=-10;  // left side of the display region
float xMax=10;   // right side of the display region
float yMin=-10;  // bottom of the display region
float yMax=100;  // top of the display region
float xIncrement=0.05;  // how much the x value of the dot increases each step
float x;          // x value of the current trace (for all points)

color yColour = color(255,0,0);  // set a colour linked to the y-axis and y-values
color xColour = color(0,0,255);  // set a colour linked to the y-axis and y-values

Axes axes = new Axes();    // create the x-axis, y-axis and gridline system
Point point1 = new Point("f(x)", xMin,0);  // create a new point with x-coordinate set to the left side of the display region
Point point2 = new Point("g(x)", xMin,1);  // create a new point with x-coordinate set to the left side of the display region


void setup(){
  size(800,600);               // set an initial window size (width,height)
  background(255);             // make the background white
  
  if (frame != null) {         // check if the program is running in a frame
    frame.setResizable(true);  // allow the user to resize (and maximise) the window 
  }
  frameRate(20);  // set the number of times per second that the draw() method is run
  
  x=xMin;    // set x to far left of window
  point1.colour=color(0,0,0); // set point1 to be displayed in black
  point2.colour=color(150,0,150); // set point1 to be displayed in black
}

void draw(){
  fadeScreen(95);  // cover the whole window with a translucent rectangle to "fade out" previously-drawn items
  
  // Calculate the y values of the point(s)
  point1.yValue=f(x);  // calculate the y value as a function of its current x value
  point2.yValue=g(x);  // calculate the y value as a function of its current x value

  axes.display();    // display the background axes (including gridlines)
  point1.display();  // display the point(s)
  point2.display();  // display the point(s)
  
  x = x + xIncrement;  // increase the x value by the x increment for the next draw cycle
  if (x>xMax) x=xMin;  // if the maximum x value has been exceeded, reset the value to the minimum value
}

float f(float x){  //  This is the function f(x) that is used to calculate a value from a provided input value
  float output;

  // put your function here
  output=x*x;  // calculate the utput value using the provided input value
  // end of user function

  return output;  // returns the value calculated above
}

float g(float x){  //  This is the function f(x) that is used to calculate a value from a provided input value
  float output;

  // put your function here
  output=5*x+50;  // calculate the utput value using the provided input value
  // end of user function

  return output;  // returns the value calculated above
}

void fadeScreen(float percent){
  fill(255, map(percent,100,0,0,255));  // set a white fill with transparency set by indicated percentage
  noStroke();
  rectMode(NORMAL);
  rect(0,0,width,height);
}



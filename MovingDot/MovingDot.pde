float xMin=-10;  // left side of the display region
float xMax=10;   // right side of the display region
float yMin=-10;  // bottom of the display region
float yMax=100;  // top of the display region
float xIncrement=0.1;  // how much the x value of the dot increases each step

color yColour = color(255,0,0);  // set a colour linked to the y-axis and y-values
color xColour = color(0,0,255);  // set a colour linked to the y-axis and y-values

Axes axes = new Axes();    // create the x-axis, y-axis and gridline system
Point point1 = new Point(xMin);  // create a new point with x-coordinate set to the left side of the display region

void setup(){
  size(800,600);               // set an initial window size (width,height)
  background(255);             // make the background white
  if (frame != null) {         // check if the program is running in a frame
    frame.setResizable(true);  // allow the user to resize (and maximise) the window 
  }
  frameRate(20);  // set the number of times per second that the draw() method is run
  
  point1.colour=color(0,0,0); // set point1 to be displayed in black
}

void draw(){
  fill(255,30);  // set the fill colour to translucent white
  rect(0,0,width,height);  // cover the whole window with a translucent rectangle to "fade out" previously-drawn items
  
  // Calculate the y values of the point(s)
  float point1.yValue=f(x);  // calculate the y value as a function of the current x value
  
  axes.display();    // display the background axes (including gridlines)
  point1.display();  // display the point(s)
  
  point1.xValue = point1.xValue + xIncrement;  // increase the x value by the x increment for the next draw cycle
  if (point1.xValue>xMax) point1.xValue=xMin;  // if the maximum x value has been exceeded, reset the value to the minimum value
}

//  This is the function f(x) that is used to calculate a value from a provided input value
float f(float x){
  float output;
  // put your function here
  output=x*x;  // calculate the utput value using the provided input value
  return output;
}



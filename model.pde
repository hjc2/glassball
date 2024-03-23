


void drawModel(){

// Draw axes for reference
  strokeWeight(4);
  stroke(255, 0, 0); line(-100, 0, 0, 100, 0, 0); // X axis in red
  stroke(0, 255, 0); line(0, 0, 0, 0, 100, 0); // Y axis in green
  stroke(0,255,120); line(0,-100,0,0,0,0);
  stroke(0, 0, 255); line(0, 0, -100, 0, 0, 100); // Z axis in blue

strokeWeight(15);
 stroke(255,255,0); point(50,-50,-50);
 stroke(0,255,255); point(50,-50,50);
 stroke(255,0,255); point(-50,-50,-50);

  // Reset stroke color to white for the cube
  stroke(255);
  
  // Draw a cube at the origin
  pushMatrix();
  translate(0, 0, 0); // Move to the origin
  strokeWeight(2);
  stroke(80);
  box(100); // Draw a cube with 100 units side length
  popMatrix();
} 
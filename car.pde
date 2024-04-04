
void drawCar(){
      
    pushMatrix();
  // Translate the entire car to the center of the canvas
  
  // Draw car body
  fill(255, 0, 0); // Red color for the car body
  pushMatrix(); // Save the current transformation matrix
  // No need to move the car body because it's already at (0,0,0) after the translate above
  box(100, 50, 20); // Draw the main body of the car
  popMatrix(); // Restore the transformation matrix
  
  // Draw wheels
  fill(0); // Black color for the wheels
  drawWheel(-40, 25, 10); // Front left wheel
  drawWheel(40, 25, 10); // Front right wheel
  drawWheel(-40, -25, 10); // Rear left wheel
  drawWheel(40, -25, 10); // Rear right wheel
  popMatrix();
}

void drawWheel(float x, float y, float size) {
  pushMatrix(); // Save the current transformation matrix
  translate(x, y, -10); // Move to the wheel's position
  rotateX(PI/2); // Rotate the wheel to be perpendicular to the car body
  box(size, size, 5); // Draw the wheel as a thin, wide box to simulate a cylinder
  popMatrix(); // Restore the transformation matrix
}

// next, make this on the same track as the strip.
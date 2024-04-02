


void drawMobiusStrip(float loops) {

  int stepsLength = 60;
  int stepsWide = 2;
  float uStep = TWO_PI / stepsLength;
  float vStep = 2.0 / stepsWide;
  for (float u = 0; u <= TWO_PI * loops; u += uStep) {

    beginShape(TRIANGLE_STRIP);
    // noStroke();
    strokeWeight(1);
    stroke(0);

    for (float v = -1; v <= 1; v += vStep) {
      for (int i = 0; i < 2; i++) {
        float uOffset = (i == 0) ? 0 : uStep;
        float x = (1 + (v / 2) * cos((u + uOffset) / 2)) * cos(u + uOffset);
        float y = (1 + (v / 2) * cos((u + uOffset) / 2)) * sin(u + uOffset);
        float z = (v / 2) * sin((u + uOffset) / 2);
    
        colorMode(HSB, 360, 100, 100);

        fill(120);

        vertex(x * 100, y * 100, z * 100); // Scale up the size to make it visible
      }
    }
    endShape();
  }
}

PVector calculateMobiusPoint(float angleDegrees, float vOffset) {
  // Convert angle from degrees to radians
  float angleRadians = radians(angleDegrees);
  
  // Since the angle range is 0 to 720, we map it to 0 to TWO_PI for a complete cycle around the strip
  // We use angleRadians / 2 because the strip makes a full twist (360 degrees) over a range of TWO_PI radians
  float u = angleRadians / 2;
  
  // Use the provided vOffset to determine the side of the strip
  // vOffset should be between -1 and 1. For example, use 0.5 or -0.5 to place the point on one side.
  float v = vOffset; 
  
  // Calculate the point using the parametric equations for a Mobius strip
  float x = (1 + (v / 2) * cos(u / 2)) * cos(u);
  float y = (1 + (v / 2) * cos(u / 2)) * sin(u);
  float z = (v / 2) * sin(u / 2); // Apply the surface offset here
  println(z);
  // Scale the coordinates (if necessary) to match the visualization scale
  // Here, multiplying by 100 as done in your drawMobiusStrip function
  return new PVector(x * 100, y * 100, (z) * 100); // Adjust z by adding the surfaceOffset
}

PVector calculateOffsetMobiusPoint(float angleDegrees, float offsetDistance) {
  float angleRadians = radians(angleDegrees); // Convert angle to radians
  
  // Simplified calculation for the center line of the Mobius strip
  float u = angleRadians / 2; // Mapping 720 degrees to a full loop
  
  // Basic Mobius strip parameters for the centerline
  float x = cos(u);
  float y = sin(u);
  float z = 0; // Centerline, so no vertical offset initially
  
  // Approximate normal direction
  // For a Mobius strip, normal direction changes along the strip. Here, we approximate it for visual effect.
  // Note: This is a simplified and not mathematically precise method.
  float nx = cos(u / 2) * cos(u); // Simplified normal x component
  float ny = cos(u / 2) * sin(u); // Simplified normal y component
  float nz = sin(u / 2);          // Simplified normal z component
  
  // Normalize the normal vector
  float length = sqrt(nx * nx + ny * ny + nz * nz);
  nx /= length;
  ny /= length;
  nz /= length;
  
  // Offset the point along the approximate normal direction
  x += nx * offsetDistance;
  y += ny * offsetDistance;
  z += nz * offsetDistance; // Adding the offset to z based on the normal's z component
  
  // Scaling the coordinates for visualization
  return new PVector(x * 100, y * 100, z * 100);
}
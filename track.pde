
void drawMobiusStrip() {
  int stepsLength = 120;
  int stepsWide = 10;

  float uStep = TWO_PI / stepsLength;
  float vStep = 2.0 / stepsWide;
  
  // Light setup
  colorMode(RGB);
  ambientLight(102, 102, 102);

  for (float u = 0; u <= TWO_PI * 3; u += uStep) {
    beginShape(TRIANGLE_STRIP);
    noStroke();
    for (float v = -1; v <= 1; v += vStep) {
      for (int i = 0; i < 2; i++) {
        float uOffset = (i == 0) ? 0 : uStep;
        float x = (1 + (v / 2) * cos((u + uOffset) / 2)) * cos(u + uOffset);
        float y = (1 + (v / 2) * cos((u + uOffset) / 2)) * sin(u + uOffset);
        float z = (v / 2) * sin((u + uOffset) / 2);

        PVector normal = calculateNormal(u + uOffset, v);
        if(normie){
          normal(normal.x, normal.y, normal.z);
        }
        
        colorMode(HSB);
        fill(140, 0, 140); // HSB color mode
        specular(0, 200, 120); // White specular highlights
        shininess(200); // Shininess

        vertex(x * 100, y * 100, z * 100); // Scale up the size to make it visible
      }
    }
    endShape();
  }

  // Drawing the border
  stroke(0); // Set border color
  strokeWeight(2); // Set border thickness
  noFill(); // Ensure that only the border is drawn

  for (float u = 0; u <= TWO_PI * 3; u += uStep) {
    beginShape(LINE_STRIP);
    float v = 1; // You can change this to 1 to draw the border on the other edge
    for (int i = 0; i < 2; i++) {
      float uOffset = (i == 0) ? 0 : uStep;
      float x = (1 + (v / 2) * cos((u + uOffset) / 2)) * cos(u + uOffset);
      float y = (1 + (v / 2) * cos((u + uOffset) / 2)) * sin(u + uOffset);
      float z = (v / 2) * sin((u + uOffset) / 2);
      vertex(x * 100, y * 100, z * 100);
    }
    endShape();
  }

}

PVector calculateNormal(float u, float v) {
  // Calculate partial derivatives
  float dxdu = -sin(u) * (1 + v * cos(u / 2)) - 0.5 * v * sin(u / 2) * cos(u);
  float dydu = cos(u) * (1 + v * cos(u / 2)) - 0.5 * v * sin(u / 2) * sin(u);
  float dzdu = 0.5 * v * cos(u / 2);
  
  float dxdv = cos(u / 2) * cos(u);
  float dydv = cos(u / 2) * sin(u);
  float dzdv = sin(u / 2);
  
  PVector du = new PVector(dxdu, dydu, dzdu);
  PVector dv = new PVector(dxdv, dydv, dzdv);
  PVector normal = du.cross(dv);
  normal.normalize();
  
  return normal;
}

// Function to calculate a point's position considering both an offset along and perpendicular to the Möbius strip
PVector calculatePositionWithOffsets(float angleDegrees, float vOffset, float normalOffset) {
  float u = radians(angleDegrees); // Angle converted to radians for the longitudinal position
  
  // Adjust v according to the desired offset along the strip's width
  float v = vOffset; // Directly control the position along the strip's width
  
  // Parametric equations for the Möbius strip
  float x = (1 + v * cos(u / 2)) * cos(u);
  float y = (1 + v * cos(u / 2)) * sin(u);
  float z = v * sin(u / 2);
  
  // Calculate the normal vector at this point
  PVector normal = calculateNormal(u, v);
  
  // Apply the normal offset
  x += normal.x * normalOffset;
  y += normal.y * normalOffset;
  z += normal.z * normalOffset;
  
  return new PVector(x * 100, y * 100, z * 100); // Scale for visualization
}




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


PVector calculateMobiusPoint(float angleDegrees) {
  // Convert angle from degrees to radians
  float angleRadians = radians(angleDegrees);
  
  // Since the angle range is 0 to 720, we map it to 0 to TWO_PI for a complete cycle around the strip
  // We use angleRadians / 2 because the strip makes a full twist (360 degrees) over a range of TWO_PI radians
  float u = angleRadians / 2;
  
  // For a Mobius strip, v is fixed at the midline for this calculation
  float v = 0; // Adjust this value between -1 and 1 if you want to explore points off the center line
  
  // Calculate the point using the parametric equations for a Mobius strip
  float x = (1 + (v / 2) * cos(u / 2)) * cos(u);
  float y = (1 + (v / 2) * cos(u / 2)) * sin(u);
  float z = (v / 2) * sin(u / 2);
  
  // Scale the coordinates (if necessary) to match the visualization scale
  // Here, multiplying by 100 as done in your drawMobiusStrip function
  return new PVector(x * 100, y * 100, z * 100);
}
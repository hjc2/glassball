


void drawMobiusStrip(float loops) {
  float uStep = TWO_PI / 10;
  float vStep = 2.0 / 5;
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

        int cola = color(map(u + uOffset, 0, TWO_PI * loops, 0, 360), 100, 100);
        fill(cola);
        vertex(x * 100, y * 100, z * 100); // Scale up the size to make it visible
      }
    }
    endShape();
  }
}
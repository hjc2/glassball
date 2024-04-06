

void drawBall(int time, float vOffset, float normalOffset, int c){
    // PVector ballpoint = calculateOffsetPoint(time, offset);

	PVector ballpoint = calculatePositionWithOffsets(time, vOffset, normalOffset);

	PVector lightPoint = calculatePositionWithOffsets(time, vOffset + 10, normalOffset);

	colorMode(HSB);
		// Set material properties
	fill(c, 255, 255); // HSB color mode
	specular(c, 20, 255); // White specular highlights
	shininess(120); // Shininess

	pushMatrix();
	translate(ballpoint.x, ballpoint.y, ballpoint.z);
	noStroke();
	sphere(10);
	popMatrix();
}
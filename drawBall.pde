

void drawBall(int time, float vOffset, float normalOffset, int c){
    // PVector ballpoint = calculateOffsetPoint(time, offset);

	PVector ballpoint = calculatePositionWithOffsets(time, vOffset, normalOffset);
	PVector lightPoint = calculatePositionWithOffsets(time + 5 ,vOffset, normalOffset);
	colorMode(HSB);
		// Set material properties

	fill(c, 255, 255); // HSB color mode

	specular(c, 40, 255); // White specular highlights
	shininess(120); // Shininess

	pushMatrix();
	translate(ballpoint.x, ballpoint.y, ballpoint.z);
	noStroke();
	sphere(10);
	popMatrix();

	pushMatrix();
	translate(lightPoint.x, lightPoint.y, lightPoint.z);
	pointLight(c, 255, 120, 0,0,0);
	popMatrix();

}
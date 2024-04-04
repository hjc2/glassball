

void drawBall(int time, float vOffset, float normalOffset){
    // PVector ballpoint = calculateOffsetPoint(time, offset);

  PVector ballpoint = calculatePositionWithOffsets(time, vOffset, normalOffset);

  PVector lightPoint = calculatePositionWithOffsets(time, vOffset + 10, normalOffset);

	pushMatrix();
	translate(ballpoint.x, ballpoint.y, ballpoint.z);
	noStroke();
	drawCar();
	// sphere(10);
	// pointLight(lightPoint.x, lightPoint.y, lightPoint.z, 255,255,255);
	popMatrix();
}
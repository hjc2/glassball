

void drawBall(int time, float vOffset, float normalOffset){
    // PVector ballpoint = calculateOffsetPoint(time, offset);

  PVector ballpoint = calculatePositionWithOffsets(time, vOffset, normalOffset);

	pushMatrix();
	translate(ballpoint.x, ballpoint.y, ballpoint.z);
	noStroke();
	sphere(10);
	popMatrix();
}
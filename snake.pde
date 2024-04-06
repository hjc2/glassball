


void drawSnake(int time, float vOffset, float normalOffset, int c){


	PVector backPoint = calculatePositionWithOffsets(time, vOffset, normalOffset);
	PVector frontPoint = calculatePositionWithOffsets(time + 5 ,vOffset, normalOffset);

	noFill();
	strokeWeight(5);
	stroke(175,255,255);
	line(backPoint.x, backPoint.y, backPoint.z, frontPoint.x, frontPoint.y, frontPoint.z);
}
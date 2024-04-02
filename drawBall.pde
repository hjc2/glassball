

void drawBall(int time, float offset){
    PVector ballpoint = calculateOffsetMobiusPoint(time, offset);
	pushMatrix();
	translate(ballpoint.x, ballpoint.y, ballpoint.z);
	noStroke();
	sphere(10);
	popMatrix();
}
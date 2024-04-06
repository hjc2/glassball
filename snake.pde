



class Snake {

	int timeOffset;
	float vOffset;
	float normalOffset;
	int c;
	int myLen;
	float timeMultiplier;

	void drawSnake(int time){
		PVector backPoint = calculatePositionWithOffsets(time * timeMultiplier + timeOffset, vOffset, normalOffset);

		colorMode(HSB);
		noFill();
		strokeWeight(5);
		stroke(c,255,255);
		specular(c,200,255);
		shininess(120);

		beginShape();
		for(int i = 0; i < myLen; i+= 5){
			backPoint = calculatePositionWithOffsets(time * timeMultiplier + timeOffset + i, vOffset, normalOffset);
			vertex(backPoint.x, backPoint.y, backPoint.z);
		}
		endShape();
	}

	Snake(){
		timeOffset = int(random(0,715));
		vOffset = random(-0.5, 0.5);
		normalOffset = 0.1;
		c = int(random(0,255));
		myLen = int(random(10,40));
		timeMultiplier = randomGaussian() + 1;
	}
}

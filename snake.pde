



class Snake {

	int timeOffset;
	float vOffset;
	float normalOffset;
	int c;
	int b;
	int k;
	int myLen;
	float timeMultiplier;

	void drawSnake(int time){
		PVector backPoint = calculatePositionWithOffsets(time * timeMultiplier + timeOffset, vOffset, normalOffset);

		colorMode(HSB);
		noFill();
		strokeWeight(5);
		stroke(c,k,255);
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
		normalOffset = (randomGaussian() + 0.0001 ) / 20 + 0.05;
		c = int(random(0,255));
		// c = int(180 + randomGaussian() * 20 + random(-20,20));
		k = int(235 + randomGaussian() * 20);
		// b = int(randomGaussian() * 40 + 215);
		myLen = int(random(10,20) * (randomGaussian() + 1.01));


		timeMultiplier = randomGaussian() + 1.1;
	}
}

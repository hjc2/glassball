

void drawBall(int time, float vOffset, float normalOffset){
    // PVector ballpoint = calculateOffsetPoint(time, offset);

  PVector ballpoint = calculatePositionWithOffsets(time, vOffset, normalOffset);

  PVector lightPoint = calculatePositionWithOffsets(time, vOffset + 10, normalOffset);

	pushMatrix();
	// translate(ballpoint.x, ballpoint.y, ballpoint.z);

	noStroke();

	float angleDegrees = 45;
	// float vOffset = 0;
	PVector position = ballpoint;
	PVector normal = calculateNormal(radians(angleDegrees), vOffset); 
	
	// drawCar();
	pushMatrix();
	// Move the origin to the position where the rectangle should be
	translate(position.x, position.y, position.z);
	
	// Align the rectangle with the Möbius strip normal
	alignRectangleWithNormal(normal);

	sphere(10);
	box(30,5,5);
	
	popMatrix();
	// pointLight(lightPoint.x, lightPoint.y, lightPoint.z, 255,255,255);
	popMatrix();
}

void alignRectangleWithNormal(PVector normal) {
  PVector up = new PVector(0, 0, 1); // Initial rectangle normal (z-axis)
  
  // Calculate rotation axis (cross product of up and the normal vector)
  PVector axis = up.cross(normal);
  
  // Calculate the angle between the up vector and the normal vector
//   float angle = acos(up.dot(normal) / (up.mag() * normal.mag()));
  
  // Rotate around the calculated axis by the calculated angle
  rotate(time * PI / 2 / 360, axis.x, axis.y, axis.z);
}
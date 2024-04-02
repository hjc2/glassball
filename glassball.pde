
import toxi.geom.*;

PVector horizontal = new PVector(1, 0, 0);
PVector vertical = new PVector(0, -1, 0);
int time = 0;

void setup() {
    size(500, 500, P3D);
    translate(250, 250);
    pushMatrix();
}

void draw() {
    popMatrix();
    background(100);
    lights();
    
  directionalLight(255, 255, 255, 0, 0, -1); // Additional directional light
  directionalLight(255, 255, 255, 0, 0, 1); // Additional directional light


    // strokeWeight(6);
    // stroke(255);
    // line(0, 0, 0, horizontal.x * height, horizontal.y * height, horizontal.z * height);
    // line(0, 0, 0, vertical.x * height, vertical.y * height, vertical.z * height);
    
    // // drawModel();

	drawMobiusStrip(3);
    

	PVector ballpoint = calculateMobiusPoint(time, 0.5);
	pushMatrix();
	translate(ballpoint.x, ballpoint.y, ballpoint.z);
	sphere(10);
	popMatrix();



	time += 5;
    pushMatrix();
}


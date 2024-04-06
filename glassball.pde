
import toxi.geom.*;

PVector horizontal = new PVector(1, 0, 0);
PVector vertical = new PVector(0, -1, 0);
int time = 0;

boolean normie = true;

void setup() {
    size(500, 500, P3D);
    translate(250, 250);
    pushMatrix();
}

void draw() {
    popMatrix();
    background(100);
    lights();
    
	drawMobiusStrip();
    
    colorMode(HSB);
	drawBall(time, 0.5, 0.1, 0);
	drawBall(time, 0.0, 0.1, 120);
	drawBall(time, -0.5, 0.1, 240);

	time += 5;
    time = time % 720;
    if(normie){
        text("normals on", 0,0,0);
    }
    pushMatrix();
    
}


Sierpinski s = new Sierpinski();

float angle = -HALF_PI / 6; // phi
float elevation = 0; // theta
float distance = 450;

float roll = 0;

boolean mp = false;
float mpx = 0.0;

boolean lmp = false;
float lmpx = 0.0;
float lmpy = 0.0;

int timer = 0;



void setup() {
    size(600,600, P3D); // Use P3D renderer for 3D drawing
}

void draw() {

    if (mousePressed && (mouseButton == LEFT)) {
        if(!lmp){
            lmp = true;
            lmpx = mouseX;
            lmpy = mouseY;
        } else {
            float deltaX = mouseX - lmpx;
            float deltaY = mouseY - lmpy;
            lmpx = mouseX;
            lmpy = mouseY;
            angle += ((elevation <= HALF_PI && elevation > -HALF_PI) ? (1) : -1) * map(deltaX,-600, 600, -TWO_PI, TWO_PI);
            elevation += map(deltaY,-600, 600, PI, -PI);
        }
    } else {
        lmpx = 0;
        lmpy = 0;
        lmp = false;
    }


<<<<<<< Updated upstream
    background(0); // Set background to black
=======
    // strokeWeight(6);
    // stroke(255);
    // line(0, 0, 0, horizontal.x * height, horizontal.y * height, horizontal.z * height);
    // line(0, 0, 0, vertical.x * height, vertical.y * height, vertical.z * height);
    
    // // drawModel();
>>>>>>> Stashed changes

    // elevation -= HALF_PI / 50;

    angle = boundAngle(angle);
    elevation = boundElevation(elevation);

    calculateReals(angle, elevation, distance);

    drawModel();
    // s.drawModel();
}


void mouseClicked(){

<<<<<<< Updated upstream
        // elevation += HALF_PI / 10;
=======
	time += 5;
    time = time % 720;
    pushMatrix();

	// saveFrame("mobius-####.png");
>>>>>>> Stashed changes

}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  distance += -10 * e;
}

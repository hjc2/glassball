


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

    background(0); // Set background to black

    elevation += HALF_PI / 50;

    angle = boundAngle(angle);
    elevation = boundElevation(elevation);

    calculateReals(angle, elevation, distance);

    drawModel();
}


void mouseClicked(){

        // elevation += HALF_PI / 10;

}

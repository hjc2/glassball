
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


    background(0); // Set background to black

    // elevation -= HALF_PI / 50;

    angle = boundAngle(angle);
    elevation = boundElevation(elevation);

    calculateReals(angle, elevation, distance);

    drawModel();
    // s.drawModel();
}


void mouseClicked(){

        // elevation += HALF_PI / 10;

}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  distance += -10 * e;
}

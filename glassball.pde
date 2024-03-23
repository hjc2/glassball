


float angle = -HALF_PI / 6; // phi
float elevation = -HALF_PI / 3; // theta
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

    // elevation += HALF_PI / 64;

    //Calculate camera's position in spherical coordinates
    float camX = distance * cos(elevation) * cos(angle);
    float camY = distance * sin(elevation);
    float camZ = distance * cos(elevation) * sin(angle);

    float upY = 0;

    if(timer > 200){
        upY = -1.0;
    } else {
        upY = 1.0;
    }
    timer += 1;
    if(timer > 400){
        timer = 0;
    }

    camera(camX, camY, camZ, 0, 0, 0, 0, upY, 0);

    drawModel();
}

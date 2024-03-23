


float angle = 0.0; // phi
float elevation = 0.0; // theta
float distance = 450;

float roll = 0;

boolean mp = false;
float mpx = 0.0;

boolean lmp = false;
float lmpx = 0.0;
float lmpy = 0.0;

void setup() {
    size(600,600, P3D); // Use P3D renderer for 3D drawing
}

void draw() {

    if (mousePressed && (mouseButton == RIGHT)) {
        if(!mp){
            mp = true;
            mpx = mouseX;
        } else {
            float deltaX = mouseX - mpx;
            mpx = mouseX;
            roll += map(deltaX,-600, 600, -TWO_PI, TWO_PI);
        }
    } else {
        mpx = 0;
        mp = false;
    }

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
            angle += map(deltaX,-600, 600, -HALF_PI, HALF_PI);
            elevation += map(deltaY,-600, 600, HALF_PI, -HALF_PI);
        }
    } else {
        lmpx = 0;
        lmpy = 0;
        lmp = false;
    }


    background(0); // Set background to black

    //Calculate camera's position in spherical coordinates
    float camX = distance * cos(elevation) * cos(angle);
    float camY = distance * sin(elevation);
    float camZ = distance * cos(elevation) * sin(angle);

    // angle += PI / 120;
    println(angle);
    //Set camera position, view center, and up direction
    beginCamera();
    camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
    rotateX(roll);
    endCamera();

    println(camX + " " + camY + " " +  camZ);
    drawModel();
}




float angle = 0.0; // phi
float elevation = 0.0; // theta
float distance = 450;

float roll = 0;

boolean mp = false;
float mpx = 0;

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
            roll += map(deltaX,-300, 300, -HALF_PI, HALF_PI);
        }
    } else {
        mpx = 0;
        mp = false;
    }

    background(0); // Set background to black

    angle = 0;
    elevation = HALF_PI / 5;

    //Calculate camera's position in spherical coordinates
    float camX = distance * cos(elevation) * cos(angle);
    float camY = distance * sin(elevation);
    float camZ = distance * cos(elevation) * sin(angle);

    // roll += PI / 120;
    //Set camera position, view center, and up direction
    beginCamera();
    camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
    rotateX(roll);
    endCamera();

    println(camX + " " + camY + " " +  camZ);
    drawModel();
}

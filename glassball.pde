


float angle = 0.0; // phi
float elevation = 0.0; // theta
float distance = 300;

void setup() {
    size(600,600, P3D); // Use P3D renderer for 3D drawing
}

void draw() {
    background(0); // Set background to black
    
    // angle = map(mouseX, 0, width, 0, TWO_PI);
    angle = 0;
    // elevation = map(mouseY, 0, height, -HALF_PI, HALF_PI);
    elevation += PI / 120;

    //Calculate camera's position in spherical coordinates
     float camX = distance * cos(elevation) * cos(angle);
     float camY = distance * sin(elevation);
     float camZ = distance * cos(elevation) * sin(angle);
      float upZ = (elevation <= HALF_PI && elevation >= -HALF_PI) ? 1 : -1; // Adjust camera up direction based on elevation

    //Set camera position, view center, and up direction
    camera(camX, camY, camZ, 0, 0, 0, 0, 1, upZ);
    
    drawModel();
}

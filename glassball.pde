

float angle = 0;       // phi
float elevation = 0;  // theta

float distance = 450;

float speed = PI / 20;

void setup() {
    size(600,600, P3D); // Use P3D renderer for 3D drawing
}

void draw() {


    background(0); // Set background to black

    angle = boundAngle(angle);
    elevation = boundElevation(elevation);

    calculateReals(angle, elevation, distance);

    drawModel();
    if(keyPressed){
        if(keyCode == RIGHT){
            angle += speed;
        }
        if(keyCode == LEFT){
            angle -= speed ;
        }
        if(keyCode == UP){
            elevation -= speed / 2;
        }
        if(keyCode == DOWN){
            elevation += speed / 2;
        }
        println(angle * 180 / PI);
        println(elevation * 180 / PI);
        println("--");
    }
}


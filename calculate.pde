

float boundAngle(float angle){
    if(angle > TWO_PI){
        return(angle - TWO_PI);
    } else if(angle < 0){
        return(angle + TWO_PI);
    }
    return(angle);
    // probably could mod but float
}

PVector rotateUpVector(float roll, PVector up) {
  // Assuming the roll rotation is around the Z-axis for simplicity
  float newX = up.x * cos(roll) - up.y * sin(roll);
  float newY = up.x * sin(roll) + up.y * cos(roll);
  float newZ = up.z; // Z component remains unchanged for roll around the Z-axis
  
  return new PVector(newX, newY, newZ);
}


float boundElevation(float elevation){
    if(elevation > PI + HALF_PI){
        return(elevation - TWO_PI);
    } else if(elevation < - HALF_PI){
        return(elevation + TWO_PI);
    }
    return(elevation);
}

void calculateReals(float angle, float elevation, float distance, float roll){

    float a = angle;
    float e = elevation;

    float upy = 1.0;

    if(elevation > HALF_PI){
        a += PI;
        e -= HALF_PI - (elevation - HALF_PI);
        upy = -1.0;
    }

    println(roll);

    PVector p = new PVector(0,upy,0);

    PVector q = rotateUpVector(roll, p);

    float camX = distance * cos(elevation) * cos(angle);
    float camY = distance * sin(elevation);
    float camZ = distance * cos(elevation) * sin(angle);
    // camera(camX, camY, camZ, 0, 0, 0, 0, upy, 0);
    camera(camX, camY, camZ, 0, 0, 0, q.x, q.y, 0);

}
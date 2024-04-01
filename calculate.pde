

float boundAngle(float angle){
    if(angle > TWO_PI){
        return(angle - TWO_PI);
    } else if(angle < 0){
        return(angle + TWO_PI);
    }
    return(angle);
}


float boundElevation(float elevation){
    if(elevation > PI + HALF_PI){
        return(elevation - TWO_PI);
    } else if(elevation < - HALF_PI){
        return(elevation + TWO_PI);
    }
    return(elevation);
}

void calculateReals(float angle, float elevation, float distance){

    float a = angle;
    float e = elevation;

    float upy = 1;


    if(elevation >= HALF_PI){
        a += PI;
        e -= HALF_PI - (elevation - HALF_PI);
        upy = -1.0;
    }
    
    float camX = distance * cos(elevation) * cos(angle);
    float camY = distance * sin(elevation);
    float camZ = distance * cos(elevation) * sin(angle);
    float upx = 0;
    // float upy = 1;
    float upz = 0;
    camera(camX, camY, camZ, 0, 0, 0, upx, upy, upz);

}



void move(){

    float diffX = 1;
    float diffY = 1;

    popMatrix();
    
    horizontal.normalize();
    vertical.normalize();
    //seems to be correct
    PVector mouseVector = PVector.add(PVector.mult(horizontal, diffX), PVector.mult(vertical, diffY));
    
    PVector outscreen = horizontal.cross(vertical);
    
    PVector axis = mouseVector.cross(outscreen);
    
    axis.normalize();
    horizontal.normalize();
    vertical.normalize();
    outscreen.normalize();
    
    float angle = mouseVector.mag() / 120;
    
    //stage of rotate back to the axis
    
    horizontal = rotateAroundAxis(horizontal, axis, -angle);
    vertical = rotateAroundAxis(vertical, axis, -angle);
    
    rotateAroundAxisBasisChange(axis, angle);
    
    pushMatrix();
}


import toxi.geom.*;


PVector rotateAroundAxis(PVector vec, PVector axis, float angle) {
    
    Vec3D myVec = new Vec3D(vec.x, vec.y, vec.z);
    Vec3D axisVec = new Vec3D(axis.x, axis.y, axis.z);
    
    myVec.rotateAroundAxis(axisVec,angle);
    
    PVector tmp = new PVector(myVec.x, myVec.y, myVec.z);
    
    return(tmp);
}

PVector horizontal = new PVector(1, 0, 0);
PVector vertical = new PVector(0, -1, 0);

void setup() {
    size(500, 500, P3D);
    translate(250, 250);
    pushMatrix();
}

void draw() {
    popMatrix();
    background(0);
    lights();
    
    strokeWeight(5);
    stroke(255);
    line(0, 0, 0, horizontal.x * height, horizontal.y * height, horizontal.z * height);
    line(0, 0, 0, vertical.x * height, vertical.y * height, vertical.z * height);
    
    drawModel();
    
    pushMatrix();
}

void mouseDragged() {
    
    
    if(mouseButton == LEFT) {
        
		float diffX = mouseX - pmouseX;
		float diffY = mouseY - pmouseY;
        
        diffY = -diffY;
        
       if (!(diffX == 0 && diffY == 0)) {
            
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

			println(angle);
            
            //stage of rotate back to the axis
            
            horizontal = rotateAroundAxis(horizontal, axis, -angle);
            vertical= rotateAroundAxis(vertical, axis, -angle);
            
            rotateAroundAxisBasisChange(axis, angle);

      		pushMatrix();
        }
	}

	if(mouseButton == RIGHT){
		float diffX = mouseX - pmouseX;

    	if (!(diffX == 0)) {

            popMatrix();

            horizontal.normalize();
            vertical.normalize();
            //seems to be correct
            PVector mouseVector = PVector.mult(horizontal, diffX);
            
            PVector outscreen = horizontal.cross(vertical);
            
			float angle = mouseVector.mag() / 120;
        
			if(diffX < 0){
				angle = angle * -1;
			}
            //stage of rotate back to the axis
			println(mouseVector);
			println(diffX, angle);
            
            horizontal = rotateAroundAxis(horizontal, outscreen, angle);
            vertical= rotateAroundAxis(vertical, outscreen, angle);
            
            rotateAroundAxisBasisChange(outscreen, -angle);

       		pushMatrix();
		}
	}
}

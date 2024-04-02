

// dragged behaviour (for movement)

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

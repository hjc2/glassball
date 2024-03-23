
class World {
    
    
    World() {
        
        
    }
    void drawModel() {
        
        
        background(0); // Set background to black
        // lights(); // Default lighting
        // ambientLight(40, 40, 40);
        ambientLight(40,40,40);
        fill(0, 0, 255); // Fill with blue color to represent the Earth
        specular(255, 255, 255);
        ambient(100,100,140);
        sphere(50); // Draw the Earth as a sphere with a radius of 100
        
    
        noStroke();
        pointLight(255, 255, 255, 0, 0, 500);
        pushMatrix();
        
        fill(255,255,0);
        translate(0,0,500);
        sphere(150);
        popMatrix();

        pushMatrix();
        
        fill(255,255,0);
        translate(0,400,0);
        pointLight(255, 255, 255, 0, 0, 0);
        popMatrix();
    }
}
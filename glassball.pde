


float angle = 0.0; // Horizontal angle for the camera movement
float elevation = 0.0; // Vertical angle for the camera movement
float distance = 300;

void setup() {
  size(600,600, P3D); // Use P3D renderer for 3D drawing
}

void draw() {
  background(0); // Set background to black
  
  angle = map(mouseX, 0, width, 0, TWO_PI);
  elevation = map(mouseY, 0, height, -PI, PI);
  
  // Calculate camera's position in spherical coordinates
//   float camX = 600 * cos(elevation) * cos(angle);
//   float camY = 600 * sin(elevation);
//   float camZ = 600 * cos(elevation) * sin(angle);

float camX = distance;
float camY = distance;
float camZ = distance;
  
  // Set camera position, view center, and up direction
  camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
  
  // Draw axes for reference
  strokeWeight(4);
  stroke(255, 0, 0); line(-100, 0, 0, 100, 0, 0); // X axis in red
  stroke(0, 255, 0); line(0, -100, 0, 0, 100, 0); // Y axis in green
  stroke(0, 0, 255); line(0, 0, -100, 0, 0, 100); // Z axis in blue
  
  // Reset stroke color to white for the cube
  stroke(255);
  
  // Draw a cube at the origin
  pushMatrix();
  translate(0, 0, 0); // Move to the origin
  strokeWeight(2);
  stroke(80);
  box(100); // Draw a cube with 100 units side length
  popMatrix();
}

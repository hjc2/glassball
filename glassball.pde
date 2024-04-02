


// an axis, and an angle.

//
PVector horizontal = new PVector(0,-1,0);
PVector vertical = new PVector(1,0,0);

void setup() {
  size(500, 500, P3D);
  translate(200, 200);
  pushMatrix();
}

void draw() {
  popMatrix();
  background(0);
  lights();

// dx * horizontal vector + dy * vertical vector

// find the vector on the screen thats perpendicular

// vertical cross horizontal -> out of the screen.
  
  strokeWeight(5);
  stroke(255);
  line(0, 0, 0, horizontal.x, horizontal.y, horizontal.z);
  line(0, 0, 0, vertical.x, vertical.y, vertical.z);

  stroke(color(255, 0, 0));
  line(-width, 0, 0, width, 0, 0);
  stroke(color(0, 255, 0));
  line(0, -height, 0, 0, height, 0);
  stroke(color(0, 0, 255));
  line(0, 0, -height, 0, 0, height);

  noStroke();
  pushMatrix();
  translate(50,50,50);
  box(50);
  popMatrix();

  pushMatrix();
}

void mouseDragged() {
  popMatrix();
  if (mouseButton == LEFT) {
    float diffX = mouseX - pmouseX;
    float diffY = mouseY - pmouseY;

    diffX = 0.0001;
    diffY = 0;

    PVector mouseVector = PVector.add(PVector.mult(horizontal, diffX), PVector.mult(vertical, diffX));

    //  rotateX(PI / 1024);

    PVector outscreen = vertical.cross(horizontal);

    PVector axis = mouseVector.cross(outscreen);

    println(axis);
    println(mouseVector);
    println(mouseVector.mag());
    println(diffX);
    rotateAroundAxisBasisChange(axis, mouseVector.mag());
    horizontal = horizontal.sub(axis);
    vertical = vertical.sub(axis);
  }
  pushMatrix();
}
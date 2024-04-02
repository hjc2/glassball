
PVector rotateAroundAxis(PVector vec, PVector axis, float angle) {
    PVector newVec = new PVector();
    newVec.x = vec.x * cos(angle) + (axis.y * vec.z - axis.z * vec.y) * sin(angle) + axis.x * axis.x * (1 - cos(angle));
    newVec.y = vec.y * cos(angle) + (axis.z * vec.x - axis.x * vec.z) * sin(angle) + axis.y * axis.y * (1 - cos(angle));
    newVec.z = vec.z * cos(angle) + (axis.x * vec.y - axis.y * vec.x) * sin(angle) + axis.z * axis.z * (1 - cos(angle));
    return newVec;
}

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


    //seems to be correct
    PVector mouseVector = PVector.add(PVector.mult(horizontal, diffX), PVector.mult(vertical, diffY));


    PVector outscreen = horizontal.cross(vertical);

    PVector axis = mouseVector.cross(outscreen);

    float angle = mouseVector.mag() / 400;



    //  rotateX(PI / 1024);



    println(mouseVector);
    println(axis);
    println(axis.dot(mouseVector)); // 0 thus they should be orthogonal
    println(vertical);
    println(horizontal);
    println("-----");
    
        horizontal = rotateAroundAxis(horizontal, axis, angle);
        vertical = rotateAroundAxis(vertical, axis, angle);


    rotateAroundAxisBasisChange(axis, mouseVector.mag() / 400);

  }
  pushMatrix();
}



// an axis, and an angle.

//
float angle = 0f;
PVector rotAxis;

ArrayList<Frame> myList;



void setup() {
  size(500, 500, P3D);
  angle=0;
  rotAxis = new PVector(0, 400, 100);
  myList = new ArrayList<Frame>();

}

void draw() {
  background(0);
  lights();
  translate(200, 200);


    for(Frame x : myList){
        rotateAroundAxisBasisChange(x.vector, x.value);
    }
  
  strokeWeight(5);
  stroke(255);
  line(0, 0, 0, rotAxis.x, rotAxis.y, rotAxis.z);
  
  stroke(color(255, 0, 0));
  line(-width, 0, 0, width, 0, 0);
  stroke(color(0, 255, 0));
  line(0, -height, 0, 0, height, 0);
  stroke(color(0, 0, 255));
  line(0, 0, -height, 0, 0, height);

  noStroke();
  translate(50,50,50);
  box(50);


  myList.add(new Frame(new PVector(0, 400, 100), PI / 60));
}
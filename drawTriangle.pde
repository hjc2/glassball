  class Sierpinski {


 Sierpinski(){

 }
 void drawModel(){

  PVector[] vertices = {
    new PVector(-100, -50, -100),
    new PVector(100, -50, -100),
    new PVector(0, -50, 100),
    new PVector(0, 100, 0)
  };
  sierpinski(vertices, 4);
} 

 void sierpinski(PVector[] points, int depth) {
  if (depth == 0) {
    drawTetrahedron(points);
  } else {
    PVector[] midpoints = new PVector[6];
    // Calculate midpoints of each edge
    midpoints[0] = points[0].copy().lerp(points[1], 0.5);
    midpoints[1] = points[1].copy().lerp(points[2], 0.5);
    midpoints[2] = points[2].copy().lerp(points[0], 0.5);
    midpoints[3] = points[0].copy().lerp(points[3], 0.5);
    midpoints[4] = points[1].copy().lerp(points[3], 0.5);
    midpoints[5] = points[2].copy().lerp(points[3], 0.5);
    // Recursively draw smaller tetrahedrons
    sierpinski(new PVector[] {points[0], midpoints[0], midpoints[2], midpoints[3]}, depth-1);
    sierpinski(new PVector[] {midpoints[0], points[1], midpoints[1], midpoints[4]}, depth-1);
    sierpinski(new PVector[] {midpoints[2], midpoints[1], points[2], midpoints[5]}, depth-1);
    sierpinski(new PVector[] {midpoints[3], midpoints[4], midpoints[5], points[3]}, depth-1);
  }
}

void  drawTetrahedron(PVector[] vertices) {
  beginShape(TRIANGLES);
  // Bottom
  vertex(vertices[0].x, vertices[0].y, vertices[0].z);
  vertex(vertices[1].x, vertices[1].y, vertices[1].z);
  vertex(vertices[2].x, vertices[2].y, vertices[2].z);
  // Sides
  vertex(vertices[0].x, vertices[0].y, vertices[0].z);
  vertex(vertices[1].x, vertices[1].y, vertices[1].z);
  vertex(vertices[3].x, vertices[3].y, vertices[3].z);

  vertex(vertices[1].x, vertices[1].y, vertices[1].z);
  vertex(vertices[2].x, vertices[2].y, vertices[2].z);
  vertex(vertices[3].x, vertices[3].y, vertices[3].z);

  vertex(vertices[2].x, vertices[2].y, vertices[2].z);
  vertex(vertices[0].x, vertices[0].y, vertices[0].z);
  vertex(vertices[3].x, vertices[3].y, vertices[3].z);
  endShape();
}
}
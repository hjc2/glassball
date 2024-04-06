
import toxi.geom.*;

// used chatgpt, phind, claude  

PVector horizontal = new PVector(1, 0, 0);
PVector vertical = new PVector(0, -1, 0);
int time = 0;


boolean normie = true;


ArrayList<Snake> snakeList = new ArrayList<Snake>();


void setup() {
    size(500, 500, P3D);
    translate(250, 250);
    pushMatrix();


    for(int i = 0; i < 1000; i++){
        Snake tmp = new Snake();
        snakeList.add(tmp);
    }
}

void draw() {
    popMatrix();
    background(100);
    lights();
    
    colorMode(HSB);

    pointLight(255, 0, 255, 200,200, 0);
    for(Snake snake : snakeList){
        snake.drawSnake(time);
    }

	drawMobiusStrip();
    

	time += 2;

    // PVector stat =  calculatePositionWithOffsets(time,0,0);
    // pushMatrix();
    // translate(stat.x, stat.y, stat.z);
    // sphere(15);
    // popMatrix();
    // time = time % 720;

    pushMatrix();
    
    // move();
    if(time < 720){
	    // saveFrame("images/zobius-####.png");
    }
}

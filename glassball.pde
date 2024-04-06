
import toxi.geom.*;

PVector horizontal = new PVector(1, 0, 0);
PVector vertical = new PVector(0, -1, 0);
int time = 0;

boolean capHit = false;

boolean normie = true;


ArrayList<Snake> snakeList = new ArrayList<Snake>();


void setup() {
    size(500, 500, P3D);
    translate(250, 250);
    pushMatrix();


    for(int i = 0; i < 600; i++){
        Snake tmp = new Snake();
        snakeList.add(tmp);
    }
}

void draw() {
    popMatrix();
    background(100);
    lights();
    
    colorMode(HSB);
	// drawBall(time, 0.5, 0.1, 0);
	// drawBall(time, 0.0, 0.1, 85);
	// drawBall(time, -0.5, 0.1, 170);

    // drawSnakes();

    for(Snake snake : snakeList){
        snake.drawSnake(time);
    }

	drawMobiusStrip();
    


	time += 1;
    if(time == 720){
        capHit = true;
    }
    time = time % 720;
    

    pushMatrix();
    
    if(!capHit){
	    // saveFrame("images/zobius-####.png");
    }
}

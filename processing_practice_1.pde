GifRecorder recorder = new GifRecorder(this);

int number_of_star = floor(random(100, 200));
Star[] stars = new Star[number_of_star];

void setup() {
  size(500, 500);
  frameRate(30);
  background(10, 5, 35);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(random(500), random(500), get_random_size(), get_random_speed());
  }
}

void draw() {
  background(10, 5, 35);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
  }
  
  recorder.onDraw();
}

float get_random_size() {
  float value = random(100);
  
  if (value > 98) {
      return 5;
  } else if(value > 90) {
      return 4;
  } else if(value > 70) {
      return 3;
  } else if(value > 40) {
      return 2;
  } else {
      return 1;
  }
}

float get_random_speed() {
  float value = random(100);
  
  if (value > 99.9) {
      return 5;
  } else if(value > 99.5) {
      return 4;
  } else if(value > 98) {
      return 3;
  } else if(value > 50) {
      return 2;
  } else {
      return 1;
  }
}

class Star {
  float postion_x;
  float position_y;
  float size;
  float speed;
  float cycle = 100;
  float step = 0;
  int direction = 1;
  
  Star (float postion_x, float position_y, float size, float speed) {  
    this.postion_x = postion_x; 
    this.position_y = position_y; 
    this.size = 2 + (size / 5); 
    this.speed = 0 + (speed / 5); 
  }
  
  void update() {
    if (direction == 1) {
      step = step + speed;
      
      if (step >= cycle) {
        direction = -1;
      }
    } else {
      step = step - speed;
      
      if (step <= 0) {
        direction = 1;
      }
    }
    
    fill(175);
    ellipse(postion_x, position_y, size + (((cycle / 2) - step) / 100), size + (((cycle / 2) - step) / 100));
  } 
}

void mouseClicked() {
  recorder.recordForSeconds("out.gif", 10);
}


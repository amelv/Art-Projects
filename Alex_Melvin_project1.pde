// THE (CO)SIN

static final int NUM_LINES = 12;

float t;
float p;

  int sign = 1;
final float col = 125;
final float h = 10;

void setup () {
  fullScreen();
}

void draw() {
 
  background(125*sin(t/20)+125, 125*cos(t/20)+125, -125*sin(t/20)+125);
    
  strokeWeight(20*sin(t/20)+20);
  for (int i = 0; i < NUM_LINES; i++) {
    pushMatrix();
    sign = i % 2 == 0 ? 1 : -1;
    translate(width/2 + sign*200*(-tan(t/200))*(i/2), 0);
    
    scale(3+2*sin(t/200));
  
    stroke(-125*sin(t/20)+125, -125*cos(t/20)+125, 125*sin(t/20)+125);
    noFill();
    bezier(0, 0, 200*sin(t/20), 200*cos(t/20) + height/2, 200*cos(t/20), 200*cos(t/20)+ height/2, 0, height);
    
    popMatrix();
  }

  p += 1;
  t += 1 + .3*sin(p/50);
  
}

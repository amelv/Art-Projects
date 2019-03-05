// Rain code sourced from Daniel Schiffman

Drop[] drops = new Drop[500];
float i = 0;

void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(232, 6, 40*(sin(i/30)) + 60);
  
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
  i+=0.1;
  fill(25, 74, 20*(sin(i/30)) + 35);
  noStroke();
  rect(-4, -4, width+4, height/5);
  rect(-4, -4, width/5, 4+height);
  rect(4*width/5, -4, 4*width/5, 4+height);  
  rect(-4, 4*height/5, width+4, height+4);
  
  fill(50, 70, 20*(sin(i/30)) + 50);
  rect(width/5 - 20, -10+height/5, 3*width/5 + 25, 25);
  rect(width/5 - 20, -10+height/5, 25, 3*height/5 + 25);
  rect(width/5 - 20, -10+4*height/5, 3*width/5 + 25, 25);
  rect(4*width/5 - 20, -10+height/5, 25, 3*height/5 + 25);
  
  fill(228, 9, 20*(sin(i/30)) + 65);
  rect(width/2 - 7.5, 15+height/5, 15, -25+3*height/5);
  
  rect(5+width/5, -25+2*height/5, -25+3*width/5, 15);
  
  rect(5+width/5, -25+3*height/5, -25+3*width/5, 15);
  
}
class Drop {
  float x;
  float y;
  float z;
  
  
  float len;
  float yspeed;

  Drop() {
    x  = random(width/5, 4*width/5);
    y  = random(-500, -50);
    z  = random(0, 20);
    len = map(z, 0, 20, 10, 20);
    yspeed  = map(z, 0, 20, 1, 20);
  }

  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(232,14, 50*(-sin(i/30)) + 50);
    line(x, y, x, y+len);
  }
}

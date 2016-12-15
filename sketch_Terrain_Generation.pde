/**
* Author Jacob Aylward
* Terrain Generation 
*
**/
int colums, rows;
int scale = 20;
int width = 1200;
int height = 900;
float flying = 0;
float[][] terrain;

/*
*setup()
*@param
*@return
*/
void setup(){
  size(600, 600, P3D); //display size
  colums = width / scale; 
  rows = height / scale;
  terrain = new float[colums][rows]; 
}
/*
*draw()
*@param
*@return
*/
void draw(){
  flying -= 0.1;
  float yoff = flying;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x <colums; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -150, 150);//random(-10, 10);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  background(0);
  stroke(255);
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-width/2, -height/2);
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < colums; x++) {
      vertex(x*scale, y*scale, terrain[x][y]);//random(-100, 100));
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);//random(-100, 100));
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
Slider colorSlider;
Slider sizeSlider;

boolean rgbMode = false;

int brushSize = 10;
color currentColor;


void setup() {
  size(800, 600);
  background(255);

  // first slider
  colorSlider = new Slider(50, height - 40, 200, 20, false);

  // second slider
  sizeSlider = new Slider(width - 40, 50, 20, 200, true);
}

void draw() {
  // --- DRAWING ---
  if (mousePressed && mouseY < height - 60 && mouseX < width - 60 
      && !colorSlider.dragging && !sizeSlider.dragging) {

    stroke(currentColor);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  

  noStroke();
  fill(255);
  rect(0, height - 60, width, 60);   
  rect(width - 60, 0, 60, height);   
  
  //fill(255);
  //rect(250, height - 40, 120, 30);
  
  fill(rgbMode ? color(180,220,255) : 220);
  rect(300,height - 45,120,30);
  fill(0);
  textAlign(CENTER, CENTER);
  text(rgbMode ? "RGB MODE" :"GRAY MODE", 360,height - 30);
  
  
  //if(rgbMode){
  //  text("RGB Mode", 360, height - 30);
  //} else{
  //  text("Grayscale", 360, height - 30);
  //}
  
  float v = colorSlider.value;
  
  if(rgbMode){
    currentColor = colorFromSlider(v);
  }else{
    currentColor = color(v);
  }
  

  // drawing the sliders
  colorSlider.update();
  sizeSlider.update();

  colorSlider.display();
  sizeSlider.display();


  //currentColor = color(colorSlider.value);
  brushSize = int(map(sizeSlider.value, 0, 255, 1, 50));

  
}
color colorFromSlider(float v){
  float r = 0, g = 0, b = 0;
  
  if (v < 85){
    r = map(v,0,85,255,0);
    g = map(v,0,85,0,255);
    b = 0;
  }else if (v < 170){
    r = 0;
    g = map(v,85,170,255,0);
    b = map(v,85,170,0,255);
  }else{
    r = map(v,170,255,0,255);
    g = 0;
    b = map(v,170,255,255,0);
  }
  return color(r,g,b);
}

void mousePressed(){
  if(mouseX > 300 && mouseX < 420 && mouseY > height - 45
  && mouseY < height - 15){
    rgbMode = !rgbMode;
  }
}

void keyPressed() {
  if (key == ' ') {
    background(255);
  }
}

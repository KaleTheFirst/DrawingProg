class Slider {
  float x, y, w, h;
  float value;
  boolean dragging = false;
  boolean vertical;

  Slider(float x, float y, float w, float h, boolean vertical) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vertical = vertical;
    value = 100;
  }

  void update() {
    if (mousePressed && over()) {
      dragging = true;
    }
    if (!mousePressed) {
      dragging = false;
    }

    if (dragging) {
      if (vertical) {
        value = map(mouseY, y + h, y, 0, 255);
      } else {
        value = map(mouseX, x, x + w, 0, 255);
      }
      value = constrain(value, 0, 255);
    }
  }

  boolean over() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }

  void display() {
    noStroke();
    
    if(!vertical) {
      for (int i = 0; i < w; i++){
        float v = map(i,0,w,0,255);
        
        if(rgbMode){
          fill(colorFromSlider(v));
        }else{
          fill(v);
        }
        if(vertical){
          fill(200);
        }else{
          if(rgbMode){
            fill(colorFromSlider(v));
        }else{
          fill(v);
        }
      }
      rect(x + i,y,1,h);
      }
    }
    
    fill(0);
    if (vertical) {
      float handleY = map(value, 0, 255, y + h, y);
      rect(x, handleY - 5, w, 10);
    } else {
      float handleX = map(value, 0, 255, x, x + w);
      rect(handleX - 5, y, 10, h);
    }
  }
}

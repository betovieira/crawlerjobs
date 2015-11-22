int cSize = canvasSizePizza;
int[] angles = new int[27];
int[] anglesAux = new int[27];
Angle objs = new Angle[27];
boolean mouseOverAngle = false;

void setup() {
  size(cSize, cSize);
  background(255, 255, 255, 0);
  
  setAngles(total);
  pieChart(300, angles);
  noLoop();
}

void draw() {
  background(255, 255, 255, 0);
  
  update();
 
  desenhaGrafico();
}

void desenhaGrafico() {
  float x;
  float y;
  
  for (int i = 0; i < 27; i++) {
    objs[i].desenhaAngulo();
  }
  
 float curAngle = 0;
 for(int i = 0; i < 27; i++) {
   x = cos(curAngle) * 150;
   y = sin(curAngle) * 150;
    
   stroke(255, 248, 232, 100);
   line(width / 2, height / 2, (width / 2) + x, (height / 2) + y);
   curAngle += radians(anglesAux[i]);
 }
}

void update() {
  mouseOverAngle = false;
  for(int i = 0; i < 27; i++) {
    objs[i].setMouseOver();
  }
}

void setAngles(int pTotal) {
  for (int i = 0; i < 27; i++) {
    int quant = Estados.getEstadoByPosition(i).getTotalVagas();
    int angle = quant * 360 / pTotal;
    angles[i] = angle;
  }
  
  anglesAux = sort(angles);
}

void pieChart(float diameter, int[] data) {
  float lastAngle;
  float red;
  float green;
  float blue;  
  int quantMenor;
  
  for (int i = 0; i < data.length; i++) {
    lastAngle = 0;
    red = 32;
    green = 32;
    blue = 32;
    for (int j = 0; j < data.length; j++) {
      if(angles[j] <= angles[i] ) {
        
        if (angles[j] == angles[i] && j <= i) {
          continue;
        }
        
        lastAngle += radians(angles[j]);
        red += (239 - 32) / 27;
        green += (131 - 32) / 27;
        blue += (84 - 32) / 27;
      }
    }   
    
    objs[i] = new Angle(lastAngle, lastAngle + radians(angles[i]), red, green, blue, diameter, i);
    
    objs[i].desenhaAngulo();
  }
}

void mousePressed() {
  int alterado = -1;
  boolean clicado = false;
  
  for(int i = 0; i < 27; i++) {
    if (objs[i].getMouseOver()) {
      clicado = true;
      alterado = i;
    }
  }
  if (clicado) {
    for (int i = 0; i < 27; i++) {
      objs[i].setSelecionado(false);
    }
    
    objs[alterado].setSelecionado(true);
    abreEstadoP(estadosArray[alterado], alterado);
  }
}

void setSelectedExt(int id) {
  for (int i = 0; i < 27; i++) {
    objs[i].setSelecionado(false);
  }
  
  objs[id].setSelecionado(true);
}

class Angle {
  int id;
  float inicio;
  float fim;
  float red;
  float green;
  float blue;
  float diameter;
  boolean mouseOver;
  boolean selecionado;
  
  Angle(float inicio, float fim, float red, float green, float blue, float diameter, int id) {
    this.inicio = inicio;
    this.fim = fim;
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.diameter = diameter;
    this.id = id;
    this.mouseOver = false;
    this.selecionado = false;
  }
  
  void desenhaAngulo() {
    noStroke();
 
    if (this.selecionado) {
      fill(167, 114, 124);
    } else {
      fill(this.red, this.green, this.blue);
    }
    
    arc(width / 2, height / 2, this.diameter, this.diameter, this.inicio, this.fim);
    
    if (this.mouseOver) {
      fill(255, 248, 232, 100);
      arc(width / 2, height / 2, this.diameter, this.diameter, this.inicio, this.fim);
    } 
  }
  
  void setMouseOver() {
    float distX = (width / 2) - (mouseX + 200);
    float distY = (height / 2) - (mouseY + 450);
  
    float curAngle = atan(distY / distX);
    float pos = sqrt(sq(distX) + sq(distY));
  
    if (curAngle < 0) {
      curAngle += PI;
    }
    if (distY > 0) {
      curAngle += PI;
    }
      
    if (curAngle > this.inicio && curAngle < this.fim &&
        pos < this.diameter / 2) {
        mouseOverAngle = true;
        this.mouseOver = true;
    } else {
      this.mouseOver = false;
    }
  }
  
  void setSelecionado(boolean val) {
    this.selecionado = val;
  }
  
  boolean getMouseOver() {
    return this.mouseOver;
  }
  
  int getId() {
    return this.id;
  }
}
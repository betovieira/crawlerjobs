JobCircle[] circles = new JobCircle[27];
boolean mouseOverCircle = false;
int cSize = canvasSizeMap;

void setup() {
  size(cSize, cSize);
  background(255, 255, 255, 0);
  
  inicializaEstados();
}

void draw() {
  cSize = canvasSizeMap;
  size(cSize, cSize);
  
  background(255, 255, 255, 0);
  
  update();
  
  desenhaEstados();
}

void desenhaEstados() {
  for (int i = 0; i < 27; i++) {
    circles[i].drawCircle();
  }
}

void update() {
  mouseOverCircle = false;
  for(int i = 0; i < 27; i++) {
    circles[i].setMouseOver();
  }
}

void mousePressed() {
  int alterado = -1;
  boolean clicado = false;
  
  for(int i = 0; i < 27; i++) {
    if (circles[i].getMouseOver()) {
      clicado = true;
      alterado = i;
    }
  }
  if (clicado) {
    for (int i = 0; i < 27; i++) {
      circles[i].setSelecionado(false);
    }
    
    circles[alterado].setSelecionado(true);
    abreEstado(alterado, circles[alterado].getPopulacao(), estadosArray[alterado]);
  }
}

void inicializaEstados() {
  circles[0] = new JobCircle(50, 190, Estados.getEstadoByPosition(0).getTotalVagas(), "803 513");
  circles[1] = new JobCircle(470, 200, Estados.getEstadoByPosition(1).getTotalVagas(), "3 340 932");
  circles[2] = new JobCircle(280, 50, Estados.getEstadoByPosition(2).getTotalVagas(), "766 679");
  circles[3] = new JobCircle(125, 125, Estados.getEstadoByPosition(3).getTotalVagas(), "3 938 336");
  circles[4] = new JobCircle(400, 230, Estados.getEstadoByPosition(4).getTotalVagas(), "15 203 934");
  circles[5] = new JobCircle(435, 140, Estados.getEstadoByPosition(5).getTotalVagas(), "8 904 459");
  circles[6] = new JobCircle(330, 270, Estados.getEstadoByPosition(6).getTotalVagas(), "2 914 830");
  circles[7] = new JobCircle(415, 320, Estados.getEstadoByPosition(7).getTotalVagas(), "3 929 911");
  circles[8] = new JobCircle(305, 270, Estados.getEstadoByPosition(8).getTotalVagas(), "6 610 681");
  circles[9] = new JobCircle(360, 140, Estados.getEstadoByPosition(9).getTotalVagas(), "6 904 241");
  circles[10] = new JobCircle(230, 240, Estados.getEstadoByPosition(10).getTotalVagas(), "3 270 973");
  circles[11] = new JobCircle(245, 330, Estados.getEstadoByPosition(11).getTotalVagas(), "2 651 235");
  circles[12] = new JobCircle(365, 310, Estados.getEstadoByPosition(12).getTotalVagas(), "20 869 101");
  circles[13] = new JobCircle(270, 125, Estados.getEstadoByPosition(13).getTotalVagas(), "8 175 113");
  circles[14] = new JobCircle(470, 170, Estados.getEstadoByPosition(14).getTotalVagas(), "3 972 202");
  circles[15] = new JobCircle(280, 380, Estados.getEstadoByPosition(15).getTotalVagas(), "11 163 018");
  circles[16] = new JobCircle(450, 185, Estados.getEstadoByPosition(16).getTotalVagas(), "9 345 173");
  circles[17] = new JobCircle(390, 175, Estados.getEstadoByPosition(17).getTotalVagas(), "3 204 028");
  circles[18] = new JobCircle(390, 355, Estados.getEstadoByPosition(18).getTotalVagas(), "16 550 024");
  circles[19] = new JobCircle(468, 150, Estados.getEstadoByPosition(19).getTotalVagas(), "3 442 175");
  circles[20] = new JobCircle(265, 445, Estados.getEstadoByPosition(20).getTotalVagas(), "11 247 972");
  circles[21] = new JobCircle(140, 210, Estados.getEstadoByPosition(21).getTotalVagas(), "1 768 204");
  circles[22] = new JobCircle(165, 50, Estados.getEstadoByPosition(22).getTotalVagas(), "505 665");
  circles[23] = new JobCircle(290, 410, Estados.getEstadoByPosition(23).getTotalVagas(), "6 819 190");
  circles[24] = new JobCircle(320, 360, Estados.getEstadoByPosition(24).getTotalVagas(), "44 396 484");
  circles[25] = new JobCircle(455, 215, Estados.getEstadoByPosition(25).getTotalVagas(), "2 242 937");
  circles[26] = new JobCircle(320, 200, Estados.getEstadoByPosition(26).getTotalVagas(), "1 515 126");
}

class JobCircle {
  int posX, posY;
  float radius;
  boolean selecionado;
  boolean mouseOver;
  String populacao;
  
  JobCircle(int posX, int posY, float radius, String populacao) {
    this.posX = posX;
    this.posY = posY;
    this.radius = ((22 * (radius - quantMin)) / (quantMax - quantMin)) + 3;
    this.selecionado = false;
    this.mouseOver = false;
    this.populacao = populacao;
  }
  
  void drawCircle() {
    if (this.mouseOver) {
      strokeWeight(2);
      if (this.selecionado) {
        stroke(167, 114, 124, 180);
      } else {
        stroke(239, 131, 84, 180);
      }      
    } else {
      noStroke();
    }
    
    if (this.selecionado) {
      fill(167, 114, 124, 200);
    } else {
      fill(239, 131, 84, 130);
    }
    ellipse((this.posX * cSize) / 500, (this.posY * cSize) / 500, this.radius * 2, this.radius * 2);
  }
  
  void setMouseOver() {
    float distX = (this.posX * cSize) / 500 - (mouseX + (250 * cSize) / 500);
    float distY = (this.posY * cSize) / 500 - (mouseY + (((100 * (cSize - 300)) / 200) + 400));
    if (!mouseOverCircle && sqrt(sq(distX) + sq(distY)) < this.radius) {
      mouseOverCircle = true;
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
  
  String getPopulacao() {
    return this.populacao;
  }
}
int cSize = canvasSizeMedia;
Barra[] estadosBar = new Barra[5];
float menorM, maiorM;
float alturaMedia;
String texto = "";

void setup() {
  size(cSize, cSize - 100);
  background(0, 0, 0, 0);
  
  criaGrafico();
  noLoop();
}

void draw() {
  background(0, 0, 0, 0);
  desenhaGrafico();
}

void criaGrafico() {
  float[] top = new float[5];
  int[] ids = new int[5];
  int atualArray = 0;
  
  for (int i = 0; i < 5; i++) {
    top[i] = -1;
  }
  
  for (int i = 0; i < 27; i++) {
    float media = Estados.getEstadoByPosition(i).getMediaVagas();
    int qMaior = 0;
    int pos = 0;
    for (int j = i + 1; j < 27; j++) {
      float aux = Estados.getEstadoByPosition(j).getMediaVagas();

      if (media < aux) {
        pos += 1;
        qMaior += 1;
      }
    }

    if (qMaior < 5) {
      for (int j = 0; j < 5; j++) {
        if (top[j] != -1 && top[j] >= media) {
          pos += 1;
        }
      }
      
      if (pos < 5) {
        top[pos] = media;
        ids[atualArray] = i;
        estadosBar[atualArray] = new Barra(i, pos, media);
        atualArray += 1;
      }      
    }
  }
  
  menorM = top[4];
  maiorM = top[0];
  
  float mediaNacional = Estados.getMediaVagas();
  setMediaNacional(mediaNacional);
  setBarValues(top, mediaNacional);
  setBarNames(ids);
  
  if (mediaNacional < menorM) {
    menorM = mediaNacional;
  }
 
  float minL = (((-60 / 190) * (maiorM - menorM)) + menorM);
  
  setLimits(maiorM, mediaNacional, minL);
  
  alturaMedia = (190 * ((mediaNacional - menorM) / (maiorM - menorM))) + 60;
  //alturaMedia = 240 * ((mediaNacional - menorM) / (maiorM - menorM));
  //alturaMedia = 240 * (mediaNacional / maiorM);
}

void desenhaGrafico() { 
  for (int i = 0; i < 5; i++) {
    estadosBar[i].desenhaBarra();
  }
  
  strokeWeight(5);
  stroke(74, 75, 77);
  line(50, 100, 50, 347);
  line(51, 350, 550, 350);
  
  stroke(167, 114, 124);
  line(51, 350 - alturaMedia, 550, 350 - alturaMedia);
}

class Barra {
  int id;
  float posX;
  float media;
  boolean mouseOver;
  boolean selecionado;
  
  Barra(int id, float posX, float media) {
    this.id = id;
    this.posX = posX;
    this.media = media;
    this.mouseOver = false;
    this.selecionado = false;
  }
  
  void desenhaBarra() {
    float position = ((500 / 6) * (this.posX + 1)) + 50;
    float altura = (190 * ((this.media - menorM) / (maiorM - menorM))) + 60;
    //float altura = 240 * ((this.media - menorM) / (maiorM - menorM));
    //float altura = 240 * (this.media / maiorM);
    
    noStroke();
    fill(239, 131, 84);
    rect(position - 20, 350 - altura, 40, altura);
  }
}
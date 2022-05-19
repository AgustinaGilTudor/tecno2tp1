//importar librería
import oscP5.*;
//declarar el objeto
OscP5 osc;

float pitch;
float amp;

float contador=0;
//----------------------
//variables de calibración
float minAmp =50;
float maxAmp=100;
float f=0.8; //factor de amortiguación
float minPitch = 50;
float maxPitch = 96;



void setup() {
  size(600, 600);
  //inicializar
  osc= new OscP5 (this, 12345); 

 
}
void draw() {

  if (amp<minAmp) { //no hay sonido
    background(0);
    contador=0;
  } else if ( amp>minAmp) {//hay sonido
    /*int contador=0;
     contador++;*/
    float s= second();
    contador++;
    background(0, 255, 0);


    println(s);
    if (contador<=s-s+20) {//corta duración

      fill(255, 0, 0);
      ellipse(width/2, height/2, 100, 100);
    } else if (contador>s-s+5) { //larga duración

      fill(0, 0, 255);
      ellipse(width/2, height/2, 100, 100);
    }
    println(contador);
  }
}

void oscEvent(OscMessage m) {

  if (m.addrPattern().equals("/amp")) { 
    amp = m.get(0).floatValue(); 
    //println(amp);
    //   println("amp: "+amp );
  } else if (m.addrPattern().equals("/pitch")) {
    pitch=m.get(0).floatValue();
    // println("pitch: "+pitch);
  }
}

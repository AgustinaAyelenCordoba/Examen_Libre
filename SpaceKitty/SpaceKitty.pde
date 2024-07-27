Pantalla pantalla;
Joypad joypad;
int estado;
void setup() {
  size(800, 700);
  pantalla=new Pantalla();
  joypad=new Joypad();
  estado=MaquinaEstados.MENU;
}

void draw() {
  switch(estado) {
  case MaquinaEstados.MENU:
    background(0);
    println("estado menu");
    if (key==' ') {
      estado=MaquinaEstados.JUGANDO;
      println("se apreto espacio");
    }
    break;
  case MaquinaEstados.JUGANDO:
    background(0);
    pantalla.display();
    if (joypad.getLeftPressed()) {
      pantalla.getKitty().mover("left");
    }
    if (joypad.getRighPressed()) {
      pantalla.getKitty().mover("righ");
    }
    if (joypad.getFreeFall()) {
      pantalla.getKitty().mover("freeFall");
    }
    break;
  case MaquinaEstados.DERROTA:

    break;
  case MaquinaEstados.VICTORIA:

    break;
  }
}
void keyReleased() {
  if (key=='a') {
    joypad.setLeftPresssed(false);
  }
  if (key=='d') {
    joypad.setRighPressed(false);
  }
}
void keyPressed() {
  if (key=='a') {
    joypad.setLeftPresssed(true);
  }
  if (key=='d') {
    joypad.setRighPressed(true);
  }
  if (key=='s') {
    joypad.setFreeFall(true);
  }
}

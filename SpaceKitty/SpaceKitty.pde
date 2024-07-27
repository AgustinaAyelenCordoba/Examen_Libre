Pantalla pantalla;
Joypad joypad;
int estado;
Derrota derrota;
Victoria victoria;
Menu menu;
void setup() {
  size(800, 700);
  pantalla=new Pantalla();
  joypad=new Joypad();
  estado=MaquinaEstados.MENU;
  derrota=new Derrota();
  victoria=new Victoria();
  menu = new Menu();
}

void draw() {
  switch(estado) {
  case MaquinaEstados.MENU:
    background(0);
    menu.mostrar();
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
    if (key =='u') {
      estado=MaquinaEstados.DERROTA;
      println("se apreto u ");
    }
    if (key =='y') {
      estado=MaquinaEstados.VICTORIA;
      println("se apreto y ");
    }
    break;
  case MaquinaEstados.DERROTA:
    derrota.mostrar();
    if (key=='o') {
      estado=MaquinaEstados.JUGANDO;
     println("se apreto o "); 
    }
    break;
  case MaquinaEstados.VICTORIA:
    victoria.mostrar();
    
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

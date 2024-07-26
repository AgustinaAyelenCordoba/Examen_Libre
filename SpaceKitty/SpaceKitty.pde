Pantalla pantalla;
Joypad joypad;
void setup() {
  size(800, 700);
  pantalla=new Pantalla();
  joypad=new Joypad();
}

void draw() {
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

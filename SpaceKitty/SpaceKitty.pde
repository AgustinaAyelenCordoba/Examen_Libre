import gifAnimation.*;
import ddf.minim.*;


private Pantalla pantalla;
Joypad joypad;
private int estado;
private Escenario escenario;
private Derrota derrota;
private Victoria victoria;
private Menu menu;
private Minim sonido;
private AudioPlayer audioMenu;
private AudioPlayer audioJuego;
private AudioPlayer audioDerrota;
private AudioPlayer audioVictoria;
private Gif gif;
private PImage logo;
private int velocidadLogo;
private int presentacion;

void setup() {
  size(800, 700);
  pantalla=new Pantalla();
  joypad=new Joypad();
  estado=MaquinaEstados.LOGO;
  derrota=new Derrota();
  victoria=new Victoria();
  menu = new Menu();
  sonido=new Minim(this);
  audioMenu=sonido.loadFile("menu.mp3");
  audioJuego=sonido.loadFile("juego.mp3");
  audioDerrota=sonido.loadFile("derrota.mp3");
  audioVictoria=sonido.loadFile("victoria.mp3");
  gif= new Gif(this, "escenario.gif");
  escenario=new Escenario();
  logo = loadImage("logo.png");
  presentacion=0;
  velocidadLogo=int(300*Time.getDeltaTime(frameRate));
}

void draw() {
  switch(estado) {
  case MaquinaEstados.LOGO:
    tint(presentacion);
    presentacion+=velocidadLogo;
    image(logo, 0, 0, width, height);
    if (presentacion>255) {
      velocidadLogo*=-1;
    }
    if (presentacion<0) {
      estado=MaquinaEstados.MENU;
      noTint();
    }
    break;
  case MaquinaEstados.MENU:
    audioMenu.play();
    if (audioMenu.position()>=audioMenu.length()) {
      audioMenu.rewind();
    }
    menu.mostrar();
    println("estado menu");
    if (key==' ') {
      estado=MaquinaEstados.JUGANDO;
      audioMenu.pause();
      println("se apreto espacio");
    }
    break;
  case MaquinaEstados.JUGANDO:
    escenario.mostrar();
    audioJuego.play();
    if (audioJuego.position()>=audioJuego.length()) {
      audioJuego.rewind();
    }
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
      audioDerrota.rewind();
      audioDerrota.play();
      audioJuego.rewind();
      audioJuego.pause();
      println("se apreto u ");
    }
    if (key =='y') {
      estado=MaquinaEstados.VICTORIA;
      audioJuego.pause();
      println("se apreto y ");
    }
    break;
  case MaquinaEstados.DERROTA:
    audioDerrota.play();
    derrota.mostrar();
    if (key=='o') {
      estado=MaquinaEstados.JUGANDO;
      audioJuego.play();
      println("se apreto o ");
    }
    break;
  case MaquinaEstados.VICTORIA:
    audioVictoria.play();
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

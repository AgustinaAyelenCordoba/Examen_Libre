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
private int seleccion;

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
  gif.play();
  escenario=new Escenario();
  logo = loadImage("logo.png");
  presentacion=0;
  velocidadLogo=int(300*Time.getDeltaTime(frameRate));
  seleccion=0;
  
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
    menu.mostrar();
    audioMenu.play();
    if (audioMenu.position()>=audioMenu.length()) {
      audioMenu.rewind();
    }
    selector("EMPEZAR");
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
    if (key=='s') {
      pantalla.getKitty().setVelocidad(new PVector(300*Time.getDeltaTime(frameRate), 300*Time.getDeltaTime(frameRate)));
    }
    if(pantalla.getGestorAsteroide().huboColisionFuego()){
    estado=MaquinaEstados.DERROTA;
      audioDerrota.rewind();
      audioDerrota.play();
      audioJuego.rewind();
      audioJuego.pause();
    }
    if(pantalla.getGestorAsteroide().huboColisionHielo()){
      
      estado=MaquinaEstados.DERROTA;
      audioDerrota.rewind();
      audioDerrota.play();
      audioJuego.rewind();
      audioJuego.pause();
    }
    
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
    if (pantalla.getNave().colicionNave()) {
      estado=MaquinaEstados.VICTORIA;
      audioVictoria.rewind();
      audioVictoria.play();
      audioJuego.pause();
    }

    if (pantalla.getKitty().getPosicion().y>height) {
      estado=MaquinaEstados.DERROTA;
      audioDerrota.rewind();
      audioDerrota.play();
      audioJuego.rewind();
      audioJuego.pause();
    }

    if (key =='u') {
      estado=MaquinaEstados.DERROTA;
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
    pantalla.getKitty().setPosicion(new PVector(width/2, height-650));
    pantalla.getKitty().setVelocidad(new PVector(300*Time.getDeltaTime(frameRate), 0*Time.getDeltaTime(frameRate)));
    selector("REINTETAR");
    
    if (key=='o') {
      estado=MaquinaEstados.JUGANDO;
      audioJuego.play();
      println("se apreto o ");
    }
    break;
  case MaquinaEstados.VICTORIA:
    audioVictoria.play();
    victoria.mostrar();
    selector("JUGAR");
    pantalla.getKitty().setPosicion(new PVector(width/2, height-650));
    pantalla.getKitty().setVelocidad(new PVector(300*Time.getDeltaTime(frameRate), 0*Time.getDeltaTime(frameRate)));
    break;
  }
}
void selector(String nombre) {
  textSize(40);
  if (seleccion==0) {
    fill(255);
    text(nombre, width-550, height-50);
  } else {
    fill(0);
    text(nombre, width-550, height-50);
  }
  if (seleccion==1) {
    fill(255);
    text("SALIR", width-300, height-50);
  } else {
    fill(0);
    text("SALIR", width-300, height-50);
  }
}
void keyReleased() {
  if (key=='a') {
    joypad.setLeftPresssed(false);
  }
  if (key=='d') {
    joypad.setRighPressed(false);
  }
  if (key==CODED) {
    if (keyCode==LEFT) {
      seleccion=(seleccion-1+2)%2;
    } else if (keyCode==RIGHT) {
      seleccion=(seleccion+1)%2;
    }
  }
  if (keyCode == ENTER) {
    if (seleccion==0) {
      audioMenu.pause();
      estado=MaquinaEstados.JUGANDO;
    } else if (seleccion==1) {
      exit();
    }
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

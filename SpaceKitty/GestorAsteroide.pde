class GestorAsteroide {
  private  AsteroideFuego[] astFuego;
  private AsteroideHielo[] astHielo;


  GestorAsteroide() {
    astFuego=new AsteroideFuego[2];
    astHielo=new AsteroideHielo[2];
  }

  void crearAsteroide() {
    for (int i =0; i<astFuego.length; i++) {
      astFuego[i]=new AsteroideFuego();
      for (int j =0; j<astHielo.length; j++) {
        astHielo[j]=new AsteroideHielo();
      }
  }
  astFuego[0].setPosicion(new PVector(width-100, 100));
    astFuego[1].setPosicion(new PVector(width-200, 200));

    astFuego[0].setVelocidad(new PVector(-100*Time.getDeltaTime(frameRate), 100*Time.getDeltaTime(frameRate)));
    astFuego[1].setVelocidad(new PVector(100*Time.getDeltaTime(frameRate), 100*Time.getDeltaTime(frameRate)));

    astHielo[0].setPosicion(new PVector(width -300, 300));
    astHielo[1].setPosicion(new PVector(width-400, 400));

    astHielo[0].setVelocidad(new PVector(-100*Time.getDeltaTime(frameRate), 100*Time.getDeltaTime(frameRate)));
    astHielo[1].setVelocidad(new PVector(100*Time.getDeltaTime(frameRate), 100*Time.getDeltaTime(frameRate)));
}

void display() {
    for (int i=0; i<astFuego.length; i++) {
      astFuego[i].mover();
      astFuego[i].display();
      for (int j=0; j<astHielo.length; j++) {
        astHielo[j].mover();
        astHielo[j].display();
      }
    }
  }







}

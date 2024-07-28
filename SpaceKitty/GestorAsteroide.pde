class GestorAsteroide {
  private  AsteroideFuego[] astFuego;
  private AsteroideHielo[] astHielo;
  private float distancia;
private boolean colisionFuego;
  private boolean colisionHielo;
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

  void colicionar(Kitty kitty) {
    for (int i =0; i<astFuego.length; i++) {
      distancia=dist(kitty.getPosicion().x, kitty.getPosicion().y, astFuego[i].getPosicion().x, astFuego[i].getPosicion().y);
      //line(kitty.getPosicion().x, kitty.getPosicion().y, astFuego[i].getPosicion().x, astFuego[i].getPosicion().y);
      if (distancia<45) {
        colisionFuego = true;
        println("hubo colicion fuego");
      }else{
      colisionFuego = false;
      }
      for (int j =0; j<astHielo.length; j++) {
        distancia=dist(kitty.getPosicion().x, kitty.getPosicion().y, astHielo[j].getPosicion().x, astHielo[j].getPosicion().y);
        // line(kitty.getPosicion().x, kitty.getPosicion().y, astHielo[j].getPosicion().x, astHielo[j].getPosicion().y);
        if (distancia<45) {
          colisionHielo = true;
          println("hubo colicion hielo");
        }else{
          colisionHielo = false;
        }
      }
    }
  }
  boolean huboColisionFuego(){
    return colisionFuego;
  }

  boolean huboColisionHielo() {
    return colisionHielo;
  }
}

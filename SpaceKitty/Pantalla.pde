class Pantalla {
  private Kitty kitty;
  private Nave nave;
  private GestorAsteroide gestorAst;
private Escenario escenario;
  private Derrota derrota;
  private Victoria victoria;
  
  Pantalla() {
    kitty=new Kitty();
    kitty.setPosicion(new PVector(width/2, height-650));
    kitty.setVelocidad(new PVector(100*Time.getDeltaTime(frameRate), 300*Time.getDeltaTime(frameRate)));
    kitty.setVidas(6);
    nave=new Nave();
    nave.setPosicion(new PVector(width/2, height-100));
    nave.setVelocidad(new PVector(300*Time.getDeltaTime(frameRate), 300*Time.getDeltaTime(frameRate)));
 gestorAst=new GestorAsteroide();
    gestorAst.crearAsteroide();
    victoria=new Victoria();
    derrota=new Derrota();
    escenario=new Escenario();
}
  void display() {
    kitty.display();
    nave.display();
    nave.mover();
    gestorAst.display();
    gestorAst.colicionar(kitty);
  }

  void setKitty(Kitty kitty) {
    this.kitty=kitty;
  }
  Kitty getKitty() {
    return this.kitty;
  }

  void setNave(Nave nave) {
    this.nave=nave;
  }

  Nave getNave() {
    return this.nave;
  }

  void setGestorAsteroide (GestorAsteroide gestorAst) {
    this.gestorAst=gestorAst;
  }

  GestorAsteroide getGestorAsteroide() {
    return this.gestorAst;
  }
  void setDerrota(Derrota derrota){
  this.derrota=derrota;
  }
  
  Derrota getDerrota(){
  return this.derrota;
  }
 
  void setVictoria(Victoria victoria){
    this.victoria=victoria;
  }
  
  Victoria getVictoria(){
    return this.victoria;
  }
}

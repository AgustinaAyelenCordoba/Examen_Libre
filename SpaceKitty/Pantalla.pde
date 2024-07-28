class Pantalla {
  private Kitty kitty;
  private Nave nave;
  private GestorAsteroide gestorAst;

  
  Pantalla() {
    kitty=new Kitty();
    kitty.setPosicion(new PVector(width/2, height-660));
    kitty.setVelocidad(new PVector(250*Time.getDeltaTime(frameRate), 300*Time.getDeltaTime(frameRate)));
    kitty.setVidas(6);
    nave=new Nave();
    nave.setPosicion(new PVector(width/2, height-100));
    nave.setVelocidad(new PVector(350*Time.getDeltaTime(frameRate), 350*Time.getDeltaTime(frameRate)));
 gestorAst=new GestorAsteroide();
    gestorAst.crearAsteroide();
    
}
  void display() {
    kitty.display();
    nave.display();
    nave.mover();
    nave.colicionNave(kitty);
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
}
  
  

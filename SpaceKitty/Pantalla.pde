class Pantalla {
  private Kitty kitty;
  private Nave nave;
  private GestorAsteroide gestorAst;

  Pantalla() {
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

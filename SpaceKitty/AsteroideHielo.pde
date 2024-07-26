class AsteroideHielo extends Asteroide implements IMoveable{
private SpriteAstHielo spriteAstHielo;
  AsteroideHielo() {
    spriteAstHielo=new SpriteAstHielo();
  }

  void congelar() {
  }
  void display() {
    spriteAstHielo.setPosicion(new PVector(this.posicion.x, this.posicion.y));
    spriteAstHielo.display();
  }
  void mover() {
    posicion.x+=velocidad.x;
    if (posicion.x>width-15||posicion.x<15) {
      velocidad.x*=-1;
    }
  }
}

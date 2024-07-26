class AsteroideFuego extends Asteroide implements IMoveable {
private SpriteAstFuego spriteAstFuego;
  AsteroideFuego() {
    spriteAstFuego=new SpriteAstFuego();
  }
void display() {
    spriteAstFuego.setPosicion(new PVector(this.posicion.x, this.posicion.y));
    spriteAstFuego.display();
  }
  
  void quemar() {
  }
  void mover() {
    posicion.x+=velocidad.x;
    if (posicion.x>width-15||posicion.x<15) {
      velocidad.x*=-1;
    }
  }
}

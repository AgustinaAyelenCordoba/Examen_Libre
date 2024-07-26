class Nave extends GameObject implements IMoveable {
  private SpriteNave spriteNave;

  Nave() {
    spriteNave=new SpriteNave();
  }

  void display() {
    spriteNave.setPosicion(this.posicion);
    spriteNave.display();
  }
  void mover() {
    posicion.x+=velocidad.x;
    if (posicion.x>width-50 || posicion.x<50) {
      velocidad.x*=-1;
    }
  }
  void setSpriteNave(SpriteNave spriteNave) {
    this.spriteNave=spriteNave;
  }

  SpriteNave getSpriteNave() {
    return this.spriteNave;
  }
}

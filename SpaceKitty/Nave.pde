class Nave extends GameObject implements IMoveable {
  private SpriteNave spriteNave;
private float distancia;
  private boolean colicionNave;
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
  
  
 void colicionNave(Kitty kitty) {
    distancia=dist(kitty.getPosicion().x, kitty.getPosicion().y, this.posicion.x, this.posicion.y);
    line(kitty.getPosicion().x, kitty.getPosicion().y, this.posicion.x, this.posicion.y);
    if (distancia<75) {
      println("xddd si ubo colicion");
      colicionNave=true;
    } else {
      colicionNave=false;
    }
  }
  boolean colicionNave() {
    return colicionNave;
  } 
  
  
  
  void setSpriteNave(SpriteNave spriteNave) {
    this.spriteNave=spriteNave;
  }

  SpriteNave getSpriteNave() {
    return this.spriteNave;
  }
}

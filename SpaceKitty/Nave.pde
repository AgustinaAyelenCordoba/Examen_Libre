class Nave extends GameObject implements IMoveable{
  private PImage imagen;

  Nave() {
  }

  void display() {
  }
  void mover() {
  }
  void setImagen(PImage imagen) {
    this.imagen=imagen;
  }

  PImage getImagen() {
    return this.imagen;
  }
}

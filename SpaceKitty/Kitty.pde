class Kitty extends GameObject implements IMoveable {
  private int vidas;
  private ImageComponent imagen;
  Kitty() {
  }

  void display() {
  }

  void mover() {
  }

  void setVidas(int vidas) {
    this.vidas=vidas;
  }
  int getVidas() {
    return this.vidas;
  }
  
  void setImagen(ImageComponent imagen){
    this.imagen=imagen;
  }
  
  ImageComponent getImagen(){
  return this.imagen;
  }
}

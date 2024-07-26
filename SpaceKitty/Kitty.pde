class Kitty extends GameObject {
  private int vidas;
  private ImageComponent imagen;

  //zona de constructores

  Kitty() {
    imagen=new ImageComponent("Astronauta.png");
  }
  Kitty(PVector posicion, PVector velocidad, int vidas, ImageComponent imagen) {
    this.posicion=posicion;
    this.velocidad=velocidad;
    this.vidas=vidas;
    this.imagen=imagen;
  }
  void display() {
    imageMode(CENTER);
    imagen.displayImage(new PVector(this.posicion.x, this.posicion.y), 50, 50);
  }

  void mover(String direccion) {
    switch(direccion) {
    case"left":
      posicion.x-=velocidad.x;
      break;
    case"righ":
      posicion.x+=velocidad.x;
      break;
    case"freeFall":
      posicion.y+=velocidad.y;
      break;
    }
  }

  void setVidas(int vidas) {
    this.vidas=vidas;
  }
  int getVidas() {
    return this.vidas;
  }

  void setImagen(ImageComponent imagen) {
    this.imagen=imagen;
  }

  ImageComponent getImagen() {
    return this.imagen;
  }
}

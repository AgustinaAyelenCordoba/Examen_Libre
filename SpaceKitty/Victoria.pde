class Victoria {
  private PImage imagen;

  Victoria() {
    imagen=loadImage("victoria.png");
  }

  void mostrar() {
    image(imagen, width/2, height/2, width, height);
  }
}

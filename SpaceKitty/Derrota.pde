class Derrota {
  private PImage imagen;

  Derrota() {
    imagen=loadImage("derrota.png");
  }

  void mostrar() {
    image(imagen, width/2, height/2, width, height);
  }
}

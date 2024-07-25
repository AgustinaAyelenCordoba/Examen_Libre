class ImageComponent {
  private PImage imagen;

  public ImageComponent(String imagenNombre) {
    imagen = loadImage(imagenNombre);
  }

  public void displayImage(PVector posicion) {
    image(imagen, posicion.x, posicion.y);
  }

  public void displayImage(PVector posicion, int ancho, int alto) {
    image(imagen, posicion.x, posicion.y, ancho, alto);
  }
}

class Menu {
  private PImage imagen;
  Menu() {
    imagen=loadImage("menu.png");
  }
  void mostrar() {
    image(imagen,0,0 , width, height);
  }
}

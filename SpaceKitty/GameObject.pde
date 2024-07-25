abstract class GameObject {
  protected PVector posicion;
  protected PVector velocidad;

  GameObject() {
  }

  void display() {
  }
  void setPosicion(PVector posicion) {
    this.posicion=posicion;
  }
  PVector getPosicion() {
    return this.posicion;
  }

  void setVelocidad(PVector velocidad) {
    this.velocidad=velocidad;
  }
  PVector getVelocidad() {
    return this.velocidad;
  }
}

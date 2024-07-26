class SpriteNave {
  private PImage sprite;
  private int widthFrame;//ancho del cuadro
  private int heightFrame;//alto del cuadro
  private int xFrame;//posicion x
  private int yFrame;//posicion y
  private int cantFrames;//cantidad de cuadro de la imagen
  private int contFrames;//contador de cuadros de imagen
  private PVector posicion;
  private PVector velocidad;

  SpriteNave() {

    sprite =requestImage("nave.png");
    widthFrame=6768/12;
    heightFrame =442;
    xFrame=0;
    yFrame=0;
    cantFrames=12;
    contFrames=1;
  }


  void display() {
    imageMode(CENTER);
    if (contFrames <= cantFrames) {
      image(sprite.get(xFrame, yFrame, widthFrame, heightFrame), posicion.x, posicion.y, 100, 100);
      xFrame = xFrame+widthFrame;
      contFrames++;
      if (xFrame >= sprite.width) {
        xFrame=0;
        contFrames=1;
      }
    }
  }


  void setWidthFrame (int widthFrame) {
    this.widthFrame=widthFrame;
  }
  int getWidthFrame() {
    return this.widthFrame;
  }
  void setHeightFrame(int heightFrame) {
    this.heightFrame=heightFrame;
  }
  int getHeightFrame() {
    return this.heightFrame;
  }
  void setXFrame(int xFrame) {
    this.xFrame=xFrame;
  }
  int getXframe() {
    return this.xFrame;
  }
  void setYFrame(int yFrame) {
    this.yFrame=yFrame;
  }
  int getYFrame() {
    return this.yFrame;
  }
  void setCantFrames(int cantFrames) {
    this.cantFrames=cantFrames;
  }
  int getCantFrames() {
    return this.cantFrames;
  }
  void setContFrames(int contFrames) {
    this.contFrames=contFrames;
  }
  int getContFrames() {
    return this.contFrames;
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

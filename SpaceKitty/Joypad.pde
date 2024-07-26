class Joypad {
  private boolean leftPressed;
  private boolean righPressed;
  private boolean freeFall;

  Joypad() {
  }

  void setLeftPresssed(boolean leftPressed) {
    this.leftPressed=leftPressed;
  }
  boolean getLeftPressed() {
    return this.leftPressed;
  }

  void setRighPressed(boolean righPressed) {
    this.righPressed=righPressed;
  }
  boolean getRighPressed() {
    return this.righPressed;
  }

  void setFreeFall(boolean freeFall) {
    this.freeFall=freeFall;
  }

  boolean getFreeFall() {
    return this.freeFall;
  }
}

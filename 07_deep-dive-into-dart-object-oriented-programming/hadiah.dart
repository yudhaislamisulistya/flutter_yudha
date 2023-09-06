class Hadiah<E> {
  var isi;

  Hadiah(E isi) {
    this.isi = isi;
  }

  void tipeDataIsi() {
    print(isi.runtimeType);
  }
}

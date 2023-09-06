class Kendaraan {
  int? roda; // declare public variable, initially null
  int? pintu;
  int _bensin = 0; // declare private variable, initially 0
  final _waktuPembuatan = DateTime.now();
  static const _pabrikan = "Toyota";

  /// Constructor: using `Classname`
  Kendaraan(this.roda, this.pintu);

  /// Constructor: using `Classname.identifier`
  /// It is also called "named constructor"
  Kendaraan.defaultKendaraan() : this(4, 4);

  Kendaraan.fromJson(Map<String, dynamic> json) {
    this.roda = json['roda'];
    this.pintu = json['pintu'];
  }

  void maju() {
    this._bensin -= 1;
    print('Kendaraan maju');
  }

  void isiBensin(int liter) {
    this._bensin += liter;
    print('Mengisi bensin sebanyak: $liter liter');
  }

  void lihatJumlahBensin() {
    print('Jumlah bensin saat ini: ${this._bensin} liter');
  }

  DateTime get waktuPembuatan => this._waktuPembuatan;

  void get pabrikan => print('Pabrikan: ${Kendaraan._pabrikan}');

  @override
  String toString() {
    return 'Kendaraan{roda: ${this.roda}, pintu: ${this.pintu}}';
  }
}

// inheritance
class Mobil extends Kendaraan {
  Mobil() : super(4, 4);

  @override
  String toString() {
    return 'Mobil{roda: ${this.roda}, pintu: ${this.pintu}}';
  }

  @override
  void maju() {
    print('Mobil maju');
  }

  /// It's not strictly necessary for the code to function correctly, but it's
  /// a good practice and helps catch potential errors during development.
  void isiBahanBakar(int liter) {
    this._bensin += liter;
    print('Mobil mengisi bahan bakar');
  }
}

class Bus implements Kendaraan {
  int? roda; // declare public variable, initially null
  int? pintu;
  int _bensin = 0; // declare private variable, initially 0
  final _waktuPembuatan = DateTime.now();
  static const _pabrikan = "Toyota";

  @override
  void isiBensin(int liter) {
    this._bensin += liter;
    print('Bensin bus terisi sebanyak: $liter liter');
  }

  @override
  void lihatJumlahBensin() {
    this.lihatJumlahBensin();
  }

  @override
  void maju() {
    this.maju();
  }

  DateTime get waktuPembuatan => this._waktuPembuatan;

  void get pabrikan => print('Pabrikan: ${Bus._pabrikan}');
}

// class Truk extends Kendaraan {
//   int? roda;

//   Truk(this.roda);

//   Truk.fromJson(Map<String, dynamic> json) {
//     this.roda = json['roda'];
//   }

//   Truk.defaultTruk() : this(8);
// }

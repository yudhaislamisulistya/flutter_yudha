void main(List<String> args) {
  // menampilkan hello world di Terminal
  print("Hello world");

  /**
   * inisiasi variabel menggunakan keyword 'var'
   * bebas meng-assign value dengan tipe data apapun
   */
  var a;
  a = 1;
  print(a);
  var b = 2;
  print(b);

  /**
   * inisiasi variabel dengan tipe data
   * value baru harus memiliki tipe data yang sama dengan value sebelumnya
  */
  String c = "3";
  print(c);
  double d = 4.0;
  print(d);
  int e = 5;
  print(e);
  bool f = false;
  print(f);

  /**
   * operasi
   * 
   */
  var tambah = a + b;
  print(tambah);
  var kurang = a - b;
  print(kurang);
  var kali = a * b;
  print(kali);
  var bagi = a / b;
  print(bagi);
  a += b;
  print(a);
  print("hello" + " world");
  print(1 + 2);
  print(1 + 1.0);
  // print(1 + "2");

  // komparasi
  print(1 == "1");

  /**
   * logikal
   */
  print(c == "3" && d == 5);
  print(c == "3" || d == 4);
}

// check email
bool checkEmail(String email) {
  return email.contains("@");
}

// password validator
bool checkPassword(String password) {
  // password must contain alphanumeric
  return password.contains(RegExp(r'[a-zA-Z0-9]'));
}

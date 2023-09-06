class Customer {
  late String _email;
  late String firstName;
  late String middleName;
  late String lastName;
  int _age = 0;

  Customer(this._email, this.firstName, this.lastName, [this.middleName = ""]);

  Customer.defaultCustomer() {
    this._email = "johndoe@gmail.com";
    this.firstName = "john";
    this.middleName = "";
    this.lastName = "doe";
    this._age = 0;
  }

  String get email => _email; // getter

  int get age => _age;

  void set age(int age) {
    if (age > 17) {
      this._age = age;
    } else {
      print("Di bawah umur");
    }
  }

  void displayCustomerName() {
    print("$firstName $middleName $lastName");
  }
}

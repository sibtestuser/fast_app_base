class Bank {
  final String name;
  final String logoImagePath;

  Bank(this.name, this.logoImagePath);

  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(Object other) {
    if (other is Bank && other.name == this.name) {
      return true;
    }
    return false;
  }
}

class Freund {
  String name;
  int age;
  String hobby;

  Freund(this.name, this.age, this.hobby);

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "age": age,
      "hobby": hobby,
    };
  }
}

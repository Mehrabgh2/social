class Dob {
  String date;
  int age;

  Dob({required this.date, required this.age});

  factory Dob.fromJson(Map<String, dynamic> json) {
    final date = json['date'];
    final age = json['age'];
    return Dob(date: date, age: age);
  }
}

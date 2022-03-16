import 'dart:convert';

class Dob {
  String date;
  int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    final date = json['date'];
    final age = json['age'];
    return Dob(date: date, age: age);
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'age': age,
    };
  }

  factory Dob.fromMap(Map<String, dynamic> map) {
    return Dob(
      date: map['date'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }
}

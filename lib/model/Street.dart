import 'dart:convert';

class Street {
  int number;
  String name;

  Street({required this.number, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory Street.fromMap(Map<String, dynamic> map) {
    return Street(
      number: map['number']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  factory Street.fromJson(Map<String, dynamic> json) {
    final number = json['number'];
    final name = json['name'];
    return Street(number: number, name: name);
  }
}

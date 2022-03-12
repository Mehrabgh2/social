class Street {
   int number;
   String name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    final number = json['number'];
    final name = json['name'];
    return Street(number: number, name: name);
  }
}

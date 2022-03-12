class Name {
  String title;
  String first;
  String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final first = json['first'];
    final last = json['last'];
    return Name(title: title, first: first, last: last);
  }
}

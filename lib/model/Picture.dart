class Picture {
  String medium;
  String thumbnail;

  Picture({required this.medium, required this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    final medium = json['medium'];
    final thumbnail = json['thumbnail'];
    return Picture(medium: medium, thumbnail: thumbnail);
  }
}

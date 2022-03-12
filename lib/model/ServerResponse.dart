class ServerResponse {
  int? code;
  String? message;

  ServerResponse({required this.message, required this.code});

  ServerResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }
}

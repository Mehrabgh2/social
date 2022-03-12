import 'package:social/model/Profile.dart';

class ServerMe {
  Profile? profile;
  int? code;

  ServerMe({required this.profile, required this.code});

  ServerMe.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
}

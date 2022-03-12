import 'package:social/model/Profile.dart';

class ServerUser {
  String? accessToken;
  int? tokenExpire;
  Profile? profile;
  int? code;

  ServerUser(
      {required this.accessToken, required this.profile, required this.code});

  ServerUser.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenExpire = json['expires_in'];
    code = json['code'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
}

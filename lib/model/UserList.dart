import 'package:social/model/User.dart';

class UserList {
  List<User> results;

  UserList({required this.results});

  factory UserList.fromJson(Map<String, dynamic> json) {
    final results = <User>[];
    json['results'].forEach((v) {
      results.add(User.fromJson(v));
    });
    return UserList(results: results);
  }
}

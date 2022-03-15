import 'package:social/db/Boxes.dart';
import 'package:social/model/User.dart';

class FollowedDBProvider {
  FollowedDBProvider._();
  static final FollowedDBProvider instance = FollowedDBProvider._();

  List<User> getFollowings() {
    List<User> users = [];
    for (Map<dynamic, dynamic> element in Boxes.getFollowingBox().values) {
      Map<String, dynamic> map = Map.fromEntries(element.entries
          .map((entry) => MapEntry(entry.key.toString(), entry.value)));
      users.add(User.fromMap(map));
    }
    return users;
  }

  bool containUser(String email) {
    for (User item in getFollowings()) {
      if (item.email == email) return true;
    }
    return false;
  }

  void addFollowing(User user) async {
    Boxes.getFollowingBox().add(user.toMap());
  }

  void removeFollowing(String email) async {
    int index = getFollowings().indexWhere((element) => element.email == email);
    Boxes.getFollowingBox().deleteAt(index);
  }
}
